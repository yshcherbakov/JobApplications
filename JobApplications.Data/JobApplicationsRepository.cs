using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using JobApplications.Model.Applicant;
using JobApplications.Model.Employer;
using log4net;

namespace JobApplications.Data
{
    public class JobApplicationsRepository : IJobApplicationsRepository
    {
        private static readonly ILog Log = LogManager.GetLogger(MethodBase.GetCurrentMethod().DeclaringType);

        private readonly IViewModelFactory _factory;

        private readonly JobApplicationsEntities _context = new JobApplicationsEntities();

        public JobApplicationsRepository(IViewModelFactory factory)
        {
            _factory = factory;
        }

        public IEnumerable<AcceptableApplicationsModel> GetAcceptedApplications(DateTime? fromDateTime = null, DateTime? toDateTime = null)
        {
            var items =_context.spGetAcceptedApplications(fromDateTime, toDateTime);
            return _factory.CreateAcceptableApplicationsModel(items);
        }

        public ApplicationModel GetExistingApplicationModel(int userId)
        {
            var existingApplication = 
                (from a in _context.Applications where a.CreatedByUser == userId select a).FirstOrDefault();

            if (existingApplication == null)
            {
                return new ApplicationModel();
            }

            var o = _context.spGetApplicationNextQuestion(existingApplication.ID).ToArray();

            var nextQuestion = o.Any() ? o[0] : null;

            var result = _factory.CreateExistingApplicationModel(existingApplication, nextQuestion);

            if (result.NextQuestionId > 0)
            {
                result.NextQuestionValidAnswers = _factory.CreateAnswerModelList((from a in _context.Answers where a.QuestionID.Equals(result.NextQuestionId) select a));
            }

            return result;
        }

        public void SubmitApplicationAnswer(int applicationId, int questionId, int answerId)
        {
            _context.spSubmitApplicationAnswer(applicationId, questionId, answerId);
        }

        public void SubmitApplication(int applicationId)
        {
            _context.spSubmitApplication(applicationId, DateTime.Now);
        }

        public int CreateApplication(string applicantName, int userId)
        {
            return _context.spCreateApplication(applicantName, userId, DateTime.Now);
        }

        public void DeleteApplication(int applicationId)
        {
            _context.spDeleteApplication(applicationId);
        }
    }
}
