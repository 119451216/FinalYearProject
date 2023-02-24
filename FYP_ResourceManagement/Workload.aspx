<%@ Page Title="Workload" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Workload.aspx.cs" Inherits="FYP_ResourceManagement.Workload" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="gv_Workload_Container">
        <h2>
            <asp:Label runat="server" ID="lbl_Header" Text="Resources:" Font-Size="X-Large" Font-Bold="true" />
        </h2>

        <asp:GridView runat="server" ID="gv_Resources" AutoGenerateColumns="false" ShowHeader="true" ShowHeaderWhenEmpty="true" ShowFooter="false" DataSourceID="ds_Resources" CssClass="gridview">
            <Columns>
                <asp:TemplateField HeaderText="EmployeeID" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="gv_GridviewCss">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbl_EmployeeID" Text='<%# Eval("ResourceID") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="gv_GridviewCss">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbl_Name" Text='<%# Eval("FullName") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Department" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="gv_GridviewCss">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbl_Department" Text='<%# Eval("DepartmentName") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Number of Projects Allocated" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="gv_GridviewCss">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbl_ProjectsAllocated" Text='<%# Eval("NumberOfProjects") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:BoundField Datafield="Workload" HeaderText="Workload (%)" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:0.00}" HeaderStyle-CssClass="gv_GridviewCss" />

                <asp:TemplateField HeaderText="Details" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="gv_GridviewCss">
                    <ItemTemplate>
                        <asp:ImageButton runat="server" ID="btn_Details" OnClick="btn_Details_Click" CommandArgument='<%# Eval("ResourceID") %>' CommandName="btn_Click" ImageUrl="~/img/icons/baseline_description_black_24dp.png" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

    <asp:SqlDataSource runat="server" ID="ds_Resources" ConnectionString="<%$ ConnectionStrings:ND_ResourceManagement %>" SelectCommand="P07001_RESOURCES_Select" SelectCommandType="StoredProcedure" />
</asp:Content>
