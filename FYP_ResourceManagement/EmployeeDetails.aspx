<%@ Page Title="Employee Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeeDetails.aspx.cs" Inherits="FYP_ResourceManagement.EmployeeDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:HiddenField ID="hdn_EmployeeID" Value="" runat="server" />

    <!-- Employee Details Container -->
    <div class="employee_Details_Container">

        <h2>
            <asp:Label runat="server" ID="lbl_EmployeeHeader" CssClass="employeeDetails_Header" Font-Bold="true" />
        </h2>
        
        <div class="employeeDetails">
            <asp:Label runat="server" ID="lbl_EmployeeID_Header" Text="Employee ID:" />
            <asp:Label runat="server" ID="lbl_EmployeeID" Text='' CssClass="employeeDetails_ID" />
        </div>
            <br />
        <div class="employeeDetails">
            <asp:Label runat="server" ID="lbl_Department_Header" Text="Department:" />
            <asp:Label runat="server" ID="lbl_Department" Text='' CssClass="employeeDetails_Department" />
        </div>
            <br />
        <div class="employeeDetails">
                    <asp:Label runat="server" ID="lbl_Rate_Header" Text="Rate:" />
                    <asp:Label runat="server" ID="lbl_Rate" Text='' CssClass="employeeDetails_Rate" />
        </div>
            <br />
        <div class="employeeDetails">
            <asp:Label runat="server" ID="lbl_JobDescription_Header" Text="Job Description:" />
            <asp:Label runat="server" ID="lbl_JobDescription" Text='' CssClass="employeeDetails_JobDescription" />
        </div>
            <br />
        <div class="employeeDetails">
            <asp:Label runat="server" ID="lbl_HoursAssigned_Header" Text="Hours Assigned:" />
            <asp:Label runat="server" ID="lbl_HoursAssigned" Text='' CssClass="employeeDetails_HoursAssigned" />
        </div>
            <br />
        <div class="employeeDetails">
            <asp:Label runat="server" ID="lbl_Workload_Header" Text="Workload:" />
            <asp:Label runat="server" ID="lbl_Workload" Text='' CssClass="employeeDetails_Workload" />
        </div>
            <br />
        <div class="employeeDetails">
            <asp:Label runat="server" ID="lbl_ProjectsAllocated_Header" Text="Projects Allocated:" />
            <asp:Label runat="server" ID="lbl_ProjectsAllocated" Text='' CssClass="employeeDetails_ProjectsAllocated" />
        </div>
    </div>

    <!-- SQL Data Sources -->
    <asp:SqlDataSource runat="server" ID="ds_ProjectDetails" ConnectionString="<%$ ConnectionStrings:ND_ResourceManagement %>" SelectCommand="P02002_EMPLOYEE_Details" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter Name="projectID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>