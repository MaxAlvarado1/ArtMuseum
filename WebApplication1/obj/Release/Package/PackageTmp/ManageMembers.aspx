<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageMembers.aspx.cs" Inherits="WebApplication1.ManageMembers" %>

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
            <asp:Label ID="LabelEmployees" runat="server" Text="Manage Members:" Font-Bold="True" Font-Size="28pt" Font-Underline="True"></asp:Label>
            <br />
            <br />
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="membership_ID" DataSourceID="SqlDataSource1" ForeColor="Black" Width="1250px">
                <Columns>
                    <asp:BoundField DataField="memberName" HeaderText="Member Name" SortExpression="memberName" />
                    <asp:BoundField DataField="membership_ID" HeaderText="Membership ID" ReadOnly="True" SortExpression="membership_ID" />
                    <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" />
                    <asp:BoundField DataField="membership_start" HeaderText="Membership Start" SortExpression="membership_start" />
                    <asp:BoundField DataField="expiration_date" HeaderText="Expiration Date" SortExpression="expiration_date" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString %>" SelectCommand="SELECT * FROM museumSchema.Members"></asp:SqlDataSource>
            <br />
            <br />
            <asp:Label ID="LabelAddMember" runat="server" Font-Bold="True" Font-Size="18pt" Text="Add Member:"></asp:Label>
            <br />
            <asp:Label ID="LabelNewMemberName" runat="server" Font-Size="Small" Text="New Member First Name: "></asp:Label>
            <asp:TextBox ID="InputMemberFname" runat="server" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="LabelMemberLname" runat="server" Text="New Member Last name: " Font-Size="Small"></asp:Label>
            <asp:TextBox ID="InputMemberLname" runat="server" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="LabelNewMemberType" runat="server" Text="New Membership Type:" Font-Size="Small"></asp:Label>
            <asp:DropDownList ID="InputMemberType" runat="server" Font-Overline="False" Font-Size="Small" Height="40px" style="margin-top: 0px">
                <asp:ListItem Value="40">Student</asp:ListItem>
                <asp:ListItem Value="70">Individual</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add Member" />
            <br />
            <asp:Label ID="LabelNewMemberMessage" runat="server" Font-Size="X-Small" ForeColor="#FF5050" Text="Invisible message" Visible="False"></asp:Label>
            <asp:Label ID="LabelNewMemberID" runat="server" Font-Size="X-Small" ForeColor="Blue" Text="Invisible new ID" Visible="False"></asp:Label>
            <br />
            <br />
            <br />
            <br />
            <asp:Label ID="LabelDeleteMember" runat="server" Font-Bold="True" Font-Size="18pt" Text="Remove Member:"></asp:Label>
            <br />
            <asp:Label ID="LabelDeleteMemberID" runat="server" Font-Size="Small" Text="Delete Member: "></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="memberName" DataValueField="membership_ID">
            </asp:DropDownList>
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" onClientClick = "javascript:return confirm('you sure you wanna do this?');" OnClick="Button2_Click" Text="Remove Member" />
            <br />
            <asp:Label ID="LabelRemoveMemberMessage" runat="server" Font-Size="X-Small" ForeColor="#FF5050" Text="Invisible message" Visible="False"></asp:Label>
            <br />
            <br />
            <br />
            <br />
            <asp:Label ID="LabelSearchMembers" runat="server" Font-Bold="True" Font-Size="18pt" Text="Search Member(s):"></asp:Label>
            <br />
            <asp:Label ID="LabelSearchMembersReq" runat="server" Font-Size="X-Small" ForeColor="#FF5050" Text="One or more entries required. No entries will give all members."></asp:Label>
            <br />
            <asp:Label ID="LabelSearchMemberFName" runat="server" Font-Size="Small" Text="Member Name: "></asp:Label>
            <asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="true" DataSourceID="SqlDataSource1" DataTextField="memberName" DataValueField="memberName">
                <asp:ListItem Selected="True">All</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="LabelSearchMemberID" runat="server" Font-Size="Small" Text="Member ID:"></asp:Label>
            <asp:DropDownList ID="DropDownList3" runat="server" AppendDataBoundItems="true" DataSourceID="SqlDataSource1" DataTextField="membership_ID" DataValueField="membership_ID">
                <asp:ListItem Selected="True">All</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="LabelSearchMembershipType" runat="server" Font-Size="Small" Text="Membership Type:"></asp:Label>
            <asp:DropDownList ID="SearchMemberType" runat="server" Font-Overline="False" Font-Size="Small" Height="40px" style="margin-top: 0px">
                <asp:ListItem Selected="True" Value="All">All</asp:ListItem>
                <asp:ListItem Value="40">Student</asp:ListItem>
                <asp:ListItem Value="70">Individual</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="LabelSearchMembershipStart" runat="server" Font-Size="Small" Text="Member Start Date:"></asp:Label>
            <asp:TextBox ID="SearchMemberStart1" runat="server" BorderStyle="Solid" BorderWidth="1px" TextMode="Date"></asp:TextBox>
            -
            <asp:TextBox ID="SearchMemberStart2" runat="server" BorderStyle="Solid" BorderWidth="1px" TextMode="Date"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="LabelSearchMembershipEnd" runat="server" Font-Size="Small" Text="Member Expiration Date:"></asp:Label>
            <asp:TextBox ID="SearchMemberEnd1" runat="server" BorderStyle="Solid" BorderWidth="1px" TextMode="Date"></asp:TextBox>
            &nbsp;-
            <asp:TextBox ID="SearchMemberEnd2" runat="server" BorderStyle="Solid" BorderWidth="1px" TextMode="Date"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button3" runat="server" Text="Search Member" OnClick="Button3_Click" />
            <br />
            <asp:Label ID="LabelMemberSearchMessage" runat="server" Font-Size="X-Small" ForeColor="#FF5050" Text="Invisible message" Visible="False"></asp:Label>
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" Font-Size="Small" ForeColor="Black" GridLines="Vertical" HorizontalAlign="Center">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:BoundField DataField="memberName" HeaderText="Member Name" />
                    <asp:BoundField DataField="membership_ID" HeaderText="Member ID" />
                    <asp:BoundField DataField="price" HeaderText="Price" />
                    <asp:BoundField DataField="membership_start" HeaderText="Membership Start" />
                    <asp:BoundField DataField="expiration_date" HeaderText="Membership Expiration" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
            <br />
            <br />
            <br />
            <asp:Label ID="LabelUpdateMembers" runat="server" Font-Bold="True" Font-Size="18pt" Text="Update Member:"></asp:Label>
            <br />
            <asp:Label ID="LabelUpdateMembersReq" runat="server" Font-Size="X-Small" ForeColor="#FF5050" Text="One of more entries required for both sides."></asp:Label>
            <br />
            <asp:Label ID="LabelOldMemberID0" runat="server" Font-Size="Small" Text="Member Name: "></asp:Label>
            <asp:DropDownList ID="DropDownList4" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource1" DataTextField="memberName" DataValueField="membership_ID">
            </asp:DropDownList>
            <br />
                -----------------------------------------------<br />
            <asp:Label ID="LabelUpdateMemberFname" runat="server" Font-Size="Small" Text="New Member First Name: "></asp:Label>
            <asp:TextBox ID="InputUpdateFname" runat="server" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="LabelUpdateMemberLname" runat="server" Font-Size="Small" Text="New Member Last Name:"></asp:Label>
            <asp:TextBox ID="InputUpdateLname" runat="server" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="LabelUpdateMemberID" runat="server" Font-Size="Small" Text="New Member ID: "></asp:Label>
            <asp:TextBox ID="InputUpdateMemberID" runat="server" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="LabelUpdateMemberType" runat="server" Font-Size="Small" Text="New Membership Type:"></asp:Label>
            <asp:DropDownList ID="InputUpdateMemberType" runat="server" Font-Overline="False" Font-Size="Small" Height="40px" style="margin-top: 0px">
                <asp:ListItem Value="40">Student</asp:ListItem>
                <asp:ListItem Value="70">Individual</asp:ListItem>
                <asp:ListItem>No Change</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="LabelUpdateStartDate" runat="server" Font-Size="Small" Text="New Membership Start Date:"></asp:Label>
            <asp:TextBox ID="InputNewStart" runat="server" TextMode="Date" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="LabelUpdateExpiration" runat="server" Font-Size="Small" Text="New Membership Expiration Date:"></asp:Label>
            <asp:TextBox ID="InputUpdateExpiration" runat="server" TextMode="Date" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button4" runat="server" onClientClick = "javascript:return confirm('you sure you wanna do this?');" Text="Update Member" OnClick="Button4_Click" />
            <br />
            <asp:Label ID="LabelUpdateMemberMessage" runat="server" Font-Size="X-Small" ForeColor="#FF5050" Text="Invisible message" Visible="False"></asp:Label>
            <br />
            <br />
        </div>
        <!--COPY AND PASTE BODY CONTENT HERE-->
    </form>
</body>
</html>

