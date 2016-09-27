using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace JobApplications.Model.Applicant
{
    public class ApplicationModel
    {
        [Display(Name = "Applicant Name")]
        public string ApplicantName { get; set; }

        public int ApplicationId { get; set; }
        public DateTime CreatedDateTime { get; set; }
        public int CreatedByUser { get; set; }
        public DateTime? SubmittedDateTime { get; set; }

        public List<ApplicationQualificationModel> Qualifications { get; set; }
        
        public int NextQuestionId { get; set; }
        public int? NextQuestionDisplayOrder { get; set; }
        public string NextQuestionText { get; set; }
        public int NextQuestionAnswerId { get; set; }
        public List<AnswerModel> NextQuestionValidAnswers { get; set; }
    }
}
