<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewArtsArtists.aspx.cs" Inherits="WebApplication1.ViewArtsArtists" %>

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
        .Arts {
            width: 615px;
            height: 100%;
            float: left;
        }
        .Artists {
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
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="28pt" Font-Underline="True" Text="View Our Arts !" CssClass="Arts"></asp:Label>
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="28pt" Font-Underline="True" Text="View Our Artists !" CssClass="Artists"></asp:Label>
            <br />
            <br />
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataSourceID="SqlDataSource1" ForeColor="Black" Width="615px" CssClass="Arts">
                <Columns>
                    <asp:BoundField DataField="artName" HeaderText="Art Name" SortExpression="artName" />
                    <asp:BoundField DataField="artistName" HeaderText="Artist Name" SortExpression="artistName" />
                    <asp:BoundField DataField="dateOfCreation" HeaderText="Date of Creation" SortExpression="dateOfCreation" DataFormatString="{0:dd-M-yyyy}" />
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
            
            <asp:GridView ID="GridView2" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataSourceID="SqlDataSource2" ForeColor="Black" Width="615px" CssClass="Artists">
                <Columns>
                    <asp:BoundField DataField="artistName" HeaderText="Artist Name" SortExpression="artistName" />
                    <asp:BoundField DataField="dateOfBirth" HeaderText="Date of Birth" SortExpression="dateOfBirth" DataFormatString="{0:dd-M-yyyy}" />
                    <asp:BoundField DataField="dateOfDeath" HeaderText="Date of Death" SortExpression="dateOfDeath" DataFormatString="{0:dd-M-yyyy}" />
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
            
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString %>" SelectCommand="SELECT artistName, dateOfBirth, dateOfDeath FROM museumSchema.artist"></asp:SqlDataSource>
            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString %>" SelectCommand="SELECT artName, artistName, dateOfCreation FROM museumSchema.Art"></asp:SqlDataSource>
            
        </div>
        <!--COPY AND PASTE BODY CONTENT HERE-->
    </form>
</body>
</html>
