using System;

namespace JobApplications.Model.Employer
{
    public class AcceptableApplicationsModel
    {
        public int ApplicationId { get; set; }
        public string ApplicantName { get; set; }
	    public DateTime? SubmittedDateTime { get; set; }
        public int CreatedByUser { get; set; }
    }
}
