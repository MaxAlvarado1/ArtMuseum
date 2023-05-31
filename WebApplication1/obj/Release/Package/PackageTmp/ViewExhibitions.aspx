<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewExhibitions.aspx.cs" Inherits="WebApplication1.ViewExhibitions" %>

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
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="28pt" Font-Underline="True" Text="View Our Current Exhibitions !"></asp:Label>
            <br />
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataSourceID="SqlDataSource1" ForeColor="Black" Width="1250px" DataKeyNames="exhibit_name">
                <Columns>
                    <asp:BoundField DataField="exhibit_name" HeaderText="Exhibition Name" SortExpression="exhibit_name" ReadOnly="True" />
                    <asp:BoundField DataField="artist_name" HeaderText="Artist Name" SortExpression="artist_name" />
                    <asp:BoundField DataField="end_dates" DataFormatString="{0:M-dd-yyyy}" HeaderText="End Date" SortExpression="end_dates" />
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
            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString %>" SelectCommand="SELECT exhibit_name, artist_name, end_dates FROM museumSchema.Exhibitions WHERE (SELECT GETDATE()) &lt;= end_dates AND (SELECT GETDATE()) &gt;= start_dates"></asp:SqlDataSource>
            
        </div>
        <!--COPY AND PASTE BODY CONTENT HERE-->
    </form>
</body>
</html>