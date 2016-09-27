<%@ Page Title="View Applications" Language="C#" Inherits="System.Web.Mvc.ViewPage<IEnumerable<JobApplications.Model.Employer.AcceptableApplicationsModel>>" MasterPageFile="~/Views/Shared/Site.Master" %>

<asp:Content ID="employerTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Start Job Applications
</asp:Content>

<asp:Content ID="employerContent" ContentPlaceHolderID="MainContent" runat="server">
    <hgroup class="title">
        <h1>Acceptable Applications</h1>
    </hgroup>
    
    <% if (!Model.Any())
       { %>
    
    <h3>No acceptable applications availble</h3>

    <% } else {%>
    
    <hr>

    <table>
        <thead>
            <tr>
                <th colspan="2">Submitted</th>
                <th>Applicant Name</th>
            </tr>
        </thead>

        <% foreach (var model in Model)
           { %>
        <tr>
            <td><%: model.SubmittedDateTime.Value.ToShortDateString() %></td>
            <td><%: model.SubmittedDateTime.Value.ToShortTimeString() %></td>
            <td><%: model.ApplicantName %></td>
        </tr>
        <% } %>
        
    </table>
    
    <hr>
    <aside>
        <b>Total: <%: Model.Count() %> applications</b>
    </aside>

    <% } %>
    
    <div class="message-error">
        
        <%: TempData["ErrorMessage"] %>

    </div>

</asp:Content>




