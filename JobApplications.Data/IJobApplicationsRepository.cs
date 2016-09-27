using System;
using System.Collections.Generic;
using JobApplications.Model.Employer;
using JobApplications.Model.Applicant;

namespace JobApplications.Data
{
    public interface IJobApplicationsRepository
    {
        /// <summary>
        /// Return list of acceptable applications.
        /// </summary>
        /// <param name="fromDateTime"></param>
        /// <param name="toDateTime"></param>
        /// <returns></returns>
        IEnumerable<AcceptableApplicationsModel> GetAcceptedApplications(DateTime? fromDateTime = null, DateTime? toDateTime = null);

        /// <summary>
        /// Return existing application for a user if any or null.
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        ApplicationModel  GetExistingApplicationModel(int userId);

        /// <summary>
        /// Save answer for an application question.
        /// </summary>
        /// <param name="applicationId"></param>
        /// <param name="questionId"></param>
        /// <param name="answerId"></param>
        void SubmitApplicationAnswer(int applicationId, int questionId, int answerId);

        /// <summary>
        /// Submit completed application.
        /// </summary>
        /// <param name="applicationId"></param>
        void SubmitApplication(int applicationId);

        /// <summary>
        /// Create a new job application for a user.
        /// </summary>
        /// <param name="applicantName"></param>
        /// <param name="userId"></param>
        /// <returns></returns>
        int CreateApplication(string applicantName, int userId);

        /// <summary>
        /// Delete application and all answers.
        /// </summary>
        /// <param name="applicationId"></param>
        void DeleteApplication(int applicationId);
    }
}
