<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="WebApplication1.AdminHome" %>

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
            <br />
            &nbsp;<asp:Label ID="Label1" runat="server" Text="WELCOME TO THE HOUSTON MUSEUM OF FINE ARTS " Font-Bold="True" Font-Size="27pt"></asp:Label>
            <br />
            <br />
            <iframe width="1250" height="750" src="https://www.youtube.com/embed/ZuWmo4SpZf0?autoplay=1&mute=1&controls=0&playlist=ZuWmo4SpZf0&loop=1"></iframe>
        </div>
        <!--COPY AND PASTE BODY CONTENT HERE-->
    </form>
</body>
</html>
