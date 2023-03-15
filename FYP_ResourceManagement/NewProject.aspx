<%@ Page Title="New Project - NeoDyne Ltd. " Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewProject.aspx.cs" Inherits="FYP_ResourceManagement.NewProject" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <asp:Label runat="server" ID="lbl_Header" Text="New Project:" Font-Size="X-Large" Font-Bold="true" CssClass="lbl_NewProjectHeader" />
    </h2>

    <table class="tbl_NewProject" id="tbl_NewProject" runat="server">
        <tr>
            <td>
                <asp:Label runat="server" ID="lbl_RepeatCustomer" Text="Repeat Customer:" Font-Bold="true" CssClass="lbl_NewProject repeatCustomer" />
            </td>
            <td>
                <asp:CheckBox runat="server" ID="chk_RepeatCustomer" OnCheckedChanged="chk_RepeatCustomer_OnChecked" AutoPostBack="true"  />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lbl_ProjectID" Text="ProjectID:" Font-Bold="true" CssClass="lbl_NewProject" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="txt_ProjectID" ReadOnly="true" Enabled="false" Text="" CssClass="shading" />
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
                <asp:TextBox runat="server" ID="txt_ProjectNumber" ReadOnly="true" Enabled="false" Text="" CssClass="shading"/>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lbl_ProjectSubNumber" Text="Project Sub Number:" Font-Bold="true" CssClass="lbl_NewProject" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="txt_ProjectSubNumber" ReadOnly="true" Enabled="false" Text="" CssClass="shading" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lbl_Title" Text="Project Title:" Font-Bold="true" CssClass="lbl_NewProject" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="txt_ProjectTitle" Text="" CssClass="shading" />
                <asp:Label runat="server" ID="lbl_ProjectTitle_Error" Text="Please enter a valid title." CssClass="error" Visible="false" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lbl_Customer" Text="Customer:" Font-Bold="true" CssClass="lbl_NewProject" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="txt_ProjectCustomer" Text="" CssClass="shading" />
                <asp:Label runat="server" ID="lbl_ProjectCustomer_Error" Text="Please enter a valid customer." CssClass="error" Visible="false" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lbl_Department" Text="Department:" Font-Bold="true" CssClass="lbl_NewProject" />
            </td>
            <td>
                <asp:DropDownList runat="server" ID="ddl_Department" DataSourceID="ds_Department" DataTextField="DepartmentName" DataValueField="DepartmentID" CssClass="shading" />
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
                <asp:Label runat="server" ID="lbl_HoursExpected_Error" Text="Please enter valid hours expected." CssClass="error" Visible="false" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button runat="server" ID="btn_Add" Text="Create New Project" OnClick="btn_Add_Click" CssClass="shading" />
            </td>
        </tr>
    </table>

    <table class="tbl_NewProject" id="tbl_NewProject_Repeat" runat="server" visible="false">
        <tr>
            <td>
                <asp:Label runat="server" ID="lbl_Customer_Repeat" Text="Customer:" Font-Bold="true" CssClass="lbl_NewProject" />
            </td>
            <td>
                <asp:DropDownList runat="server" ID="ddl_Customer_Repeat" DataTextField="Customer" DataValueField="CustomerID" CssClass="shading" AutoPostBack="true" OnSelectedIndexChanged="ddl_ProjectCustomer_Repeat_OnSelectedIndexChanged" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label  runat="server" ID="lbl_ProjectNumber_Repeat" Text="Project Number:" Font-Bold="true" CssClass="lbl_NewProject" />
            </td>
            <td>
                <asp:DropDownList runat="server" ID="ddl_ProjectNumber_Filter" DataTextField="ProjectNumber" AutoPostBack="true" OnSelectedIndexChanged="ddl_ProjectNumber_Filter_OnSelectedIndexChanged" DataValueField="ProjectID" CssClass="shading" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lbl_ProjectSubNumber_Repeat" Text="Project Sub Number:" Font-Bold="true" CssClass="lbl_NewProject" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="txt_ProjectSubNumber_Repeat" ReadOnly="true" Enabled="false" AutoPostBack="true" Text="" CssClass="shading" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lbl_Department_Repeat" Text="Department:" Font-Bold="true" CssClass="lbl_NewProject" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="txt_Department_Repeat" ReadOnly="true" Enabled="false" AutoPostBack="true" Text="" CssClass="shading" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lbl_ProjectID_Repeat" Text="ProjectID:" Font-Bold="true" CssClass="lbl_NewProject" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="txt_ProjectID_Repeat" ReadOnly="true" Enabled="false" Text="" CssClass="shading" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lbl_ProjectGroup_Repeat" Text="Project Group:" Font-Bold="true" CssClass="lbl_NewProject" />
            </td>
            <td>
                <asp:DropDownList runat="server" ID="ddl_ProjectGroup_Repeat" DataSourceID="ds_Group" DataTextField="ProjectGroup" DataValueField="GroupID" CssClass="shading"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lbl_ProjectTitle_Repeat" Text="Project Title:" Font-Bold="true" CssClass="lbl_NewProject" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="txt_Title_Repeat" Text="" CssClass="shading" />
                <asp:Label runat="server" ID="lbl_Title_Repeat_Error" Text="Please enter a valid title." CssClass="error" Visible="false" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lbl_InitiatedBy_Repeat" Text="Initiated By:" Font-Bold="true" CssClass="lbl_NewProject" />
            </td>
            <td>
                <asp:DropDownList runat="server" ID="ddl_InitiatedBy_Repeat" DataSourceID="ds_Employee" DataTextField="FullName" DataValueField="EmployeeID" CssClass="shading" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lbl_ReviewedBy_Repeat" Text="Reviewed By:" Font-Bold="true" CssClass="lbl_NewProject" />
            </td>
            <td>
                <asp:DropDownList runat="server" ID="ddl_ReviewedBy_Repeat" DataSourceID="ds_Employee" DataTextField="FullName" DataValueField="EmployeeID" CssClass="shading" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lbl_Charge_Repeat" Text="Charge:" Font-Bold="true" CssClass="lbl_NewProject" />
            </td>
            <td>
                <asp:DropDownList runat="server" ID="ddl_Charge_Repeat" DataSourceID="ds_Charge" DataTextField="ChargeName" DataValueField="ChargeID" CssClass="shading" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lbl_Status_Repeat" Text="Status:" Font-Bold="true" CssClass="lbl_NewProject" />
            </td>
            <td>
                <asp:DropDownList runat="server" ID="ddl_Status_Repeat" DataSourceID="ds_Status" DataTextField="StatusName" DataValueField="StatusID" CssClass="shading" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lbl_HoursExpected_Repeat" Text="Hours Expected:" Font-Bold="true" CssClass="lbl_NewProject" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="txt_HoursExpected_Repeat" Text="" CssClass="shading" />
                <asp:Label runat="server" ID="lbl_HoursExpected_Repeat_error" Text="Please enter valid hours expected." CssClass="error" Visible="false" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button runat="server" ID="btn_Add_Repeat" Text="Create New Project" OnClick="btn_Add_Repeat_Click" CssClass="shading" />
            </td>
        </tr>
    </table>

    <asp:SqlDataSource runat="server" ID="ds_Group" ConnectionString="<%$ ConnectionStrings:ND_ResourceManagement %>" SelectCommand="P03001_GROUP_Select" SelectCommandType="StoredProcedure" />

    <asp:SqlDataSource runat="server" ID="ds_ProjectNumber" ConnectionString="<%$ ConnectionStrings:ND_ResourceManagement %>" SelectCommand="P01005_PROJECT_New_ProjectNo" SelectCommandType="StoredProcedure" />

    <asp:SqlDataSource runat="server" ID="ds_ProjectNumber_Filter" ConnectionString="<%$ ConnectionStrings:ND_ResourceManagement %>" SelectCommand="P01007_PROJECT_New_ProjectNo_Filter" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter Name="customerID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource runat="server" ID="ds_Employee" ConnectionString="<%$ ConnectionStrings:ND_ResourceManagement %>" SelectCommand="P02001_EMPLOYEE_Select" SelectCommandType="StoredProcedure" />

    <asp:SqlDataSource runat="server" ID="ds_Customers" ConnectionString="<%$ ConnectionStrings:ND_ResourceManagement %>" SelectCommand="P01006_PROJECT_New_Customer" SelectCommandType="StoredProcedure" />

    <asp:SqlDataSource runat="server" ID="ds_Department" ConnectionString="<%$ ConnectionStrings:ND_ResourceManagement %>" SelectCommand="P01009_PROJECT_Department" SelectCommandType="StoredProcedure" />

    <asp:SqlDataSource runat="server" ID="ds_Charge" ConnectionString="<%$ ConnectionStrings:ND_ResourceManagement %>" SelectCommand="P04001_CHARGE_Select" SelectCommandType="StoredProcedure" />

    <asp:SqlDataSource runat="server" ID="ds_Status" ConnectionString="<%$ ConnectionStrings:ND_ResourceManagement %>" SelectCommand="P05001_Status_Select" SelectCommandType="StoredProcedure" />
</asp:Content>
 