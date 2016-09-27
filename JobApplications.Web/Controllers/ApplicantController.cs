using System;
using System.Reflection;
using System.Web.Mvc;
using JobApplications.Data;
using JobApplications.Model.Applicant;
using log4net;
using WebMatrix.WebData;

namespace JobApplications.Web.Controllers
{
    [Authorize(Roles = "Applicant")]
    public class ApplicantController : Controller
    {
        private static readonly ILog Log = LogManager.GetLogger(MethodBase.GetCurrentMethod().DeclaringType);

        private readonly IJobApplicationsRepository _repository;

        public ApplicantController(IJobApplicationsRepository repository)
        {
            _repository = repository;
        }
        
        //
        // GET: /Applicant/

        [HttpGet]
        public ActionResult Index()
        {
            if (User == null || User.Identity == null || string.IsNullOrWhiteSpace(User.Identity.Name))
                return View();

            var userId = WebSecurity.GetUserId(User.Identity.Name);
            var model = _repository.GetExistingApplicationModel(userId);

            if (model.ApplicationId == 0)
            {
                return RedirectToAction("NewApplication");
            }

            return View(model);
        }

        //
        // POST: /Applicant/SaveAnswer

        [HttpPost]
        public ActionResult SaveAnswer(ApplicationModel model)
        {
            try
            {
                _repository.SubmitApplicationAnswer(model.ApplicationId, model.NextQuestionId,
                    model.NextQuestionAnswerId);
            }
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = ex.Message;
                Log.Error(ex.Message);
            }
            return RedirectToAction("Index");
        }

        //
        // POST: /Applicant/SubmitApplication

        [HttpPost]
        public ActionResult SubmitApplication(ApplicationModel model)
        {
            try
            {
                _repository.SubmitApplication(model.ApplicationId);
            }
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = ex.Message;
                Log.Error(ex.Message);
            }
            
            return RedirectToAction("Index");
        }

        //
        // POST: /Applicant/NewApplication

        public ActionResult NewApplication()
        {
            return View();
        }

        [HttpPost]
        public ActionResult CreateApplication(ApplicationModel model)
        {
            var userId = WebSecurity.GetUserId(User.Identity.Name);

            try
            {
                _repository.CreateApplication(model.ApplicantName, userId);

                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = ex.Message;
                Log.Error(ex.Message);
            }

            return RedirectToAction("Index");
        }

        //
        // POST: /Applicant/DeleteApplication

        [HttpPost]
        public ActionResult DeleteApplication(ApplicationModel model)
        {
            try
            {
                _repository.DeleteApplication(model.ApplicationId);
            }
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = ex.Message;
                Log.Error(ex.Message);
            }
            return RedirectToAction("Index");
        }
    }
}
