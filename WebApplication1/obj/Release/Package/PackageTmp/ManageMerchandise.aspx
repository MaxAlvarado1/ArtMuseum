<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageMerchandise.aspx.cs" Inherits="WebApplication1.ManageMerchandise" %>

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
            <div>
            <br />
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Overline="False" Font-Size="28pt" Font-Underline="True" Text="Manage Merchandise"></asp:Label>
                <br />
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="item_name" DataSourceID="SqlDataSource1" ForeColor="Black" Width="1250px">
                    <Columns>
                        <asp:BoundField DataField="item_name" HeaderText="Item Name" ReadOnly="True" SortExpression="item_name" />
                        <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" />
                        <asp:BoundField DataField="collection_merch" HeaderText="Collection" SortExpression="collection_merch" />
                        <asp:BoundField DataField="exhibition_merch" HeaderText="Exhibition" SortExpression="exhibition_merch" />
                        <asp:BoundField DataField="item_amount" HeaderText="Item Amount" SortExpression="item_amount" />
                        <asp:BoundField DataField="merchSales" HeaderText="Sales" SortExpression="merchSales" />
                        <asp:BoundField DataField="maxStock" HeaderText="Max Stock" SortExpression="maxStock" />
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString %>" SelectCommand="SELECT * FROM museumSchema.Merchandise"></asp:SqlDataSource>
            </div>
            <p>
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="18pt" Text="Add Merchandise"></asp:Label>
            <br />
            <asp:Label ID="Label10" runat="server" Text="* entries required." Font-Size="10pt" ForeColor="#0066FF"></asp:Label>
            </p>
            <asp:Label ID="Label3" runat="server" Text="New Item Name: "></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" Width="188px"></asp:TextBox>
            <asp:Label ID="Label14" runat="server" Font-Size="10pt" ForeColor="#0066FF" Text="*"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" Text="New Item Price: "></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <asp:Label ID="Label15" runat="server" Font-Size="10pt" ForeColor="#0066FF" Text="*"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label6" runat="server" Text="Collection: "></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="true" DataSourceID="SqlDataSource2" DataTextField="collectionName" DataValueField="collectionName">
                <asp:ListItem Selected="True">No</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString %>" SelectCommand="SELECT * FROM museumSchema.Collections"></asp:SqlDataSource>
            <br />
            <br />
            <asp:Label ID="Label7" runat="server" Text="Exhibition: "></asp:Label>
            <asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="true" DataSourceID="SqlDataSource3" DataTextField="exhibit_name" DataValueField="exhibit_name">
                <asp:ListItem Selected="True">No</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString %>" SelectCommand="SELECT * FROM museumSchema.Exhibitions"></asp:SqlDataSource>
            <br />
            <br />
            <asp:Label ID="Label8" runat="server" Text="Item Amount: "></asp:Label>
            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            <asp:Label ID="Label16" runat="server" Font-Size="10pt" ForeColor="#0066FF" Text="*"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label12" runat="server" Text="Merch Sales: "></asp:Label>
            <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label13" runat="server" Text="Max Stock: "></asp:Label>
            <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
            <asp:Label ID="Label17" runat="server" Font-Size="10pt" ForeColor="#0066FF" Text="*"></asp:Label>
            <p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add Merchandise" />
            <br />
            <asp:Label ID="Label11" runat="server" Text="Label" Font-Size="10pt" ForeColor="#3366FF" Visible="False"></asp:Label>
            </p>
            <br />
            <p>
            <asp:Label ID="Label22" runat="server" Font-Bold="True" Font-Size="18pt" Text="Remove Item"></asp:Label>
            <br />
            <asp:Label ID="Label23" runat="server" Text="All entries required." Font-Size="10pt" ForeColor="#0066FF"></asp:Label>
            </p>
            <p>
            <asp:Label ID="Label24" runat="server" Text="Remove Item Name: "></asp:Label>
                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource1" DataTextField="item_name" DataValueField="item_name">
                </asp:DropDownList>
            </p>
            <asp:Button ID="Button2" runat="server" onClientClick = "javascript:return confirm('you sure you wanna do this?');" OnClick="Button2_Click" Text="Remove Item" />
            <br />
            <asp:Label ID="Label21" runat="server" Text="Label" Font-Size="10pt" ForeColor="#3366FF" Visible="False"></asp:Label>
                <br />
            <br />
            <p>
            <asp:Label ID="Label25" runat="server" Font-Bold="True" Font-Size="18pt" Text="Edit Merchandise"></asp:Label>
            <br />
            <asp:Label ID="Label26" runat="server" Text="* entries required." Font-Size="10pt" ForeColor="#0066FF"></asp:Label>
            </p>
            <p>
            <asp:Label ID="Label38" runat="server" Text="Edit Item Name: "></asp:Label>
                <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="SqlDataSource1" DataTextField="item_name" DataValueField="item_name">
                </asp:DropDownList>
            </p>
            <p>
                    -----------------------------------------------</p>
            <asp:Label ID="Label27" runat="server" Text="New Item Name: "></asp:Label>
            <asp:TextBox ID="TextBox10" runat="server" Width="188px"></asp:TextBox>
            <asp:Label ID="Label28" runat="server" Font-Size="10pt" ForeColor="#0066FF" Text="*"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label29" runat="server" Text="New Item Price: "></asp:Label>
            <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
            <asp:Label ID="Label30" runat="server" Font-Size="10pt" ForeColor="#0066FF" Text="*"></asp:Label>
            <br />
            <br />
            New
            <asp:Label ID="Label31" runat="server" Text="Collection: "></asp:Label>
            <asp:DropDownList ID="DropDownList4" runat="server" AppendDataBoundItems="true" DataSourceID="SqlDataSource4" DataTextField="collectionName" DataValueField="collectionName">
                <asp:ListItem Selected="True">No Change</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString %>" SelectCommand="SELECT * FROM museumSchema.Collections"></asp:SqlDataSource>
            <br />
            <br />
            New
            <asp:Label ID="Label32" runat="server" Text="Exhibition: "></asp:Label>
            <asp:DropDownList ID="DropDownList5" runat="server" AppendDataBoundItems="true" DataSourceID="SqlDataSource5" DataTextField="exhibit_name" DataValueField="exhibit_name">
                <asp:ListItem Selected="True">No Change</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString %>" SelectCommand="SELECT * FROM museumSchema.Exhibitions"></asp:SqlDataSource>
            <br />
            <br />
            New
            <asp:Label ID="Label33" runat="server" Text="Item Amount: "></asp:Label>
            <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
            <asp:Label ID="Label34" runat="server" Font-Size="10pt" ForeColor="#0066FF" Text="*"></asp:Label>
            <br />
            <br />
            New
            <asp:Label ID="Label35" runat="server" Text="Merch Sales: "></asp:Label>
            <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox>
            <br />
            <br />
            New
            <asp:Label ID="Label36" runat="server" Text="Max Stock: "></asp:Label>
            <asp:TextBox ID="TextBox14" runat="server"></asp:TextBox>
            <asp:Label ID="Label37" runat="server" Font-Size="10pt" ForeColor="#0066FF" Text="*"></asp:Label>
            <br />
            <br />
            <asp:Button ID="Button3" runat="server" Text="Edit Item" onClientClick = "javascript:return confirm('you sure you wanna do this?');"  OnClick="Button3_Click" />
            <br />
            <asp:Label ID="Label39" runat="server" Font-Size="10pt" ForeColor="#3366FF" Text="Label" Visible="False"></asp:Label>
            <br />
            <br />
            <br />
            <asp:Label ID="Label40" runat="server" Font-Bold="True" Font-Size="18pt" Text="Restock Merchandise: "></asp:Label>
            <asp:Label ID="Label42" runat="server" Text="These items are below 10% of this Max Stock. Please restock above 50%."></asp:Label>
            <br />
            <br />
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="item_name" DataSourceID="SqlDataSource6" ForeColor="Black" Width="1250px">
                <Columns>
                    <asp:BoundField DataField="item_name" HeaderText="Item name" ReadOnly="True" SortExpression="item_name" />
                    <asp:BoundField DataField="item_amount" HeaderText="Item Amount" SortExpression="item_amount" />
                    <asp:BoundField DataField="maxStock" HeaderText="Max Stock" SortExpression="maxStock" />
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
            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString %>" SelectCommand="SELECT * FROM museumSchema.restocking"></asp:SqlDataSource>
            <br />
            <asp:Label ID="Label41" runat="server" Text="Restock Merchandise Item: "></asp:Label>
            <asp:DropDownList ID="DropDownList7" runat="server" DataSourceID="SqlDataSource6" DataTextField="item_name" DataValueField="item_name">
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="Add Stock: "></asp:Label>
            <asp:TextBox ID="TextBox15" runat="server" TextMode="Number"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button4" runat="server" Text="Update Stock" OnClick="Button4_Click" />
            <br />
            <br />
            <br />
        </div>
        <!--COPY AND PASTE BODY CONTENT HERE-->
    </form>
</body>
</html>

