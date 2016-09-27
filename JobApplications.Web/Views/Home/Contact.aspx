<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="contactTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Contact Us:
</asp:Content>

<asp:Content ID="contactContent" ContentPlaceHolderID="MainContent" runat="server">
    <hgroup class="title">
        <h1>Contact Us</h1>
        <h2><%: ViewBag.Message %></h2>
    </hgroup>
    <section class="contact">
        <header>
            <h3>Phone:</h3>
        </header>
        <p>
            <span class="label">Main:</span>
            <span>(804)-555-0100</span>
        </p>
        <p>
            <span class="label">After Hours:</span>
            <span>(804)-555-0199</span>
        </p>
    </section>

    <section class="contact">
        <header>
            <h3>Email:</h3>
        </header>
        <p>
            <span class="label">Support:</span>
            <span><a href="mailto:support@thewsoftware.dynu.com">support@thewsoftware.dynu.com</a></span>
        </p>
        <p>
            <span class="label">Marketing:</span>
            <span><a href="mailto:marketing@thewsoftware.dynu.com">marketing@thewsoftware.dynu.com</a></span>
        </p>
        <p>
            <span class="label">General:</span>
            <span><a href="mailto:general@thewsoftware.dynu.com">general@thewsoftware.dynu.com</a></span>
        </p>
    </section>

    <section class="contact">
        <header>
            <h3>Address:</h3>
        </header>
        <p>
            4851 Lake Brook Dr, Glen Allen, VA 23060
        </p>
    </section>
</asp:Content>