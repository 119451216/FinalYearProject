<%@ Page Title="Availability - NeoDyne Ltd." Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Availability.aspx.cs" Inherits="FYP_ResourceManagement.Availability" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link src="~/css/style.css" rel="stylesheet" type="text/css" />

    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.4/index.global.js'></script>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.4/index.global.min.js"></script>

    <%--<script>
//const { requestJson } = require("@fullcalendar/core/internal");

        // FullCalendar - https://fullcalendar.io

        document.addEventListener('DOMContentLoaded', function () {
            var calendarEl = document.getElementById('calendar');
                    var calendar = new FullCalendar.Calendar(calendarEl, {
                        plugins: [],
                        initialView: 'dayGridMonth',
                        //events: function (id, title, start, end, addInfo, callback) {
                        //    $.ajax({
                        //        url: 'Availability.aspx.cs',
                        //        type: 'GET',
                        //        dataType: 'json',
                        //        success: function (data) {
                        //            var events = $.map(data, function (event) {
                        //                return {
                        //                    title: event.title,
                        //                    start: event.start,
                        //                    end: event.end,
                        //                    addInfo: event.addInfo
                        //                };
                        //            });
                        //            callback(events);
                        //        }
                        //    });
                        //},
                        headerToolbar: {
                            left: '',
                            center: 'title',
                            right: 'prev, next today'
                        },
                        editable: true,
                        eventLimit: true
                    });
                    /*calendar.addEvents(events);*/
            calendar.render();
                });


                            //dateClick: function (date, jsEvent, view) {
                //    var title = prompt('Enter event title:');
                //    if (title) {
                //        $('#calendar').FullCalendar('renderEvent', {
                //            title: title,
                //            start: date,
                //            allDay: truechkAllDay.ClientID %>').checked;
                //        });
                //    }
                //}
    </script>--%>

        <asp:Button runat="server" ID="btn_Add" OnClick="btn_Add_Click" Text="Add New Request" CssClass="btn_Add shading" />

    <div id="input_Container" runat="server">
        <asp:Table ID="tbl_Input" runat="server" CssClass="ts_Input" Visible="false">
            <asp:TableHeaderRow HorizontalAlign="Center">
                <asp:TableCell>
                    <asp:Label runat="server" ID="lbl_Header" Text="New Request Form" CssClass="lbl_Header gv_FooterTextbox" />
                </asp:TableCell>
            </asp:TableHeaderRow>
            <asp:TableRow HorizontalAlign="Center" Visible="false">
                <asp:TableCell Visible="false">
                    <asp:Label runat="server" ID="lbl_RequestID" Text='' Visible="false" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableHeaderCell HorizontalAlign="Center">
                    <asp:Label runat="server" ID="lbl_Title" Text="Title:" CssClass="tbl_InputLabel" />
                </asp:TableHeaderCell>
                <asp:TableCell Horizontal-Align="Center">
                    <asp:TextBox ID="txt_Title" runat="server" CssClass="shading" autocomplete="off" />
                    <div class="error_Container">
                        <asp:RequiredFieldValidator runat="server" ID="rfv_Title" ControlToValidate="txt_Title" ErrorMessage="Title is a required field." CssClass="requiredValidator validator_Title rfv_Title" />
                        <asp:RegularExpressionValidator ID="rev_Title" runat="server" ControlToValidate="txt_Title" ValidationExpression="[a-zA-Z ]*$" ErrorMessage="Please enter valid characters." CssClass="error requiredValidator validator_Title" />
                    </div>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableHeaderCell HorizontalAlign="Center">
                    <asp:Label runat="server" ID="lbl_StartDate" Text="Start Date:" CssClass="tbl_InputLabel" />
                </asp:TableHeaderCell>
                <asp:TableCell Horizontal-Align="Center">
                    <asp:TextBox ID="txt_StartDate" ReadOnly="true" runat="server" CssClass="shading"></asp:TextBox>
                    <asp:ImageButton ID="img_StartDate" runat="server" ImageUrl="~/img/icons/edit_FILL1_wght400_GRAD0_opsz20.png" AlternateText="Show Calendar" OnClick="img_StartDate_Click" />
                    <asp:Calendar ID="cal_StartDatePicker" runat="server" OnSelectionChanged="cal_StartDatePicker_SelectionChanged" Visible="false" CssClass="calendarSelect shading" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableHeaderCell HorizontalAlign="Center">
                    <asp:Label runat="server" ID="lbl_EndDate" Text="End Date:" CssClass="tbl_InputLabel" />
                </asp:TableHeaderCell>
                <asp:TableCell>
                    <asp:TextBox ID="txt_EndDate" ReadOnly="true" runat="server" CssClass="shading"></asp:TextBox>
                    <asp:ImageButton ID="imgDate" runat="server" ImageUrl="~/img/icons/edit_FILL1_wght400_GRAD0_opsz20.png" AlternateText="Show Calendar" OnClick="img_EndDate_Click" />
                    <asp:Calendar ID="cal_EndDatePicker" runat="server" OnSelectionChanged="cal_EndDatePicker_SelectionChanged" Visible="false" CssClass="calendarSelect shading" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableHeaderCell HorizontalAlign="Center">
                    <asp:Label runat="server" ID="lbl_Info" Text="Additional Info:" CssClass="tbl_InputLabel" />
                </asp:TableHeaderCell>
                <asp:TableCell>
                    <asp:TextBox runat="server" ID="txt_Info" CssClass="shading" autocomplete="off" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_Info" ValidationExpression="[a-zA-Z ]*$" ErrorMessage="Please enter valid characters." CssClass="error requiredValidator" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableFooterRow HorizontalAlign="Center">
                <asp:TableCell></asp:TableCell>
                <asp:TableCell>
                    <asp:Button runat="server" ID="btn_Submit" Text="Submit" CssClass="btn_Submit shading" OnClick="btn_Submit_Click" />
                </asp:TableCell>
            </asp:TableFooterRow>
        </asp:Table>
    </div>
    <div class="calendar">
        <asp:Calendar ID="cal_Leave" runat="server" BorderWidth="1px" NextPrevFormat="FullMonth" CssClass="cal_Leave" OnSelectionChanged="cal_Leave_SelectionChanged"  Width="300px" Height="300px" >
            <TodayDayStyle BackColor="#CCCCCC" />
            <NextPrevStyle Font-Size="8pt" Font-Bold="true" ForeColor="#333333" VerticalAlign="Bottom" />
            <DayHeaderStyle Font-Size="8pt" Font-Bold="True" />
            <SelectedDayStyle ForeColor="White" BackColor="#333399" />
            <TitleStyle Font-Size="12pt" Font-Bold="True" BorderWidth="2px" ForeColor="#333399" BorderColor="Black" BackColor="White" />
            <OtherMonthDayStyle ForeColor="#999999" />
        </asp:Calendar>
    </div>

        <asp:GridView ID="gv_Events" runat="server" AutoGenerateColumns="false" CssClass="gridviewCss gv_Events">
            <Columns>
                <asp:BoundField DataField="LeaveTitle" HeaderText="Title" ItemStyle-CssClass="gv_GridviewCss" />
                <asp:BoundField DataField="LeaveStartDate" HeaderText="Start Date" ItemStyle-CssClass="gv_GridviewCss" DataFormatString="{0:dd-MMM-yyyy}" />
                <asp:BoundField DataField="LeaveEndDate" HeaderText="End Date" ItemStyle-CssClass="gv_GridviewCss" DataFormatString="{0:dd-MMM-yyyy}" />
                <asp:BoundField DataField="Username" HeaderText="Username" ItemStyle-CssClass="gv_GridviewCss" />
            </Columns>
        </asp:GridView>

</asp:Content>
