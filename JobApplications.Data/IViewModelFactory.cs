using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using JobApplications.Model.Applicant;
using JobApplications.Model.Employer;

namespace JobApplications.Data
{
    public interface IViewModelFactory
    {
        /// <summary>
        /// Map spGetAcceptedApplications results into AcceptableApplicationsModel object.
        /// </summary>
        /// <param name="entities"></param>
        /// <returns></returns>
        IEnumerable<AcceptableApplicationsModel> CreateAcceptableApplicationsModel(ObjectResult<spGetAcceptedApplications_Result> entities);

        /// <summary>
        /// Map spGetApplicationNextQuestion results into ApplicationModel object.
        /// </summary>
        /// <param name="entity"></param>
        /// <param name="nextQuestionEntity"></param>
        /// <returns></returns>
        ApplicationModel CreateExistingApplicationModel(Application entity, spGetApplicationNextQuestion_Result nextQuestionEntity);

        /// <summary>
        /// Map spGetApplicationNextQuestion results into ApplicationQualificationModel object. 
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        ApplicationQualificationModel CreateApplicationQualificationModel(spGetApplicationNextQuestion_Result entity);

        /// <summary>
        /// Map list of Answer entities into AnswerModel list. 
        /// </summary>
        /// <param name="entities"></param>
        /// <returns></returns>
        List<AnswerModel> CreateAnswerModelList(IQueryable<Answer> entities);
    }
}
