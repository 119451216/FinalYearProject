<%@ Page Title="All Projects" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ALLProjects.aspx.cs" Inherits="FYP_ResourceManagement.AllProjects" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <!-- Projects Table Container -->
    <div class="gv_Projects_Container">

        <!-- Projects GridView Header-->
        <h2>
            <asp:Label runat="server" ID="lbl_Header" Text="Projects:" Font-Size="Large" Font-Bold="true" />
        </h2>

        <!-- Projects GridView -->
        <asp:GridView runat="server" ID="gv_Projects" AutoGenerateColumns="false" ShowHeader="true" ShowHeaderWhenEmpty="true" ShowFooter="false" DataSourceID="ds_Projects" CssClass="gridview">
            <Columns>
                <asp:TemplateField HeaderText="ProjectID" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbl_ProjectID" Text='<%# Eval("ProjectID") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Project Group" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbl_ProjectGroup" Text='<%# Eval("ProjectGroup") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Project No." HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbl_ProjectNumber" Text='<%# Eval("ProjectNumber") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Project Sub No." HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbl_ProjectSubNumber" Text='<%# Eval("ProjectSubNumber") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Title" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbl_Title" Text='<%# Eval("ProjectTitle") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Customer" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbl_Customer" Text='<%# Eval("Customer") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Initiated By" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbl_InitiatedBy" Text='<%# Eval("InitiatedBy") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Reviewed By" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbl_ReviewedBy" Text='<%# Eval("ReviewedBy") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Charge" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbl_Charge" Text='<%# Eval("Charge") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Status" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbl_Status" Text='<%# Eval("Status") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="PercentComplete" HeaderText="% Complete" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:0.00}" />

                <asp:TemplateField HeaderText="" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:ImageButton runat="server" ID="btn_Edit" OnClick="btn_Edit_Click" CommandArgument='<%# Eval("ProjectID") %>' CommandName="btn_Click" ImageUrl="~/img/icons/baseline_description_black_24dp.png" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

    </div>

    <!-- SQL Data Sources -->
    <asp:SqlDataSource runat="server" ID="ds_Projects" ConnectionString="<%$ ConnectionStrings:ND_ResourceManagement %>" SelectCommand="P01001_PROJECT_Select" SelectCommandType="StoredProcedure" />

</asp:Content>