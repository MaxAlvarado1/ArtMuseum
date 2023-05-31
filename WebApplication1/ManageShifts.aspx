<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageShifts.aspx.cs" Inherits="WebApplication1.ManageShifts" %>

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
            
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="28pt" Font-Underline="True" Text="Manage Shifts"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Add Shifts: " Font-Bold="True" Font-Size="18pt"></asp:Label>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Employee: "></asp:Label>
            
            
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Column1" DataValueField="ID_num">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString %>" SelectCommand="SELECT (Name + ': ' + job_Title), ID_num FROM museumSchema.Employees"></asp:SqlDataSource>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Shift Start:  "></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" TextMode="DateTimeLocal"></asp:TextBox>
            <br />
            <asp:Label ID="Label5" runat="server" Text="Shift End: "></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" TextMode="DateTimeLocal"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Add Shift" OnClick="Button1_Click" />
            <br />
            <asp:Label ID="Label7" runat="server" Text="Add Shift Successful !" Font-Size="10pt" ForeColor="Red" Visible="False"></asp:Label>
            <br />
            <br />
            <br />
            <div style="margin-left: auto; margin-right: auto; text-align: center;">
                <asp:Label ID="Label6" runat="server" Text="SELECT A DATE TO VIEW SHIFTS." Font-Bold="True" Font-Size="14pt"></asp:Label>
                <br />
                <br />
                <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="Black" DayNameFormat="Shortest" EnableTheming="True" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="300px" NextPrevFormat="FullMonth" OnSelectionChanged="Calendar1_SelectionChanged" Width="1250px">
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" ForeColor="#333333" Height="10pt" />
                    <DayStyle Width="14%" />
                    <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
                    <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
                    <TodayDayStyle BackColor="#CCCC99" />
                </asp:Calendar>
                <br />
                <br />
                <asp:Label ID="Label15" runat="server" Font-Size="9pt" ForeColor="Blue" Text="One or more entries required." Visible="False"></asp:Label>
            <br />
            <asp:Label ID="Label11" runat="server" Text="Employee: " Visible="False"></asp:Label>
            
            
            <asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="true" DataSourceID="SqlDataSource1" DataTextField="Column1" DataValueField="ID_num" Visible="False">
                <asp:ListItem>No Change</asp:ListItem>
            </asp:DropDownList>
                <asp:Label ID="Label12" runat="server" Text="Label" Visible="False"></asp:Label>
                <br />
            <asp:Label ID="Label9" runat="server" Text="Shift Start:  " Visible="False"></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server" TextMode="DateTimeLocal" Visible="False"></asp:TextBox>
                <asp:Label ID="Label13" runat="server" Text="Label" Visible="False"></asp:Label>
            <br />
            <asp:Label ID="Label10" runat="server" Text="Shift End: " Visible="False"></asp:Label>
            <asp:TextBox ID="TextBox4" runat="server" TextMode="DateTimeLocal" Visible="False"></asp:TextBox>
                <asp:Label ID="Label14" runat="server" Text="Label" Visible="False"></asp:Label>
                <br />
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Confirm Edit" Visible="False" />
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" OnRowCommand="GridView1_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Name" />
                        <asp:BoundField DataField="employeeID" HeaderText="Employee ID" />
                        <asp:BoundField DataField="startDateTime" HeaderText="Shift Start" />
                        <asp:BoundField DataField="endDateTime" HeaderText="Shift End" />
                        <asp:ButtonField Text="Delete" CommandName="DeleteShift" HeaderText="Delete Shift" ButtonType="Button" />
                        <asp:ButtonField ButtonType="Button" CommandName="EditShift" HeaderText="Edit Shift" Text="Edit" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="Gray" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString %>" SelectCommand="SELECT museumSchema.Employees.Name, museumSchema.shifts.employeeID, museumSchema.shifts.startDateTime, museumSchema.shifts.endDateTime FROM museumSchema.shifts INNER JOIN museumSchema.employees ON museumSchema.shifts.employeeID = museumSchema.Employees.ID_num"></asp:SqlDataSource>
                <asp:Label ID="Label8" runat="server" Text="Label" Visible="False"></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label16" runat="server" Font-Bold="True" Font-Size="18pt" Text="Requsted Shifts Off"></asp:Label>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataSourceID="SqlDataSource4" ForeColor="Black" Width="1250px" OnRowCommand="GridView2_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="employeeID" HeaderText="employeeID" SortExpression="employeeID" />
                        <asp:BoundField DataField="startDateTime" HeaderText="startDateTime" SortExpression="startDateTime" />
                        <asp:BoundField DataField="endDateTime" HeaderText="endDateTime" SortExpression="endDateTime" />
                        <asp:ButtonField ButtonType="Button" CommandName="Accept" Text="Delete Shift" />
                        <asp:ButtonField ButtonType="Button" CommandName="Deny" Text="Deny Request" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="Gray" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString %>" SelectCommand="SELECT Employees.Name, Requested.employeeID, Requested.startDateTime, Requested.endDateTime FROM museumSchema.Requested INNER JOIN museumSchema.Employees ON Requested.employeeID = Employees.ID_num"></asp:SqlDataSource>
                <asp:Label ID="Label17" runat="server" Text="Label" Visible="False"></asp:Label>
                <br />
                <br />
                <br />
                <br />
                <br />
            </div>
            <br />
        </div>
        <!--COPY AND PASTE BODY CONTENT HERE-->
    </form>
</body>
</html>

