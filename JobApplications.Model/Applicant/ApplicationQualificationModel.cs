namespace JobApplications.Model.Applicant
{
    public class ApplicationQualificationModel
    {
        public int QualificationId { get; set; }
        public int QuestionId { get; set; }  
        public string QuestionText { get; set; }
        public int? QuestionDisplayOrder { get; set; }
        public int AnswerId { get; set; }
        public string AnswerText { get; set; }
    }
}
