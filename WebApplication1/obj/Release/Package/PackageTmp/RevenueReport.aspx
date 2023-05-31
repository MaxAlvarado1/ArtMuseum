<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RevenueReport.aspx.cs" Inherits="WebApplication1.RevenueReport" %>

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
        .chart {
            align-content: center;
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

        <!--COPY AND PASTE BODY CONTENT HERE-->
        <div class="BodyContent">
            <div>
                <br />
                <asp:Label ID="Label4" runat="server" Font-Size="28pt" Text="Revenue Report: " Font-Bold="True" Font-Underline="True"></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label1" runat="server" Font-Size="18pt" Text="Time Frame: "></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label2" runat="server" Font-Underline="False" Text="Start Date: "></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server" TextMode="Date"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label3" runat="server" Font-Underline="False" Text="End Date: "></asp:Label>
                <asp:TextBox ID="TextBox2" runat="server" TextMode="Date"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Generate Report" />
                <br />
                <asp:Label ID="Report_Success" runat="server" Font-Size="8pt" ForeColor="Blue" Visible="False"></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="18pt" Text="Total Revuenue From Selected Dates." CssClass="title"></asp:Label>
                <br />
                <div class="chart">
                    <asp:Chart ID="Revenue_Chart" runat="server" Height="400px" Width="615px" DataSourceID="SqlDataSourceRevenue" BackColor="255, 255, 204" BackImageTransparentColor="255, 255, 204" BackSecondaryColor="255, 255, 204" BorderlineColor="255, 255, 204" RightToLeft="Yes" align="center" CssClass="title">
                        <Series>
                            <asp:Series Name="Series1" ChartType="Pie" Legend="Legend1"  XValueMember="saletype" YValueMembers="amount">
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
                </div>
                <asp:SqlDataSource ID="SqlDataSourceRevenue" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString %>" SelectCommand="SELECT * FROM museumSchema.revenueReportGraph"></asp:SqlDataSource>
                <br />
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataSourceID="SqlDataSourceRevenue" ForeColor="Black" HorizontalAlign="Center">
                    <Columns>
                        <asp:BoundField DataField="saletype" HeaderText="Revenue Type" />
                        <asp:BoundField DataField="amount" DataFormatString="${0:#,0}.00" HeaderText="Total Revenue" />
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
                <br />
            </div>
        </div>
        <!--COPY AND PASTE BODY CONTENT HERE-->
    </form>
</body>
</html>

