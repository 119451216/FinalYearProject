<%@ Page Title="Request Approval" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RequestApproval.aspx.cs" Inherits="FYP_ResourceManagement.RequestApproval" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <!-- Projects Table Container -->
    <div class="gv_Projects_Container">

        <!-- Projects GridView Header-->
        <h2>
            <asp:Label runat="server" ID="lbl_Header" Text="Requests:" Font-Size="X-Large" Font-Bold="true" />
        </h2>

        <!-- Projects GridView -->
        <asp:GridView runat="server" ID="gv_Requests" AutoGenerateColumns="false" ShowHeader="true" ShowHeaderWhenEmpty="true" ShowFooter="false" DataSourceID="ds_Requests" CssClass="gridview" >
            <Columns>
                <asp:TemplateField HeaderText="RequestID" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="gv_GridviewCss">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbl_RequestID" Text='<%# Eval("RequestID") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Request Title" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="gv_GridviewCss">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbl_Title" Text='<%# Eval("Title") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField runat="server" DataField="StartDate" DataFormatString="{0:d}" HeaderText="Start Date" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="dtp_Requests" />

                <asp:BoundField runat="server" DataField="EndDate" DataFormatString="{0:d}" HeaderText="End Date" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="dtp_Requests" />

                <asp:TemplateField HeaderText="Additional Info" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="gv_GridviewCss">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbl_AddInfo" Text='<%# Eval("AddInfo") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Username" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="gv_GridviewCss">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbl_Username" Text='<%# Eval("Username") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Approval" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="gv_GridviewCss">
                    <ItemTemplate>
                        <asp:ImageButton runat="server" ID="btn_Approve" OnClick="btn_Approve_Click" ImageUrl="~/img/icons/done_FILL1_wght400_GRAD0_opsz20.png" />
                        <asp:ImageButton runat="server" ID="btn_Disapprove" OnClick="btn_Disapprove_Click" ImageUrl="~/img/icons/close_FILL1_wght400_GRAD0_opsz20.png" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

    </div>

    <!-- SQL Data Sources -->
    <asp:SqlDataSource runat="server" ID="ds_Requests" ConnectionString="<%$ ConnectionStrings:ND_ResourceManagement %>" SelectCommand="P09002_REQUEST_Select" SelectCommandType="StoredProcedure" />

</asp:Content>