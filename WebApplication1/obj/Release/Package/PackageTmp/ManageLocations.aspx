<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageLocations.aspx.cs" Inherits="WebApplication1.ManageLocations" %>

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
            <asp:Label ID="Label1" runat="server" Text="Manage Location" Font-Overline="False" Font-Size="28pt" Font-Bold="True" Font-Underline="True"></asp:Label></div>
        <p>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="locNum" DataSourceID="SqlDataSource1" ForeColor="Black" Width="1250px">
                <Columns>
                    <asp:BoundField DataField="locName" HeaderText="Location Name" SortExpression="locName" />
                    <asp:BoundField DataField="locNum" HeaderText="Location Number" ReadOnly="True" SortExpression="locNum" />
                    <asp:BoundField DataField="mgrSSN" HeaderText="Manager SSN" SortExpression="mgrSSN" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString %>" SelectCommand="SELECT * FROM museumSchema.Location"></asp:SqlDataSource>
        </p>
            <p>
            <asp:Label ID="Label6" runat="server" Font-Size="20pt" Font-Underline="False" Text="Add New Location: " Font-Bold="True"></asp:Label>
        </p>
        <p>
            <asp:Label ID="Label2" runat="server" Text="Location Name: "></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </p>
            <p>
            <asp:Label ID="Label5" runat="server" Text="Location Number: "></asp:Label>
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        </p>
            <p>
            <asp:Label ID="Label11" runat="server" Text="Manager Name: "></asp:Label>
                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="SSN">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString %>" SelectCommand="SELECT * FROM museumSchema.Employees "></asp:SqlDataSource>
        </p>
        <p>
        <asp:Label ID="Insertion_Success" runat="server" Font-Size="8pt" ForeColor="Blue" Visible="False"></asp:Label>
        </p>
            <p>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add Location" />
        </p>
            <p>
                &nbsp;</p>
            <p>
                &nbsp;</p>
        <p>
            <asp:Label ID="Label14" runat="server" Font-Size="20pt" Font-Underline="False" Text="Delete Location: " Font-Bold="True"></asp:Label>
        </p>
        <p>
            <asp:Label ID="Label22" runat="server" Text="Location Name: "></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="locName" DataValueField="locNum">
            </asp:DropDownList>
        </p>
        <p>
        <asp:Label ID="Deletion_Success" runat="server" Font-Size="8pt" ForeColor="Blue" Visible="False"></asp:Label>
        </p>
            <p>
                <asp:Button ID="Button2" runat="server" onClientClick = "javascript:return confirm('you sure you wanna do this?');" OnClick="Button2_Click" Text="Delete Location" />
        </p>
            <p>
                &nbsp;</p>
            <p>
                &nbsp;</p>
        <p>
            <asp:Label ID="Label15" runat="server" Font-Size="20pt" Font-Underline="False" Text="Modify Location: " Font-Bold="True"></asp:Label>
        </p>
        <p>
            <asp:Label ID="Label23" runat="server" Text="Location Name: "></asp:Label>
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1" DataTextField="locName" DataValueField="locNum">
            </asp:DropDownList>
            </p>
            <p>
                -----------------------------------------------</p>
            <p>
            <asp:Label ID="Modify_Conditions" runat="server" Font-Size="9pt" ForeColor="Blue" Text="One or more entries required"></asp:Label>
            </p>
            <p>
            <asp:Label ID="Label31" runat="server" Text="New Location Name: "></asp:Label>
            <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
            </p>
            <p>
            <asp:Label ID="Label34" runat="server" Text="New Location Number: "></asp:Label>
            <asp:TextBox ID="TextBox18" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label37" runat="server" Text="New Manager Name: "></asp:Label>
            <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="SSN">
            </asp:DropDownList>
        </p>
        <p>
        <asp:Label ID="Modify_Success" runat="server" Font-Size="8pt" ForeColor="Blue" Visible="False"></asp:Label>
        </p>
            <p>
                <asp:Button ID="Button3" runat="server" onClientClick = "javascript:return confirm('you sure you wanna do this?');" OnClick="Button3_Click" Text="Modify Location" />
        </p>
        </div>
        <!--COPY AND PASTE BODY CONTENT HERE-->
    </form>
</body>
</html>

