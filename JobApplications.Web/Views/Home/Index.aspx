<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="indexTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Job Applications
</asp:Content>

<asp:Content ID="indexFeatured" ContentPlaceHolderID="FeaturedContent" runat="server">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>Job Application</h1>
                <h2><%: ViewBag.Message %></h2>
            </hgroup>
            <p>
                <h2>
                    <% if ((HttpContext.Current.User != null) && HttpContext.Current.User.Identity.IsAuthenticated)
                       { %>
                    Welcome to Job Application web site!
                    <% } else { %>
                    <%: Html.ActionLink("Register", "Register", "Account", routeValues: null, htmlAttributes: new { id = "registerLink" })%> or 
                    <%: Html.ActionLink("Log in", "Login", "Account", routeValues: null, htmlAttributes: new { id = "loginLink" })%> to start your job application.
                    <% }  %>

                </h2>
            </p>
        </div>
    </section>
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
