<%@ Page Title="Title" Language="C#" Inherits="System.Web.Mvc.ViewPage<JobApplications.Model.Applicant.ApplicationModel>" MasterPageFile="~/Views/Shared/Site.Master" %>

<asp:Content ID="applicantTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Job Application
</asp:Content>

<asp:Content ID="applicantContent" ContentPlaceHolderID="MainContent" runat="server">

    <% if (Model.ApplicationId > 0)
    { %>
    
    <% var actionName = Model.SubmittedDateTime != null ? "DeleteApplication" : (Model.NextQuestionText != null ? "SaveAnswer" : "SubmitApplication"); %>
    
    <% Html.BeginForm(actionName, "Applicant", FormMethod.Post); %>   
    
    <%: Html.HiddenFor(m => m.ApplicationId) %> 
    <%: Html.HiddenFor(m => m.NextQuestionId) %> 

    <hgroup class="title">

        <h1>Job Application</h1>

    </hgroup>
    
    <h3><%: Model.ApplicantName %></h3><br/>
        
    <hr>

    <table>
        
    <% if (Model.Qualifications.Any())
        { %>
        
        <!-- show answered questions -->
        <% foreach (var qualification in Model.Qualifications)
           { %>
            
        <tr>
            <td><%: qualification.QuestionDisplayOrder.ToString() %></td>
            <td><%: qualification.QuestionText %></td>
            <td><%: qualification.AnswerText ?? string.Empty %></td>
        </tr>
            
        <% } %>
        
     <% } %>
    
     <!-- more questions? -->
     <% if (Model.NextQuestionText != null)
        { %>
            
        <tr>
            <td><%: Model.NextQuestionDisplayOrder.ToString() %></td>
            <td><%: Model.NextQuestionText %></td>
            <td></td>
        </tr>

        
                
        <% foreach (var validAnswer in Model.NextQuestionValidAnswers)
            { %>

        <tr>
            <td><%= Html.RadioButtonFor(m => m.NextQuestionAnswerId, validAnswer.Id, new {onclick="$('#buttonSaveAnswer').attr('disabled', false)"}) %></td>

            <td colspan="2" <%: (validAnswer.IsAcceptable ? "" : "class=error") %>><%: validAnswer.Text %></td>

        </tr>
                   
        <% } %>
            
        <tr>
            <td></td>
            <td><input type="submit" id="buttonSaveAnswer" value="Submit Answer" disabled="disabled"></td>
            <td></td>
        </tr>

     <% } %>

    </table>
        
    <hr>


    
    <!-- qualification is complete?  -->
    <% if (Model.SubmittedDateTime == null && Model.NextQuestionText == null)
        { %>
        
    <input type="submit" id="buttonSaveApplication" value="Submit Application">

    <% } %>
    
    <% if (Model.SubmittedDateTime != null)
       { %>

    <div>
        <h3>Application has been submitted <%: string.Format("{0:M/d/yyyy h:mm tt}", Model.SubmittedDateTime) %></h3><br/>
        
        <input type="submit" id="buttonDeleteApplication" value="Delete Application" data-confirm="Delete this submitted job application?">
    </div>

    
    <% } %>
    
    <% Html.EndForm(); %>

    <div class="message-error">
        
        <%: TempData["ErrorMessage"] %>

    </div>
    
    <% } %>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
    
    <script type="text/javascript">
        
        jQuery(document).ready(function () {
            jQuery('[data-confirm]').click(function (e) {
                if (!confirm(jQuery(this).attr("data-confirm"))) {
                    e.preventDefault();
                }
            });
        });

    </script>
</asp:Content>

