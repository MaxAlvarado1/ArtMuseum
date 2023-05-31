<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageFilmsDirectors.aspx.cs" Inherits="WebApplication1.ManageFilmsDirectors" %>

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
        .Films {
            width: 615px;
            height: 100%;
            float: left;
        }
        .Director {
            width: 615px;
            height: 100%;
            float: right;
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
            <div class="Films">
            <br />
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="28pt" Font-Underline="True" Text="Manage Films"></asp:Label>
            <br />    
            <br />
            <br />
                <asp:GridView ID="FilmsView" runat="server" AutoGenerateColumns="False" DataKeyNames="filmName" DataSourceID="SqlDataSourceFilms" HorizontalAlign="Center" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" AllowSorting="True" style="margin-left: 0px" Width="615px" Font-Size="9pt">
                    <Columns>
                        <asp:BoundField DataField="filmName" HeaderText="Film Name" ReadOnly="True" SortExpression="filmName" />
                        <asp:BoundField DataField="directorName" HeaderText="Director Name" SortExpression="directorName" />
                        <asp:BoundField DataField="filmCompany" HeaderText="Film Company" SortExpression="filmCompany" />
                        <asp:BoundField DataField="releaseDate" HeaderText="Release Date" SortExpression="releaseDate" />
                        <asp:BoundField DataField="film_Location" HeaderText="Film Location" SortExpression="film_Location" />
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
                <asp:SqlDataSource ID="SqlDataSourceFilms" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString %>" SelectCommand="SELECT * FROM museumSchema.Films"></asp:SqlDataSource>
            <p><asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="18pt" Text="Add Film:"></asp:Label></p>
            <p>Film Name: <asp:TextBox ID="filmNameInsert" runat="server"></asp:TextBox></p>
            <p>Director Name: <asp:DropDownList ID="directiorNameInsertDrop" runat="server" DataSourceID="SqlDataSourceDirectorList" DataTextField="directorName" DataValueField="directorName"></asp:DropDownList></p>
            <asp:SqlDataSource ID="SqlDataSourceDirectorList" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString %>" SelectCommand="SELECT directorName, dateOfBirth, dateOfDeath FROM museumSchema.Director "></asp:SqlDataSource>
            Film Company:
            <asp:TextBox ID="filmCompanyInsert" runat="server"></asp:TextBox>
            <br />
            <br />
            Release Date:
            <asp:TextBox ID="releaseDateInsert" runat="server" TextMode="Date"></asp:TextBox>
            <br />
            <br />
            Film Location:
            <asp:DropDownList ID="filmLocationInsertDrop" runat="server" DataSourceID="SqlDataSourceFilmLocation" DataTextField="locName" DataValueField="locName">
            </asp:DropDownList>
            <br />
            <asp:SqlDataSource ID="SqlDataSourceFilmLocation" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString %>" SelectCommand="SELECT locName FROM museumSchema.Location"></asp:SqlDataSource>
            <br />
            <asp:Button ID="InsertFilms" runat="server" OnClick="InsertFilms_Click" Text="Add Film" />
            <br />
            <br />
            <br />
            <p>
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="18pt" Text="Update Film:"></asp:Label>
                </p>
            <p>Old Film Name: 
                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1" DataTextField="filmName" DataValueField="filmName">
                </asp:DropDownList>
                </p>
            <p>-----------------------------------------------</p>
            <p>New Film Name: <asp:TextBox ID="newFilmNameUpdate" runat="server" Height="16px"></asp:TextBox>
            </p>
            <p>
                New Film Director:
            <asp:DropDownList ID="UpdateDirectorDrop" AppendDataBoundItems="true" runat="server" DataSourceID="SqlDataSourceDirectorList" DataTextField="directorName" DataValueField="directorName">
                <asp:ListItem Selected="True">No Change</asp:ListItem>
            </asp:DropDownList>
            </p>
            New Film Company:
            <asp:TextBox ID="newFilmCompanyUpdate" runat="server"></asp:TextBox>
            <br />
            <br />
            New Release Date:
            <asp:TextBox ID="newReleaseDateUpdate" runat="server" TextMode="Date"></asp:TextBox>
            <br />
            <br />
            New Location:
            <asp:DropDownList ID="UpdateLocationDrop" AppendDataBoundItems="true" runat="server" DataSourceID="SqlDataSourceFilmLocation" DataTextField="locName" DataValueField="locName">
                <asp:ListItem Selected="True">No Change</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Button ID="UpdateButton" runat="server" onClientClick = "javascript:return confirm('you sure you wanna do this?');" OnClick="UpdateButton_Click" Text="Update Film" />
            <br />
            <br />
            <br />
            <br />
                <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="18pt" Text="Delete Film:"></asp:Label>
                <br />
            <br />
            Film Name:
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="filmName" DataValueField="filmName">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString %>" SelectCommand="SELECT * FROM museumSchema.films"></asp:SqlDataSource>
            <br />
            <br />
            <asp:Button ID="DeleteButton" runat="server" onClientClick = "javascript:return confirm('you sure you wanna do this?');" OnClick="DeleteButton_Click" Text="Delete Film" />
            <br />
            <br />
            <br />
            <br />
            <br />
            </div>
            <div class="Director">
                <br />
                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="28pt" Font-Underline="True" Text="Manage Directors"></asp:Label>
                <br />
                <br />
                <div>
                <br />
                <asp:GridView ID="DirectorView" runat="server" AutoGenerateColumns="False" DataKeyNames="directorName" DataSourceID="SqlDataSourceDirectorList" AllowSorting="True" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Width="615px" Font-Size="9pt">
                    <Columns>
                        <asp:BoundField DataField="directorName" HeaderText="Director Name" ReadOnly="True" SortExpression="directorName" />
                        <asp:BoundField DataField="dateOfBirth" HeaderText="Date of Birth" SortExpression="dateOfBirth" />
                        <asp:BoundField DataField="dateOfDeath" HeaderText="Date of Death" SortExpression="dateOfDeath" />
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
                <asp:SqlDataSource ID="SqlDataDirectorList" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString %>" SelectCommand="SELECT * FROM museumSchema.Director"></asp:SqlDataSource>
                <br />
                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="18pt" Text="Add Director:"></asp:Label>
                    <br />
                <br />
                Director Name: <asp:TextBox ID="InsertDirectorNameBox" runat="server"></asp:TextBox>
                    <br />
                <br />
                Date Of Birth:
            <asp:TextBox ID="InsertBirthdayBox" runat="server" TextMode="Date"></asp:TextBox>
                </div>
            <br />
            Date Of Death:
            <asp:TextBox ID="InsertDeathDayBox" runat="server" TextMode="Date"></asp:TextBox>
                (Leave blank if the director is still alive)<br />
            <br />
            <asp:Button ID="InsertButton" runat="server" OnClick="InsertButton_Click" Text="Add Director" />
            <br />
                <br />
                <br />
            <br />
                    <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="18pt" Text="Update Director:"></asp:Label>
                    <br />
            <br />
            Director to be updated: 
                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataDirectorList" DataTextField="directorName" DataValueField="directorName">
                </asp:DropDownList>
                <br />
                <br />
                -----------------------------------------------<br />
            <br />
            New Director Name: <asp:TextBox ID="newDirectorNameBox" runat="server"></asp:TextBox>
                <br />
            <br />
            New Date Of Birth:
            <asp:TextBox ID="newBirthDayBox" runat="server" TextMode="Date" style="margin-bottom: 0px"></asp:TextBox>
                <br />
            <br />
            New Date Of Death:
            <asp:TextBox ID="newDeathDayBox" runat="server" TextMode="Date"></asp:TextBox>
                <br />
            <br />
                <asp:Button ID="Button3" runat="server" onClientClick = "javascript:return confirm('you sure you wanna do this?');" OnClick="Button3_Click" Text="Update Director" />
            <br />
                <br />
                <br />
            <br />
                    <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="18pt" Text="Delete Director:"></asp:Label>
                    <br />
            <br />
            Director Name:
                <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataDirectorList" DataTextField="directorName" DataValueField="directorName">
                </asp:DropDownList>
                <br />
            <p>
                <asp:Button ID="Button4" runat="server" onClientClick = "javascript:return confirm('you sure you wanna do this?');" OnClick="Button4_Click" Text="Delete Director" />
            </p>
        </div>
        </div>
        <!--COPY AND PASTE BODY CONTENT HERE-->
    </form>
</body>
</html>

