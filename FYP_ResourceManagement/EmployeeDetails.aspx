<%@ Page Title="Employee Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeeDetails.aspx.cs" Inherits="FYP_ResourceManagement.EmployeeDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:HiddenField ID="hdn_ProjectID" Value="" runat="server" />

    <!-- Employee Details Container -->
    <div class="employee_Details_Container">

                    <asp:Label runat="server" ID="lbl_ProjectTitle_Header" Text="Name:" />
                    <asp:Label runat="server" ID="lbl_ProjectTitle" Text='<%# Eval("FullName") %>' />

                    <asp:Label runat="server" ID="lbl_ProjectGroup_Header" Text="Department:" />
                    <asp:Label runat="server" ID="lbl_ProjectGroup" Text='<%# Eval("DepartmentName") %>' />

                    <asp:Label runat="server" ID="lbl_ProjectNumber_Header" Text="Job Description:" />
                    <asp:Label runat="server" ID="lbl_ProjectNumber" Text='<%# Eval("Job Description") %>' />

                    <asp:Label runat="server" ID="lbl_ProjectSubNumber_Header" Text="Rate:" />
                    <asp:Label runat="server" ID="lbl_ProjectSubNumber" Text='<%# Eval("Rate") %>' />

                    <asp:Label runat="server" ID="lbl_InitiatedBy_Header" Text="Workload" />
                    <asp:Label runat="server" ID="lbl_InitiatedBy" Text='<%# Eval("Workload") %>' />

                    <asp:Label runat="server" ID="lbl_ReviewBt_Header" Text="Remaining Hours:" />
                    <asp:Label runat="server" ID="lbl_ReviewedBy" Text='<%# Eval("RemainingHours") %>' />

                    <asp:Label runat="server" ID="lbl_Customer_Header" Text="Projects Allocated:" />
                    <asp:Label runat="server" ID="lbl_Customer" Text='<%# Eval("ProjectsAllocated") %>' />

    </div>

    <!-- SQL Data Sources -->
    <asp:SqlDataSource runat="server" ID="ds_ProjectDetails" ConnectionString="<%$ ConnectionStrings:ND_ResourceManagement %>" SelectCommand="P02002_EMPLOYEE_Details" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter Name="projectID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>