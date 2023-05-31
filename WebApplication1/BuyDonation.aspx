<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BuyDonation.aspx.cs" Inherits="WebApplication1.BuyDonation" %>

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
            <asp:Label ID="Label1" runat="server" Font-Size="28pt" Text="Make A Donation" Font-Bold="True" Font-Underline="True"></asp:Label>
            <br />
            <br />

            <asp:Label ID="Label3" runat="server" Height="40px" Text="Choose Donation:  "></asp:Label>

            <asp:Button ID="ButtonDonate100" runat="server" BorderStyle="Double" Height="55px" OnClick="ButtonDonate100_Click" Text="$100" Width="105px" />
&nbsp;&nbsp;
            <asp:Button ID="ButtonDonate50" runat="server" BorderStyle="Double" Height="55px" OnClick="ButtonDonate50_Click" Text="$50" Width="105px" />
&nbsp;&nbsp;
            <asp:Button ID="ButtonDonate20" runat="server" BorderStyle="Double" Height="55px" OnClick="ButtonDonate20_Click" Text="$20" Width="105px" />
&nbsp;&nbsp;
            <asp:Button ID="ButtonDonate10" runat="server" BorderStyle="Double" Height="55px" OnClick="ButtonDonate10_Click" Text="$10" Width="105px" />
&nbsp;&nbsp;
            <asp:Button ID="ButtonDonate5" runat="server" BorderStyle="Double" Height="55px" OnClick="ButtonDonate5_Click" Text="$5" Width="105px" />

            <br />
            <br />
            Selected Amount: <asp:Label ID="LabelDonationAmount" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ForeColor="Black" Text="Select Options" Width="179px"></asp:Label>
            <br />
            <br />
            <asp:Label ID="LabelFname" runat="server" Text="First Name:"></asp:Label>
            <asp:TextBox ID="InputFname" runat="server" BackColor="White" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="LabelLname" runat="server" Text="Last Name:"></asp:Label>
            <asp:TextBox ID="InputLname" runat="server" BackColor="White" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>       
            <br />
            &nbsp;<br />
            <asp:Button ID="ButtonDonateSubmit" runat="server" OnClick="ButtonDonateSubmit_Click" Text="Donate" />
            <br />
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="28pt" Text="THANK YOU FOR YOUR DONATIONS"></asp:Label>
            <br />
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="donorName" DataSourceID="SqlDataSource1" ForeColor="Black" Width="1250px">
                <Columns>
                    <asp:BoundField DataField="donorName" HeaderText="Name" ReadOnly="True" SortExpression="donorName" />
                    <asp:BoundField DataField="donatDate" DataFormatString="{0:dd-M-yyyy}" HeaderText="Donation Date" SortExpression="donatDate" />
                    <asp:BoundField DataField="donatAmnt" DataFormatString="${0:#,0}" HeaderText="Donation Amount" SortExpression="donatAmnt" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString %>" SelectCommand="SELECT * FROM museumSchema.FundDonations"></asp:SqlDataSource>
        </div>
        <!--COPY AND PASTE BODY CONTENT HERE-->
    </form>
</body>
</html>
