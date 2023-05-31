<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebApplication1.Home" %>

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
        .nav {
            height: 60px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <div class="innerHeader">
                <div class="logo">
                    <h1><a href="Home.aspx">MFA, <span>Museum Of Fine Arts</span></a></h1>
                </div>
                <div class="SignIn">
                    <p><asp:Label ID="HelloName" runat="server" Text="Hello, Admin" Visible="False"></asp:Label></p>
                    <a href="SignIn.aspx"><p id="sign"><asp:Label ID="SignButton" runat="server" Text="Sign In"></asp:Label></p></a>
                    <a href="Home.aspx"><p id="sign">
                        <asp:Button ID="SignOutButton" runat="server" BackColor="#101010" BorderStyle="None" CssClass="SignOut" Font-Names="&quot;Azeret Mono&quot;" Font-Size="12pt" Text="Sign Out" OnClick="SignOutButton_Click" Visible="False" />
                    </p></a>
                </div>
            </div>
        </div>
        <div class="nav">
            <div class="innerNav">
                <ul>
                    <!-- CHANGE NAVIGATOR TABS HERE-->
                    <li><a href="ViewArtsArtists.aspx">Arts and Artists</a></li>
                    <li><a href="ViewCollections.aspx">Collections</a></li>
                    <li><a href="ViewExhibitions.aspx">Exhibitions</a></li>
                    <li><a href="ViewFilmsDirectors.aspx">Films and Directors</a></li>
                    <li><a href="BuyMembership.aspx">Membership</a></li>
                    <li><a href="BuyDonation.aspx">Donate</a></li>
                    <li><a href="BuyMerchandise.aspx">Merchandise</a></li>
                    <li><a href="BuyTicket.aspx">Tickets</a></li>
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
