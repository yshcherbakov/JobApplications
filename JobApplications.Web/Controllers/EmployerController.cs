using System;
using System.Reflection;
using System.Web.Mvc;
using JobApplications.Data;
using log4net;

namespace JobApplications.Web.Controllers
{
    public class EmployerController : Controller
    {
        private static readonly ILog Log = LogManager.GetLogger(MethodBase.GetCurrentMethod().DeclaringType);

        private readonly IJobApplicationsRepository _repository;

        public EmployerController(IJobApplicationsRepository repository)
        {
            _repository = repository;
        }

        //
        // GET: /Employer/

        [Authorize(Roles = "Employer")]
        public ActionResult Index()
        {
            try
            {
                var model = _repository.GetAcceptedApplications();
                
                return View(model);
            }
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = ex.Message;
                Log.Error(ex.Message);
            }
            
            return View();
        }

    }
}
