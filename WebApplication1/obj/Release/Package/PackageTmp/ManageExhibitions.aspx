<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageExhibitions.aspx.cs" Inherits="WebApplication1.ManageExhibitions" %>

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
            <asp:Panel ID="Panel1" runat="server">
                <br />
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="28pt" Font-Underline="True" Text="Manage Exhibitions"></asp:Label>
                <br />
                <br />
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="exhibit_name" DataSourceID="SqlDataSource1" ForeColor="Black" Width="1250px">
                    <Columns>
                        <asp:BoundField DataField="exhibit_name" HeaderText="Exhibition Name" ReadOnly="True" SortExpression="exhibit_name" />
                        <asp:BoundField DataField="artist_name" HeaderText="Artist Name" SortExpression="artist_name" />
                        <asp:BoundField DataField="location_num" HeaderText="Location Number" SortExpression="location_num" />
                        <asp:BoundField DataField="start_dates" HeaderText="Start Date" SortExpression="start_dates" />
                        <asp:BoundField DataField="end_dates" HeaderText="End Date" SortExpression="end_dates" />
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString %>" SelectCommand="SELECT * FROM museumSchema.Exhibitions"></asp:SqlDataSource>
            <br />
            <br />
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="18pt" Font-Underline="False" Text="Create Exhibition: "></asp:Label>
                <br />
                <br /> 
                <asp:Label ID="Label3" runat="server" Text="Exhibition Name: "></asp:Label>
                <asp:TextBox ID="ExhibitNameField" runat="server"></asp:TextBox>
                <br />
            <br />
                <asp:Label ID="Label4" runat="server" Text="Artist Name: "></asp:Label>
            <asp:DropDownList ID="ArtistDropDownList" runat="server" DataSourceID="SqlDataSourceArtistList" DataTextField="artistName" DataValueField="artistName">
            </asp:DropDownList>
                <br />
            <asp:SqlDataSource ID="SqlDataSourceArtistList" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString %>" SelectCommand="SELECT artistName FROM museumSchema.Artist"></asp:SqlDataSource>
            <br />
                <asp:Label ID="Label5" runat="server" Text="Location Held: "></asp:Label>
            <asp:DropDownList ID="LocationDropDownList" runat="server" DataSourceID="SqlDataSourceLocationNums" DataTextField="locName" DataValueField="locName">
            </asp:DropDownList>
                <br />
            <asp:SqlDataSource ID="SqlDataSourceLocationNums" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString %>" SelectCommand="SELECT locName FROM museumSchema.Location WHERE locName = 'Gallery' OR locName = 'Exhibition Room'"></asp:SqlDataSource>
                <br />
                <asp:Label ID="Label6" runat="server" Text="Start Date: "></asp:Label>
                <asp:TextBox ID="StartDateField" runat="server" TextMode="Date"></asp:TextBox>
                <br />
            <br />
                <asp:Label ID="Label7" runat="server" Text="End Date: "></asp:Label>
                <asp:TextBox ID="EndDateField" runat="server" TextMode="Date"></asp:TextBox>
                <br />
            <br />
            <asp:Button ID="InsertButton" runat="server" OnClick="InsertButton_Click" Text="Create Exhibition" />
            <br />
            <asp:Label ID="ErrorLabel" runat="server" Text="Label" Visible="False"></asp:Label>
            <br />
            <br />
                <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSourceExhibitionsManager" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString %>" SelectCommand="SELECT * FROM museumSchema.Exhibitions"></asp:SqlDataSource>
                <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="18pt" Text="Update Exhibition: "></asp:Label>
            <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                <asp:Label ID="Label9" runat="server" Text="Update Exhibition Name: "></asp:Label>
            <asp:TextBox ID="oldExhibitName" runat="server"></asp:TextBox>
                <br />
            <br />
                -----------------------------------------------<br />
                <br />
                <asp:Label ID="Label10" runat="server" Text="New Exhibition Name: "></asp:Label>
            <asp:TextBox ID="newExhibitName" runat="server"></asp:TextBox>
                <br />
            <br />
                <asp:Label ID="Label11" runat="server" Text="New Artist Name: "></asp:Label>
            <asp:DropDownList ID="newArtistDropDown" runat="server" DataSourceID="SqlDataSourceArtistList" DataTextField="artistName" DataValueField="artistName">
            </asp:DropDownList>
                <br />
            <br />
                <asp:Label ID="Label12" runat="server" Text="New Location Number: "></asp:Label>
            <asp:DropDownList ID="newLocationDropDown" runat="server" DataSourceID="SqlDataSourceLocationNums" DataTextField="locName" DataValueField="locName">
            </asp:DropDownList>
                <br />
            <br />
                <asp:Label ID="Label13" runat="server" Text="New Start Date: "></asp:Label>
            <asp:TextBox ID="newStartDate" runat="server" TextMode="Date"></asp:TextBox>
                <br />
            <br />
                <asp:Label ID="Label14" runat="server" Text="New End Date: "></asp:Label>
            <asp:TextBox ID="newEndDate" runat="server" TextMode="Date"></asp:TextBox>
                <br />
            <br />
            <asp:Button ID="UpdateButton" runat="server" onClientClick = "javascript:return confirm('you sure you wanna do this?');" OnClick="UpdateButton_Click" Text="Update Exhibition" />
            <br />
            <asp:Label ID="ErrorLabel2" runat="server" Text="Label" Visible="False"></asp:Label>
            <br />
                <br />
                <br />
                <br />
                <asp:Label ID="Label15" runat="server" Font-Bold="True" Font-Size="18pt" Text="Delete Exhibition: "></asp:Label>
                <br />
            <br />
                <asp:Label ID="Label16" runat="server" Text="Delete Exhibition Name: "></asp:Label>
            <asp:TextBox ID="deleteExhibitNameTextBox" runat="server"></asp:TextBox>
                <br />
            <br />
            <asp:Button ID="DeleteButton" runat="server" onClientClick = "javascript:return confirm('you sure you wanna do this?');" OnClick="DeleteButton_Click" Text="Delete Exhibition" />
            <br />
            <asp:Label ID="ErrorLabel3" runat="server" Text="Label" Visible="False"></asp:Label>
            <br />
            <br />
        </asp:Panel>
        </div>
        <!--COPY AND PASTE BODY CONTENT HERE-->
    </form>
</body>
</html>

