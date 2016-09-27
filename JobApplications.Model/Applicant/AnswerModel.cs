namespace JobApplications.Model.Applicant
{
    public class AnswerModel
    {
        public int Id { get; set; }
        public int QuestionId { get; set; }
        public string Text { get; set; }
        public int DisplayOrder { get; set; }
        public bool IsAcceptable { get; set; }
    }
}
