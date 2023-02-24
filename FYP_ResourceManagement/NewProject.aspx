<%@ Page Title="New Project - NeoDyne Ltd. " Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewProject.aspx.cs" Inherits="FYP_ResourceManagement.NewProject" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <asp:Label runat="server" ID="lbl_Header" Text="New Project:" Font-Size="X-Large" Font-Bold="true" CssClass="lbl_NewProjectHeader" />
    </h2>

    <table class="tbl_NewProject">
        <tr>
            <td>
                <asp:Label runat="server" ID="lbl_ProjectID" Text="ProjectID:" Font-Bold="true" CssClass="lbl_NewProject" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="txt_ProjectID" ReadOnly="true" Enabled="false" Text='<%# Eval("ProjectID") %>' CssClass="shading" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lbl_Group" Text="Project Group:" Font-Bold="true" CssClass="lbl_NewProject" />
            </td>
            <td>
                <asp:DropDownList runat="server" ID="ddl_Group" DataSourceID="ds_Group" DataTextField="ProjectGroup" DataValueField="GroupID" CssClass="shading"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label  runat="server" ID="lbl_ProjectNumber" Text="Project Number:" Font-Bold="true" CssClass="lbl_NewProject" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="txt_ProjectNumber" ReadOnly="true" Enabled="false" Text='<%# Eval("ProjectNumber") %>' CssClass="shading"/>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lbl_ProjectSubNumber" Text="Project Sub Number:" Font-Bold="true" CssClass="lbl_NewProject" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="txt_ProjectSubNumber" ReadOnly="true" Enabled="false" Text='<%# Eval("ProjectSubNumber") %>' CssClass="shading" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lbl_Title" Text="Project Title:" Font-Bold="true" CssClass="lbl_NewProject" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="txt_ProjectTitle" Text="" CssClass="shading" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lbl_Customer" Text="Customer:" Font-Bold="true" CssClass="lbl_NewProject" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="txt_ProjectCustomer" Text="" CssClass="shading" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lbl_InitiatedBy" Text="Initiated By:" Font-Bold="true" CssClass="lbl_NewProject" />
            </td>
            <td>
                <asp:DropDownList runat="server" ID="ddl_InitiatedBy" DataSourceID="ds_Employee" DataTextField="FullName" DataValueField="EmployeeID" CssClass="shading" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lbl_ReviewedBy" Text="Reviewed By:" Font-Bold="true" CssClass="lbl_NewProject" />
            </td>
            <td>
                <asp:DropDownList runat="server" ID="ddl_ReviewedBy" DataSourceID="ds_Employee" DataTextField="FullName" DataValueField="EmployeeID" CssClass="shading" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lbl_Charge" Text="Charge:" Font-Bold="true" CssClass="lbl_NewProject" />
            </td>
            <td>
                <asp:DropDownList runat="server" ID="ddl_Charge" DataSourceID="ds_Charge" DataTextField="ChargeName" DataValueField="ChargeID" CssClass="shading" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lbl_Status" Text="Status:" Font-Bold="true" CssClass="lbl_NewProject" />
            </td>
            <td>
                <asp:DropDownList runat="server" ID="ddl_Status" DataSourceID="ds_Status" DataTextField="StatusName" DataValueField="StatusID" CssClass="shading" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lbl_HoursExpected" Text="Hours Expected:" Font-Bold="true" CssClass="lbl_NewProject" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="txt_HoursExpected" Text="" CssClass="shading" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button runat="server" ID="btn_Add" Text="Create New Project" CssClass="shading" />
            </td>
        </tr>
    </table>

    <asp:SqlDataSource runat="server" ID="ds_Group" ConnectionString="<%$ ConnectionStrings:ND_ResourceManagement %>" SelectCommand="P03001_GROUP_Select" SelectCommandType="StoredProcedure" />

    <asp:SqlDataSource runat="server" ID="ds_Employee" ConnectionString="<%$ ConnectionStrings:ND_ResourceManagement %>" SelectCommand="P02002_EMPLOYEE_Details" SelectCommandType="StoredProcedure" />

    <asp:SqlDataSource runat="server" ID="ds_Charge" ConnectionString="<%$ ConnectionStrings:ND_ResourceManagement %>" SelectCommand="P04001_CHARGE_Select" SelectCommandType="StoredProcedure" />

    <asp:SqlDataSource runat="server" ID="ds_Status" ConnectionString="<%$ ConnectionStrings:ND_ResourceManagement %>" SelectCommand="P05001_Status_Select" SelectCommandType="StoredProcedure" />
</asp:Content>
 