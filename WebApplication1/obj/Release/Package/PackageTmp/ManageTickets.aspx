<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageTickets.aspx.cs" Inherits="WebApplication1.ManageTickets" %>

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
            <div>
                <br />
                <asp:Label ID="Title" runat="server" Font-Size="28pt" Text="Manage Tickets" Font-Bold="True" Font-Underline="True"></asp:Label>
                <br />
                <br />
                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="ticket_Type" DataSourceID="SqlDataSource1" ForeColor="Black" Width="500px">
                    <Columns>
                        <asp:BoundField DataField="ticket_Type" HeaderText="Ticket Type" ReadOnly="True" SortExpression="ticket_Type" />
                        <asp:BoundField DataField="price" DataFormatString="${0:#,0}" HeaderText="Price" SortExpression="price" />
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString %>" SelectCommand="SELECT * from museumSchema.tickets"></asp:SqlDataSource>
                <br />
                <br />
                <asp:Label ID="Label1" runat="server" Font-Size="18pt" Font-Underline="True" Text="Inserting Ticket Type" Font-Bold="True"></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label7" runat="server" Text="Name of Ticket Type: "></asp:Label>
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label6" runat="server" Text="Price: "></asp:Label>
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Create" />
                <br />
            <asp:Label ID="Insertion_Success" runat="server" Font-Size="8pt" ForeColor="Blue" Visible="False"></asp:Label>
                <br />
                <br />
                <br />
                <asp:Label ID="Label2" runat="server" Font-Size="18pt" Font-Underline="True" Text="Update Ticket Type" Font-Bold="True"></asp:Label>
                <br />
                <asp:Label ID="Update_Ticket_Label" runat="server" Font-Size="9pt" ForeColor="Blue" Text="One or more entries required"></asp:Label>
                <br />
                <asp:Label ID="Label17" runat="server" Text="Old Name of Ticket Type: "></asp:Label>
                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1" DataTextField="ticket_Type" DataValueField="ticket_Type">
                </asp:DropDownList>
                <br />
                    -----------------------------------------------<br />
                <asp:Label ID="Label14" runat="server" Text="New Price: "></asp:Label>
                <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label15" runat="server" Text="New Name of Ticket Type: "></asp:Label>
                <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="Button2" runat="server" onClientClick = "javascript:return confirm('you sure you wanna do this?');" OnClick="Button2_Click" Text="Update" />
                <br />
            <asp:Label ID="Update_Success" runat="server" Font-Size="8pt" ForeColor="Blue" Visible="False"></asp:Label>
                <br />
                <br />
                <br />
                <asp:Label ID="Label3" runat="server" Font-Size="18pt" Font-Underline="True" Text="Delete Ticket Type" Font-Bold="True"></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label16" runat="server" Text="Ticket Type: "></asp:Label>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="ticket_Type" DataValueField="ticket_Type">
                </asp:DropDownList>
                <br />
                <br />
                <asp:Button ID="Button3" runat="server" onClientClick = "javascript:return confirm('you sure you wanna do this?');" OnClick="Button3_Click" Text="Delete" />
                <br />
            <asp:Label ID="Deletion_Success" runat="server" Font-Size="8pt" ForeColor="Blue" Visible="False"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                <br />
                <br />
            </div>
        </div>
        <!--COPY AND PASTE BODY CONTENT HERE-->
    </form>
</body>
</html>

