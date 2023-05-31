<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BuyTicket.aspx.cs" Inherits="WebApplication1.BuyTicket" %>

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

        <div class="BodyContent">
            <br />
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="28pt" Font-Underline="True" Text="Buy a Ticket!"></asp:Label>
            <br />
            <asp:Label ID="Label8" runat="server" Text="Thank you for being a member. Ticket is on us. " Font-Size="14pt" ForeColor="Blue" Visible="False"></asp:Label>
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ticket_Type" DataSourceID="SqlDataSourceTicketView" HorizontalAlign="Center" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Width="200px">
                <Columns>
                    <asp:BoundField DataField="ticket_Type" HeaderText="Ticket Type" SortExpression="ticket_Type" ReadOnly="True" />
                    <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" DataFormatString="${0:#,0}" />
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
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="ticket_Type" DataSourceID="SqlDataSource1" HorizontalAlign="Center" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Width="200px" Visible="False">
                <Columns>
                    <asp:BoundField DataField="ticket_Type" HeaderText="Ticket Type" ReadOnly="True" SortExpression="ticket_Type" />
                    <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" DataFormatString="${0:#,0}" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString %>" SelectCommand="SELECT * FROM museumSchema.Tickets WHERE ticket_Type = 'Member'"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceTicketView" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString %>" SelectCommand="SELECT * FROM museumSchema.Tickets WHERE ticket_Type != 'Member'"></asp:SqlDataSource>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Your Name: "></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Ticket Type: "></asp:Label>
            <asp:DropDownList ID="TicketTypeDrop" runat="server" DataSourceID="SqlDataSourceTicketType" DataTextField="ticket_Type" DataValueField="ticket_Type">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString %>" SelectCommand="SELECT ticket_Type FROM museumSchema.Tickets WHERE ticket_Type = 'Member'"></asp:SqlDataSource>
            <br />
            <asp:SqlDataSource ID="SqlDataSourceTicketType" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString %>" SelectCommand="SELECT ticket_Type FROM museumSchema.Tickets WHERE ticket_Type != 'Member'"></asp:SqlDataSource>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Amount: "></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem Selected="True">1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
                <asp:ListItem>6</asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>8</asp:ListItem>
                <asp:ListItem>9</asp:ListItem>
                <asp:ListItem>10</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" Text="Exhibition Access (+ $5)"></asp:Label>
            <asp:DropDownList ID="ExhibitDrop" AppendDataBoundItems="true" runat="server" DataSourceID="SqlDataSourceExhibitionList" DataTextField="exhibit_name" DataValueField="exhibit_name">
                <asp:ListItem Selected="True">None</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:SqlDataSource ID="SqlDataSourceExhibitionList" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString %>" SelectCommand="SELECT exhibit_name FROM museumSchema.Exhibitions"></asp:SqlDataSource>
            <br />
            <asp:Label ID="Label6" runat="server" Text="Collection Access (+ $1)"></asp:Label>
            <asp:DropDownList ID="CollectionDrop" AppendDataBoundItems="true" runat="server" DataSourceID="SqlDataSourceCollectionView" DataTextField="collectionName" DataValueField="collectionName">
                <asp:ListItem Selected="True">None</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:SqlDataSource ID="SqlDataSourceCollectionView" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString %>" SelectCommand="SELECT collectionName FROM museumSchema.Collections"></asp:SqlDataSource>
            <br />
            <asp:Label ID="Label7" runat="server" Text="Date of Purchase: "></asp:Label>
            <asp:TextBox ID="purchaseDate" runat="server" TextMode="Date"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Confirm Purchase" />
        </div>
        <!--COPY AND PASTE BODY CONTENT HERE-->
    </form>
</body>
</html>
