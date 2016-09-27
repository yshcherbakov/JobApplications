using System.Web.Mvc;
using JobApplications.Data;
using JobApplications.Model.Applicant;
using JobApplications.Web.Controllers;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace JobApplications.Web.Tests.Controllers
{
    [TestClass()]
    public class ApplicantControllerTests
    {
        [TestMethod()]
        public void ApplicantControllerTest()
        {
            // Arrange
            ViewModelFactory factory = new ViewModelFactory();

            JobApplicationsRepository repository = new JobApplicationsRepository(factory);

            ApplicantController controller = new ApplicantController(repository);

            // Act
            ViewResult result = controller.Index() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }

        [TestMethod()]
        public void SaveAnswerTest()
        {
            // Arrange
            ViewModelFactory factory = new ViewModelFactory();

            JobApplicationsRepository repository = new JobApplicationsRepository(factory);

            ApplicantController controller = new ApplicantController(repository);

            ApplicationModel model = new ApplicationModel();

            // Act
            ViewResult result = controller.SaveAnswer(model) as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }

        [TestMethod()]
        public void SubmitApplicationTest()
        {
            // Arrange
            ViewModelFactory factory = new ViewModelFactory();

            JobApplicationsRepository repository = new JobApplicationsRepository(factory);

            ApplicantController controller = new ApplicantController(repository);

            ApplicationModel model = new ApplicationModel();

            // Act
            ViewResult result = controller.SubmitApplication(model) as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }

        [TestMethod()]
        public void NewApplicationTest()
        {
            // Arrange
            ViewModelFactory factory = new ViewModelFactory();

            JobApplicationsRepository repository = new JobApplicationsRepository(factory);

            ApplicantController controller = new ApplicantController(repository);

            // Act
            ViewResult result = controller.NewApplication() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }

        [TestMethod()]
        public void CreateApplicationTest()
        {
            // Arrange
            ViewModelFactory factory = new ViewModelFactory();

            JobApplicationsRepository repository = new JobApplicationsRepository(factory);

            ApplicantController controller = new ApplicantController(repository);

            ApplicationModel model = new ApplicationModel();

            // Act
            ViewResult result = controller.CreateApplication(model) as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }

        [TestMethod()]
        public void DeleteApplicationTest()
        {
            // Arrange
            ViewModelFactory factory = new ViewModelFactory();

            JobApplicationsRepository repository = new JobApplicationsRepository(factory);

            ApplicantController controller = new ApplicantController(repository);

            ApplicationModel model = new ApplicationModel();

            // Act
            ViewResult result = controller.DeleteApplication(model) as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }
    }
}
