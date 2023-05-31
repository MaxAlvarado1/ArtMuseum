<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageCollections.aspx.cs" Inherits="WebApplication1.ManageCollections" %>

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
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="28pt" Font-Underline="True" Text="Manage Collections"></asp:Label>
            <br />
            <br />
            <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="collectionName" DataSourceID="SqlDataSource2" ForeColor="Black" Width="1250px">
                <Columns>
                    <asp:BoundField DataField="collectionName" HeaderText="Collection Name" ReadOnly="True" SortExpression="collectionName" />
                    <asp:BoundField DataField="collectionAuthor" HeaderText="Collection Author" SortExpression="collectionAuthor" />
                    <asp:BoundField DataField="location_Num" HeaderText="Location Number" SortExpression="location_Num" />
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
            <p>
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="18pt" Text="Add Collection:"></asp:Label>
            </p>
            <asp:Label ID="Label3" runat="server" Text="New Collection Name: "></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="New Collection Author: "></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" Text="New Collection Location: "></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="locName" DataValueField="locNum">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString %>" SelectCommand="SELECT locName, locNum FROM museumSchema.Location WHERE locNum = 5 OR locNum = 6 OR locNum = 8"></asp:SqlDataSource>
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add Collection" />
            <br />
            <asp:Label ID="Label12" runat="server" Font-Size="8pt" ForeColor="Blue" Visible="False"></asp:Label>
            <br />
            <br />
            <p>
                <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="18pt" Text="Delete Collection:"></asp:Label>
            </p>
            <asp:Label ID="Label7" runat="server" Text="Delete Collection Name: "></asp:Label>
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="collectionName" DataValueField="collectionName">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString %>" SelectCommand="SELECT * FROM museumSchema.Collections"></asp:SqlDataSource>
            <br />
            <asp:Button ID="Button2" runat="server" onClientClick = "javascript:return confirm('you sure you wanna do this?');" OnClick="Button2_Click" Text="Delete Collection" />
            <br />
            <asp:Label ID="Label15" runat="server" Font-Size="8pt" ForeColor="Blue" Visible="False"></asp:Label>
            <br />
            <br />
            <p>
                <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="18pt" Text="Search Collection:"></asp:Label>
            </p>
            <p>
                <asp:Label ID="Label17" runat="server" Font-Size="9pt" ForeColor="Blue" Text="One or more entries required"></asp:Label>
            </p>
            <asp:Label ID="Label9" runat="server" Text="Collection Name: "></asp:Label>
            <asp:DropDownList ID="DropDownList4" AppendDataBoundItems="True" runat="server" DataSourceID="SqlDataSource2" DataTextField="collectionName" DataValueField="collectionName">
                <asp:ListItem Selected="True">All</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="Label10" runat="server" Text="Collection Author: "></asp:Label>
            <asp:DropDownList ID="DropDownList5" AppendDataBoundItems="True" runat="server" DataSourceID="SqlDataSource2" DataTextField="collectionAuthor" DataValueField="collectionAuthor">
                <asp:ListItem>All</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="Label11" runat="server" Text="Collection Location: "></asp:Label>
            <asp:DropDownList ID="DropDownList3" AppendDataBoundItems="True" runat="server" DataSourceID="SqlDataSource1" DataTextField="locName" DataValueField="locNum">
                <asp:ListItem Selected="True">All</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Search Collection" />
            <br />
            <asp:Label ID="Label16" runat="server" Font-Size="8pt" ForeColor="Blue" Visible="False"></asp:Label>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="Black" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2">
                <Columns>
                    <asp:BoundField DataField="collectionName" HeaderText="Collection Name" ReadOnly="True" />
                    <asp:BoundField DataField="collectionAuthor" HeaderText="Collection Author" ReadOnly="True" />
                    <asp:BoundField DataField="location_Num" HeaderText="Collection Location" ReadOnly="True" />
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
            <br />
            <p>
                <asp:Label ID="Label18" runat="server" Font-Bold="True" Font-Size="18pt" Text="Modify Collection:"></asp:Label>
            </p>
            <p>
                <asp:Label ID="Label19" runat="server" Font-Size="9pt" ForeColor="Blue" Text="One or more entries required"></asp:Label>
            </p>
            <asp:Label ID="Label20" runat="server" Text="Collection Name: "></asp:Label>
            <asp:DropDownList ID="DropDownList7" AppendDataBoundItems="True" runat="server" DataSourceID="SqlDataSource2" DataTextField="collectionName" DataValueField="collectionName">
            </asp:DropDownList>
            <br />
                    -----------------------------------------------<br />
            <asp:Label ID="Label24" runat="server" Text="New Collection Name: "></asp:Label>
            <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;<br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <asp:Label ID="Label25" runat="server" Text="New Collection Author: "></asp:Label>
            <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;<br />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <asp:Label ID="Label26" runat="server" Text="New Collection Location: "></asp:Label>
            <asp:DropDownList ID="DropDownList6" AppendDataBoundItems="True" runat="server" DataSourceID="SqlDataSource1" DataTextField="locName" DataValueField="locNum">
                <asp:ListItem Selected="True">No Change</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Button ID="Button4" runat="server" onClientClick = "javascript:return confirm('you sure you wanna do this?');" OnClick="Button4_Click" Text="Modify Collection" />
            <br />
            <asp:Label ID="Label23" runat="server" Font-Size="8pt" ForeColor="Blue" Visible="False"></asp:Label>
            <br />
            <br />
            <br />
        </div>
        <!--COPY AND PASTE BODY CONTENT HERE-->
    </form>
</body>
</html>

