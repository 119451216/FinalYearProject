<%@ Page Title="Project Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProjectDetails.aspx.cs" Inherits="FYP_ResourceManagement.ProjectDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:HiddenField ID="hdn_ProjectID" Value="" runat="server" />

    <!-- Projects Details Container -->
    <div class="project_Details_Container">

        <h2>
            <asp:Label runat="server" ID="lbl_ProjectHeader" CssClass="projectDetails_Header" Font-Bold="true" />
        </h2>

        <div class="projectDetails">
            <asp:Label runat="server" ID="lbl_ProjectTitle_Header" Text="Title:" />
            <asp:Label runat="server" ID="lbl_ProjectTitle" Text='' CssClass="projectDetailsInfo_Title" Font-Bold="false" />
        </div>
            <br />
        <div class="projectDetails">
                    <asp:Label runat="server" ID="lbl_ProjectGroup_Header" Text="Group:" />
                    <asp:Label runat="server" ID="lbl_ProjectGroup" Text='' CssClass="projectDetailsInfo_Group" Font-Bold="false" />
        </div>
            <br />
        <div class="projectDetails">
                    <asp:Label runat="server" ID="lbl_ProjectNumber_Header" Text="Project Number:" />
                    <asp:Label runat="server" ID="lbl_ProjectNumber" Text='' CssClass="projectDetailsInfo_Number" Font-Bold="false" />
        </div>
            <br />
        <div class="projectDetails">
                    <asp:Label runat="server" ID="lbl_ProjectSubNumber_Header" Text="Project Sub Number:" />
                    <asp:Label runat="server" ID="lbl_ProjectSubNumber" Text='' CssClass="projectDetailsInfo_SubNumber" Font-Bold="false" />
        </div>
            <br />
        <div class="projectDetails">
                    <asp:Label runat="server" ID="lbl_InitiatedBy_Header" Text="Initiated By:" />
                    <asp:Label runat="server" ID="lbl_InitiatedBy" Text='' CssClass="projectDetailsInfo_InitiatedBy" Font-Bold="false" />
        </div>
            <br />
        <div class="projectDetails">
                    <asp:Label runat="server" ID="lbl_ReviewBt_Header" Text="Reviewed By:" />
                    <asp:Label runat="server" ID="lbl_ReviewedBy" Text='' CssClass="projectDetailsInfo_ReviewedBy" Font-Bold="false" />
        </div>
            <br />
        <div class="projectDetails">
                    <asp:Label runat="server" ID="lbl_Customer_Header" Text="Customer:" />
                    <asp:Label runat="server" ID="lbl_Customer" Text='' CssClass="projectDetailsInfo_Customer" Font-Bold="false" />
        </div>
            <br />
        <div class="projectDetails">
                    <asp:Label runat="server" ID="lbl_Department_Header" Text="Department:" />
                    <asp:Label runat="server" ID="lbl_Department" Text='' CssClass="projectDetailsInfo_Department" Font-Bold="false" />
        </div>
            <br />
        <div class="projectDetails">
                    <asp:Label runat="server" ID="lbl_Charge_Header" Text="Charge:" />
                    <asp:Label runat="server" ID="lbl_Charge" Text='' CssClass="projectDetailsInfo_Charge" Font-Bold="false" />
        </div>
            <br />
        <div class="projectDetails">
                    <asp:Label runat="server" ID="lbl_Status_Header" Text="Status:" />
                    <asp:Label runat="server" ID="lbl_Status" Text='' CssClass="projectDetailsInfo_Status" Font-Bold="false" />
        </div>
            <br />
        <div class="projectDetails">
                    <asp:Label runat="server" ID="lbl_PercentComplete_Header" Text="Percent Complete:" />
                    <asp:Label runat="server" ID="lbl_PercentComplete" Text='' CssClass="projectDetailsInfo_Percent" Font-Bold="false" />
        </div>

    </div>

    <!-- SQL Data Sources -->
    <asp:SqlDataSource runat="server" ID="ds_ProjectDetails" ConnectionString="<%$ ConnectionStrings:ND_ResourceManagement %>" SelectCommand="P01002_PROJECT_Details" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter Name="projectID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>