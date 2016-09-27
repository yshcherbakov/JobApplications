<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<JobApplications.Model.Applicant.ApplicationModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Start Job Application
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <hgroup class="title">
        <h1>Job Application</h1>
    </hgroup>
    
    <% Html.BeginForm("CreateApplication", "Applicant", FormMethod.Post); %>   
    
    <hr>
    
    <br/>

    <%= Html.LabelFor(m => m.ApplicantName) %>
    <%= Html.TextBoxFor(m => m.ApplicantName, new { onkeyup="$('#buttonStartApplication').attr('disabled', this.value.trim() == '');"}) %>
    
    <hr>
    
    <input type="submit" id="buttonStartApplication" value="Start Job Application" disabled="disabled">

    <% Html.EndForm(); %>
    
    <div class="message-error">
        
        <%: TempData["ErrorMessage"] %>

    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
