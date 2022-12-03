<%@ Page Title="Project Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProjectDetails.aspx.cs" Inherits="FYP_ResourceManagement.ProjectDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:HiddenField ID="hdn_ProjectID" Value="" runat="server" />

    <!-- Projects Details Container -->
    <div class="project_Details_Container">

                    <asp:Label runat="server" ID="lbl_ProjectTitle_Header" Text="Title:" />
                    <asp:Label runat="server" ID="lbl_ProjectTitle" Text='<%# Eval("ProjectTitle") %>' />

                    <asp:Label runat="server" ID="lbl_ProjectGroup_Header" Text="Group:" />
                    <asp:Label runat="server" ID="lbl_ProjectGroup" Text='<%# Eval("ProjectGroup") %>' />

                    <asp:Label runat="server" ID="lbl_ProjectNumber_Header" Text="Project Number:" />
                    <asp:Label runat="server" ID="lbl_ProjectNumber" Text='<%# Eval("ProjectNumber") %>' />

                    <asp:Label runat="server" ID="lbl_ProjectSubNumber_Header" Text="Project Sub Number:" />
                    <asp:Label runat="server" ID="lbl_ProjectSubNumber" Text='<%# Eval("ProjectSubNumber") %>' />

                    <asp:Label runat="server" ID="lbl_InitiatedBy_Header" Text="Initiated By:" />
                    <asp:Label runat="server" ID="lbl_InitiatedBy" Text='<%# Eval("InitiatedBy") %>' />

                    <asp:Label runat="server" ID="lbl_ReviewBt_Header" Text="Reviewed By:" />
                    <asp:Label runat="server" ID="lbl_ReviewedBy" Text='<%# Eval("ReviewedBy") %>' />

                    <asp:Label runat="server" ID="lbl_Customer_Header" Text="Customer:" />
                    <asp:Label runat="server" ID="lbl_Customer" Text='<%# Eval("Customer") %>' />

                    <asp:Label runat="server" ID="lbl_Department_Header" Text="Department:" />
                    <asp:Label runat="server" ID="lbl_Department" Text='<%# Eval("Department") %>' />

                    <asp:Label runat="server" ID="lbl_Charge_Header" Text="Charge:" />
                    <asp:Label runat="server" ID="lbl_Charge" Text='<%# Eval("Charge") %>' />

                    <asp:Label runat="server" ID="lbl_Status_Header" Text="Status:" />
                    <asp:Label runat="server" ID="lbl_Status" Text='<%# Eval("Status") %>' />

                    <asp:Label runat="server" ID="lbl_ResourcesAllocated_Header" Text="Resources Allocated:" />
                    <asp:Label runat="server" ID="lbl_ResourcesAllocated" Text='<%# Eval("ResourcesAllocated") %>' />

                    <asp:Label runat="server" ID="lbl_PercentComplete_Header" Text="Percent Complete:" />
                    <asp:Label runat="server" ID="lbl_PercentComplete" Text='<%# Eval("PercentComplete") %>' />

    </div>

    <!-- SQL Data Sources -->
    <asp:SqlDataSource runat="server" ID="ds_ProjectDetails" ConnectionString="<%$ ConnectionStrings:ND_ResourceManagement %>" SelectCommand="P01002_PROJECT_Details" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter Name="projectID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>