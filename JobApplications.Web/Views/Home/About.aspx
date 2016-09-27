<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="aboutTitle" ContentPlaceHolderID="TitleContent" runat="server">
    About - Job Applications
</asp:Content>

<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">
    <hgroup class="title">
        <h1>About</h1>
        <h2><%: ViewBag.Message %></h2>
    </hgroup>

    <article>
        <p>
            Welcome to Yuriy Shcherbakov's Job Application test web application!
        </p>
        
        <p>
            Assignment:
        </p>
        
        <p>
            Being able to automatically filter out applications from unqualified applicants can save busy hiring managers a lot of time.  They only need to spend time looking at applicants who meet their minimum qualifications.  Why waste time reading through delivery driver applications from people who don’t have a vehicle if you require drivers to use their own vehicle?
Implement code that determines whether a job application meets a set of minimum qualifications.  The job application will be a list of questions, each of which has a question id and an answer.  The qualifications will be a list of question ids, each associated with a list of acceptable answers.  If an application fails to answer any one of these questions with an acceptable answer, the application should be rejected.  Otherwise the application should be accepted.  The employer should be able to view only the accepted applications.
        </p>


    </article>

    <aside>
        <h3>Quick Links</h3>
        <p>
            Use this area to quickly navigate through the web site.
        </p>
        <ul>
            <li><%: Html.ActionLink("Home", "Index", "Home") %></li>
            <li><%: Html.ActionLink("About", "About", "Home") %></li>
            <li><%: Html.ActionLink("Contact", "Contact", "Home") %></li>
        </ul>
    </aside>
</asp:Content>