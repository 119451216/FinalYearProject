<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="FYP_ResourceManagement._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="home_Body">
        <h3>Welcome to the NeoyDyne Resource Management System</h3>
        <p>Please select a button to navigate to another page.</p>
        <br />
        <h4 class="index_Header">All Projects</h4>
        <a href="~/AllProjects.aspx" class="index_Link" runat="server">All Projects</a>
        <br />
        <a href="~/NewProject.aspx" class="index_Link" runat="server">New Project</a>
        <br />
        <br />
        <a href="~/EmployeeList.aspx" class="index_Header" runat="server">Personnel</a>
        <br />
        <h4 class="index_Header">Resources</h4>
        <a href="~/Workload.aspx" class="index_Link" runat="server">Workload</a>
        <br />
        <a href="~/Availability.aspx" class="index_Link" runat="server">Availability</a>
        <br />
    </div>

</asp:Content>
