using System.Web.Mvc;
using JobApplications.Data;
using Microsoft.Practices.Unity;
using Unity.Mvc4;
using JobApplications.Web.Controllers;

namespace JobApplications.Web
{
  public static class Bootstrapper
  {
    public static IUnityContainer Initialise()
    {
      var container = BuildUnityContainer();

      DependencyResolver.SetResolver(new UnityDependencyResolver(container));

      return container;
    }

    private static IUnityContainer BuildUnityContainer()
    {
      var container = new UnityContainer();

      container.RegisterType<IViewModelFactory, ViewModelFactory>();
      container.RegisterType<IJobApplicationsRepository, JobApplicationsRepository>();
      container.RegisterType<IController, EmployerController>("Employer");
      container.RegisterType<IController, ApplicantController>("Employer");
      RegisterTypes(container);

      return container;
    }

    public static void RegisterTypes(IUnityContainer container)
    {
    
    }
  }
}