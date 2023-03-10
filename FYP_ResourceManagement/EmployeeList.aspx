<%@ Page Title="EmployeeList" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="True" CodeBehind="EmployeeList.aspx.cs" Inherits="FYP_ResourceManagement.EmployeeList" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    

    <script type="text/javascript">
        function txt_OnChange(textbox) {
            _doPostBack(textbox.name, '');
        }

        function ddl_OnChange(dropdownlist) {
            _doPostBack(dropdownlist.name, '');
        }
    </script>

        <!-- Employee Table Container -->
        <div class="gv_Employees_Container">

        <!-- Employees GridView Header -->
        <h2>
            <asp:Label runat="server" ID="lbl_Header" Text="Employees:" Font-Bold="true" Font-Size="X-Large" />
        </h2>

        <!-- Employees GridView -->
        <asp:GridView runat="server" ID="gv_Employees" AutoGenerateColumns="false" ShowHeader="true" ShowHeaderWhenEmpty="true" ShowFooter="true" DataSourceID="ds_Employees" CssClass="gridview" OnRowEditing="gv_Employees_RowEditing" OnRowUpdating="gv_Employees_RowUpdating">
            <Columns>
                <asp:TemplateField HeaderText="EmployeeID" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="gv_GridviewCss">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbl_EmployeeID" Text='<%# Eval("EmployeeID") %>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label runat="server" ID="lbl_EmployeeID_Edit" Text='<%# Eval("EmployeeID") %>' />
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="First Name" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbl_FirstName" Text='<%# Eval("FirstName") %>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox runat="server" ID="txt_FirstName" AutoPostBack="true" Text='<%# Eval("FirstName") %>' />
                        <asp:RequiredFieldValidator runat="server" ID="rfv_FirstName" ControlToValidate="txt_FirstName" Text="Required." CssClass="error" onchange="txt_OnChange(this)" />
                        <asp:Label runat="server" ID="lbl_FirstName_Error" Text="Please enter a valid name." CssClass="error" Visible="false" />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox runat="server" ID="txt_FirstName_Footer" Text="" CssClass="gv_Textbox gv_FooterTextbox" />
                        <asp:Label runat="server" ID="lbl_FirstName_Error_Footer" Text="Please enter a valid name." CssClass="error" Visible="false" />
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Last Name" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbl_LastName" Text='<%# Eval("LastName") %>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox runat="server" ID="txt_LastName" Text='<%# Eval("LastName") %>' />
                        <asp:RequiredFieldValidator runat="server" ID="rfv_LastName" ControlToValidate="txt_LastName" Text="Required." CssClass="error" onchange="txt_OnChange(this)" />
                        <asp:Label runat="server" ID="lbl_LastName_Error" Text="Please enter a valid name." CssClass="error" Visible="false" />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox runat="server" ID="txt_LastName_Footer" Text="" CssClass="gv_Textbox gv_FooterTextbox" />
                        <asp:Label runat="server" ID="lbl_LastName_Error_Footer" Text="Please enter a valid name." CssClass="error" Visible="false" />
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Department" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbl_Department" Text='<%# Eval("DepartmentName") %>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList runat="server" ID="ddl_Department" DataSourceID="ds_Department" DataTextField="DepartmentName" DataValueField="DepartmentID" CssClass="gv_Employees_Edit" />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList runat="server" ID="ddl_Department_Footer" DataSourceID="ds_Department" DataTextField="DepartmentName" DataValueField="DepartmentID" onchange="ddl_OnChange(this)" />
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Rate" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbl_Rate" Text='<%# Eval("Rate") %>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox runat="server" ID="txt_Rate" Text='<%# Eval("Rate") %>' />
                        <asp:RequiredFieldValidator runat="server" ID="rfv_Rate" ControlToValidate="txt_Rate" Text="Required." CssClass="error" />
                        <asp:Label runat="server" ID="lbl_Rate_Error" Text="Please enter a valid rate." CssClass="error" Visible="false" />
                    </EditItemTemplate>
                    <FooterTemplate>
                            <asp:TextBox runat="server" ID="txt_Rate_Footer" Text='<%# Bind("Rate") %>' CssClass="gv_Textbox gv_FooterTextbox" AutoPostBack="true" onchange="txt_OnChange(this)" />
                            <asp:Label runat="server" ID="lbl_Rate_Error_Footer" Text="Please enter a valid rate" CssClass="error" Visible="false" />
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Job Description" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbl_JobDescription" Text='<%# Eval("JobDescription") %>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox runat="server" ID="txt_JobDescription" Text='<%# Eval("JobDescription") %>' onchange="txt_OnChange(this)" />
                        <asp:RequiredFieldValidator runat="server" ID="rfv_JobDescription" ControlToValidate="txt_JobDescription" CssClass="error" Text="Required." />
                        <asp:Label runat="server" ID="lbl_JobDescription_Error" Text="Please enter a valid job description." CssClass="error" Visible="false" />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox runat="server" ID="txt_JobDescription_Footer" Text="" />
                        <asp:Label runat="server" ID="lbl_JobDescription_Error_Footer" Text="Please enter a valid job description." CssClass="error" Visible="false" />
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Hours Assigned" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="gv_GridviewCss">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbl_HoursAssigned" Text='<%# Eval("HoursAssigned") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="Workload" HeaderText="Workload (%)" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:0.00}" HeaderStyle-CssClass="gv_GridviewCss" />

                <asp:TemplateField HeaderText="Details" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="gv_GridviewCss">
                    <ItemTemplate>
                        <asp:ImageButton runat="server" ID="btn_Details" OnClick="btn_Details_Click" CommandArgument='<%# Eval("EmployeeID") %>' CommandName="btn_Click" ImageUrl="~/img/icons/baseline_description_black_24dp.png" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Edit" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="gv_GridviewCss">
                    <ItemTemplate>
                        <asp:ImageButton runat="server" ID="btn_Edit" OnClick="btn_Edit_Click" ImageUrl="~/img/icons/edit_FILL1_wght400_GRAD0_opsz20.png" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:ImageButton runat="server" ID="btn_Confirm" OnClick="btn_Confirm_Click" ImageUrl="~/img/icons/done_FILL1_wght400_GRAD0_opsz20.png" />
                        <asp:ImageButton runat="server" ID="btn_Cancel" OnClick="btn_Cancel_Click" ImageUrl="~/img/icons/close_FILL1_wght400_GRAD0_opsz20.png" />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:ImageButton runat="server" ID="btn_Add" OnClick="btn_Add_Click" ImageUrl="~/img/icons/save_FILL1_wght400_GRAD0_opsz24.png" />
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

    </div>

    <!-- SQL Data Sources -->
    <asp:SqlDataSource runat="server" ID="ds_Employees" ConnectionString="<%$ ConnectionStrings:ND_ResourceManagement %>" SelectCommand="P02001_EMPLOYEE_Select" SelectCommandType="StoredProcedure" />

    <asp:SqlDataSource runat="server" ID="ds_Department" ConnectionString="<%$ ConnectionStrings:ND_ResourceManagement %>" SelectCommand="P02003_EMPLOYEE_Department" SelectCommandType="StoredProcedure" />

    <asp:SqlDataSource runat="server" ID="ds_ProjectsAllocated" ConnectionString="<%$ ConnectionStrings:ND_ResourceManagement %>" SelectCommand="SELECT [ProjectNumber] WHERE [InitiatedBy] = @employeeID" SelectCommandType="Text">
        <SelectParameters>
            <asp:Parameter Name="employeeID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

