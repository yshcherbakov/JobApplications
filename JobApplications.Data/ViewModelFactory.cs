using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using JobApplications.Model.Applicant;
using JobApplications.Model.Employer;

namespace JobApplications.Data
{
    public class ViewModelFactory : IViewModelFactory
    {
        public IEnumerable<AcceptableApplicationsModel> CreateAcceptableApplicationsModel(ObjectResult<spGetAcceptedApplications_Result> entities)
        {
            var result = new List<AcceptableApplicationsModel>();

            if (entities == null) 
                return result;

            result.AddRange(entities.Select(entity => new AcceptableApplicationsModel
            {
                ApplicantName = entity.ApplicantName, 
                ApplicationId = entity.ApplicationID, 
                CreatedByUser = entity.CreatedByUser, 
                SubmittedDateTime = entity.SubmittedDateTime,
            }));

            return result;
        }

        public ApplicationModel CreateExistingApplicationModel(Application entity, spGetApplicationNextQuestion_Result nextQuestionEntity)
        {
            var result = new ApplicationModel()
            {
                ApplicationId = entity.ID,
                ApplicantName = entity.ApplicantName,
                CreatedByUser = entity.CreatedByUser,
                CreatedDateTime = entity.CreatedDateTime,
                SubmittedDateTime = entity.SubmittedDateTime,
                Qualifications = (from q in entity.Qualifications
                                 select new ApplicationQualificationModel()
                                 {
                                     AnswerId = q.AnswerID,
                                     AnswerText = q.Answer.Text,
                                     QualificationId = q.ID,
                                     QuestionDisplayOrder = q.Question.DisplayOrder,
                                     QuestionId = q.QuestionID,
                                     QuestionText = q.Question.Text,
                                 }).ToList()
            };

            if (nextQuestionEntity != null)
            {
                result.NextQuestionId = nextQuestionEntity.ID;
                result.NextQuestionDisplayOrder = nextQuestionEntity.DisplayOrder;
                result.NextQuestionText = nextQuestionEntity.Text;
            }

            return result;
        }

        public ApplicationQualificationModel CreateApplicationQualificationModel(spGetApplicationNextQuestion_Result entity)
        {
            return new ApplicationQualificationModel
            {
                QuestionId = entity.ID,
                QuestionDisplayOrder = entity.DisplayOrder,
                QuestionText = entity.Text,
                AnswerText = String.Empty,
            };
        }

        public List<AnswerModel> CreateAnswerModelList(IQueryable<Answer> entities)
        {
            if (entities == null) return null;
            return (from entity in entities select new AnswerModel
            {
                Id = entity.ID,
                QuestionId = entity.QuestionID,
                DisplayOrder = entity.DisplayOrder,
                Text = entity.Text,
                IsAcceptable = entity.IsAcceptable,
            }).ToList();
        }
    }
}
