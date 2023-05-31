<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TicketsReport.aspx.cs" Inherits="WebApplication1.TicketsReport" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Azeret+Mono" />
    <link href="HeaderStyle.css" rel="stylesheet" />
    <title></title>
    <style>
        .SignOut {
            color: white;
        }
        .SignOut:hover {
            color: #FFFFCC;
            cursor: pointer;
        }
        .floatL {
            float: left;
        }
        .floatR {
            float:  right;
        }
        .title {
            width: 1250px;
            text-align: center;
            display:inline-block;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <div class="innerHeader">
                <div class="logo">
                    <h1><a href="AdminHome.aspx">MFA, <span>Museum Of Fine Arts</span></a></h1>
                </div>
                <div class="SignIn">
                    <p><asp:Label ID="HelloName" runat="server" Text="Hello, Admin" Visible="False"></asp:Label></p>
                    <a href="AdminHome.aspx"><p id="sign">
                        <asp:Button ID="SignOutButton" runat="server" BackColor="#101010" BorderStyle="None" CssClass="SignOut" Font-Names="&quot;Azeret Mono&quot;" Font-Size="12pt" Text="Sign Out" OnClick="SignOutButton_Click" Visible="False" />
                    </p></a>
                </div>
            </div>
        </div>
        <div class="nav">
            <div class="innerNav">
                <ul>
                    <!-- CHANGE NAVIGATOR TABS HERE-->
                    <li><a href="ManageEmployee.aspx">Employees</a></li>
                    <li><a href="ManageShifts.aspx">Shifts</a></li>
                    <li><a href="ManageArtsArtists.aspx">Arts/Artists</a></li>
                    <li><a href="ManageCollections.aspx">Collections</a></li>
                    <li><a href="ManageExhibitions.aspx">Exhibitions</a></li>
                    <li><a href="ManageFilmsDirectors.aspx">Films/Directors</a></li>
                    <li><a href="ManageMerchandise.aspx">Merchandise</a></li>
                    <li><a href="ManageTickets.aspx">Tickets</a></li>
                    <li><a href="ManageLocations.aspx">Locations</a></li>
                    <li><a href="ManageMembers.aspx">Members</a></li>
                    <li><a href="MerchandiseReport.aspx">Merchandise Report</a></li>
                    <li><a href="TicketsReport.aspx">Tickets Report</a></li>
                    <li><a href="RevenueReport.aspx">Revenue Report</a></li>
                    <!-- CHANGE NAVIGATOR TABS HERE-->
                </ul>
            </div>
        </div>

        <div class="BodyContent">
            <div>
                <br />
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="28pt" Font-Underline="True" Text="Tickets Report: "></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label2" runat="server" Text="Start Date: "></asp:Label>
                <asp:TextBox ID="StartDateBox" runat="server" TextMode="Date"></asp:TextBox>
                &nbsp;<br />
                <br />
                <asp:Label ID="Label3" runat="server" Text="End Date: "></asp:Label>
                <asp:TextBox ID="EndDateBox" runat="server" TextMode="Date"></asp:TextBox>
                <br />
                <br />
                Ticket Type<asp:DropDownList ID="TicketDrop" runat="server" DataSourceID="SqlDataSourceTicketType" DataTextField="ticket_Type" DataValueField="ticket_Type">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceTicketType" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString %>" SelectCommand="SELECT ticket_Type FROM museumSchema.Tickets WHERE ticket_Type != 'Child' AND ticket_Type != 'Member'"></asp:SqlDataSource>
                <br />
                <br />
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Generate Report" />
            </div>
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" Text="Percentage of Ticket Type Revenue Compared to Total Ticket Revenue" Font-Bold="True" CssClass="title"></asp:Label>
            <br />
            <br />
            <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSourcePieChart" BackColor="255, 255, 204" BackImageTransparentColor="255, 255, 204" BackSecondaryColor="255, 255, 204" BorderlineColor="255, 255, 204" Height="400px" RightToLeft="Yes" Width="615px" CssClass="floatL">
                <Series>
                    <asp:Series ChartType="Pie" Name="Series1" XValueMember="ticket Category" YValueMembers="Revenue" Legend="Legend1">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
                <Legends>
                    <asp:Legend Name="Legend1">
                    </asp:Legend>
                </Legends>
                <BorderSkin BackColor="255, 255, 204" BackImageTransparentColor="255, 255, 204" BackSecondaryColor="255, 255, 204" BorderColor="255, 255, 204" PageColor="255, 255, 204" SkinStyle="Emboss" />
            </asp:Chart>
            <asp:SqlDataSource ID="SqlDataSourcePieChart" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString %>" SelectCommand="SELECT total_Revenue AS 'Revenue', ticketType AS 'ticket Category' FROM museumSchema.ticketReportSupportTable"></asp:SqlDataSource>
            <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSourcePieChart2" BackColor="255, 255, 204" BackImageTransparentColor="255, 255, 204" BackSecondaryColor="255, 255, 204" BorderlineColor="255, 255, 204" Height="400px" RightToLeft="Yes" Width="615px" CssClass="floatR">
                <Series>
                    <asp:Series ChartType="Pie" Name="Series1" XValueMember="ticketType" YValueMembers="total_Revenue">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
                <Legends>
                    <asp:Legend Name="Legend1">
                    </asp:Legend>
                </Legends>
                <BorderSkin BackColor="255, 255, 204" BackImageTransparentColor="255, 255, 204" BackSecondaryColor="255, 255, 204" BorderColor="255, 255, 204" PageColor="255, 255, 204" SkinStyle="Emboss" />
            </asp:Chart>
            <asp:SqlDataSource ID="SqlDataSourcePieChart2" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString %>" SelectCommand="SELECT * FROM museumSchema.ticketReportSupportTableB"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="Total Revenue For Each Ticket Type From Selected Date Range" Font-Bold="True" CssClass="title"></asp:Label>
            <p>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceMainTableB" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Width="400px" HorizontalAlign="Center">
                    <Columns>
                        <asp:BoundField DataField="Ticket Type" HeaderText="Ticket Type" SortExpression="Ticket Type" />
                        <asp:BoundField DataField=" Total Revenue" HeaderText=" Total Revenue" SortExpression=" Total Revenue" DataFormatString="${0:#,0}.00" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceMainTableB" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString %>" SelectCommand="SELECT ticketType AS 'Ticket Type', total_Revenue AS ' Total Revenue' FROM museumSchema.ticketReportSupportTableB"></asp:SqlDataSource>
            </p>
            <br />
            <asp:Label ID="Label6" runat="server" Text="All Tickets Bought From Selected Date Range" Font-Bold="True" CssClass="title"></asp:Label>
            <br />
            <br />
            <asp:GridView ID="reportView" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Width="600px">
                <Columns>
                    <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:dd-M-yyyy}" />
                    <asp:BoundField DataField="Customer" HeaderText="Customer Name" />
                    <asp:BoundField DataField="Tickets Bought" HeaderText="Tickets Bought" />
                    <asp:BoundField DataField="Total Price" HeaderText="Total Price" DataFormatString="${0:#,0}.00" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                <RowStyle BackColor="White" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
        </div>
        <!--COPY AND PASTE BODY CONTENT HERE-->
    </form>
</body>
</html>

