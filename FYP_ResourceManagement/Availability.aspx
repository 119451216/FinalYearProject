<%@ Page Title="Availability - NeoDyne Ltd." Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Availability.aspx.cs" Inherits="FYP_ResourceManagement.Availability" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link src="~/css/style.css" rel="stylesheet" type="text/css" />

    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.4/index.global.js'></script>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.4/index.global.min.js"></script>

    <script type="module">
        // FullCalendar - https://fullcalendar.io
        document.addEventListener('DOMContentLoaded', function () {
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                plugins: [],
                initialView: 'dayGridMonth',
                headerToolbar: {
                    left: '',
                    center: 'title',
                    right: 'prev, next today'
                },
                editable: true,
                eventLimit: true
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
            });
            //$.ajax({
            //    url: '/requests', // URL of the server endpoint that returns the event data
            //    type: 'GET',
            //    dataType: 'json',
            //    success: function (response) {
            //        // Iterate over the event data and create FullCalendar event objects
            //        var events = [];
            //        response.forEach(function (event) {
            //            events.push({
            //                title: event.title,
            //                start: event.start_date,
            //                end: event.end_date,
            //                allDay: event.all_day
            //            });
            //        });

            //        calendar.renderEvents(request);
            calendar.render();
        });
    </script>

        <asp:Button runat="server" ID="btn_Add" OnClick="btn_Add_Click" Text="Add New Request" CssClass="btn_Add shading" />

    <div id="input_Container" runat="server">
        <asp:Table ID="tbl_Input" runat="server" CssClass="ts_Input" Visible="false">
            <asp:TableHeaderRow HorizontalAlign="Center">
                <asp:TableCell>
                    <asp:Label runat="server" ID="lbl_Header" Text="New Request Form" CssClass="lbl_Header gv_FooterTextbox" />
                </asp:TableCell>
            </asp:TableHeaderRow>
            <asp:TableRow>
                <asp:TableHeaderCell HorizontalAlign="Center">
                    <asp:Label runat="server" ID="lbl_Title" Text="Title:" CssClass="tbl_InputLabel" />
                </asp:TableHeaderCell>
                <asp:TableCell Horizontal-Align="Center">
                    <asp:TextBox ID="txt_Title" runat="server" CssClass="shading" autocomplete="off" />
                    <asp:RequiredFieldValidator runat="server" ID="rfv_Title" ControlToValidate="txt_Title" ErrorMessage="Title is a required field." CssClass="requiredValidator" />
                    <asp:Label runat="server" ID="lbl_TitleError" Text="Please enter a valid title." Visible="false" CssClass="errorTitle" />
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
                    <asp:Label runat="server" ID="lbl_Optional" CssClass="optional" Text="(Optional)" Font-Size="Small" />
                    <asp:Label runat="server" ID="lbl_InfoError" Text="Please enter valid information." CssClass="error" Visible="false" />
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

    <div id="calendar"></div>

</asp:Content>
