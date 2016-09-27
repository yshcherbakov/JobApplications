using System.Web.Mvc;
using JobApplications.Data;
using JobApplications.Web.Controllers;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace JobApplications.Web.Tests.Controllers
{
    [TestClass()]
    public class EmployerControllerTests
    {
        [TestMethod()]
        public void IndexTest()
        {
            // Arrange
            ViewModelFactory factory = new ViewModelFactory();

            JobApplicationsRepository repository = new JobApplicationsRepository(factory);

            EmployerController controller = new EmployerController(repository);

            // Act
            ViewResult result = controller.Index() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }
    }
}
