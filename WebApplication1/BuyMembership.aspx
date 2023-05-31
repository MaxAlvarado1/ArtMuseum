<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BuyMembership.aspx.cs" Inherits="WebApplication1.BuyMembership" %>

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
            <asp:Label ID="LabelSignUpHeader" runat="server" Font-Bold="True" Font-Italic="False" Font-Size="28pt" Font-Underline="True" Text="BECOME A MEMBER TODAY"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="INTERESTED IN JOINING THE COMMUNITY?"></asp:Label>
            &nbsp;&nbsp;<br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="FREE GENERAL ADMISSION FOR ALL MEMBERS! "></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="Available Options: "></asp:Label>
            <br />
            <asp:Label ID="Label5" runat="server" Text="- Student: $40"></asp:Label>
            <br />
            <asp:Label ID="Label6" runat="server" Text="- Individual: $70"></asp:Label>
            <br />
            <br />
            <asp:Label ID="LabelSignUpHeader0" runat="server" Font-Bold="True" Font-Italic="False" Font-Size="28pt" Font-Underline="True" Text="Join Today"></asp:Label>
            <br />
            <br />
            <asp:Label ID="LabelFname" runat="server" Text="First Name: "></asp:Label>
            <asp:TextBox ID="InputFname" runat="server" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="LabelLname" runat="server" Text="Last Name: "></asp:Label>
            <asp:TextBox ID="InputLname" runat="server" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="LabelMemberType" runat="server" Text="Membership Type: "></asp:Label>
            <asp:DropDownList ID="InputMemberType" runat="server" Font-Overline="False" Font-Size="Small" Height="40px" style="margin-top: 0px">
                <asp:ListItem Value="40">Student - $40</asp:ListItem>
                <asp:ListItem Value="70">Individual - $70</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Button ID="ButtonSubmitSignUp" runat="server" Text="Buy Membership" OnClick="ButtonSubmitSignUp_Click" />
            <br />
            <br />
            <asp:Label ID="LabelSignUpSubmit" runat="server" Font-Size="8pt" ForeColor="Red"></asp:Label>
            <asp:Label ID="LabelNewMemberID" runat="server" Font-Size="12pt" ForeColor="Blue"></asp:Label>
        &nbsp;
            <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="&lt;- COPY THIS. USE THIS TO REGISTER." Visible="False"></asp:Label>
            <br />
            <br />
            <asp:Label ID="LabelSignUpHeader1" runat="server" Font-Bold="True" Font-Italic="False" Font-Size="28pt" Font-Underline="True" Text="Unsubscribe"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label7" runat="server" Text="Username: "></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            Passsword:
            <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" onClientClick = "javascript:return confirm('you sure you wanna do this?');" OnClick="Button1_Click" Text="Unsubscribe" />
            <br />
            <asp:Label ID="Label8" runat="server" Font-Size="10pt" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
            <br />
            <br />
        </div>
        <!--COPY AND PASTE BODY CONTENT HERE-->
    </form>
</body>
</html>
