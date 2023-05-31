<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageArtsArtists.aspx.cs" Inherits="WebApplication1.ManageArtsArtists" %>

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
            <div class="Arts">
            <br />
                <div>
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Overline="False" Font-Size="28pt" Font-Underline="True" Text="Manage Art"></asp:Label>
                    <br />
                    <br />
                    <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="ID_no" DataSourceID="SqlDataSource5" ForeColor="Black" Width="615px" Font-Size="9pt">
                        <Columns>
                            <asp:BoundField DataField="artName" HeaderText="Art Name" SortExpression="artName" />
                            <asp:BoundField DataField="ID_no" HeaderText="ID" ReadOnly="True" SortExpression="ID_no" />
                            <asp:BoundField DataField="dateOfCreation" HeaderText="Date of Creation" SortExpression="dateOfCreation" />
                            <asp:BoundField DataField="artistName" HeaderText="Artist Name" SortExpression="artistName" />
                            <asp:BoundField DataField="exhibition" HeaderText="Exhibition" SortExpression="exhibition" />
                            <asp:BoundField DataField="collection" HeaderText="Collection" SortExpression="collection" />
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
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString %>" SelectCommand="SELECT * FROM museumSchema.Art"></asp:SqlDataSource>
        </div>
        <p>
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="18pt" Text="Add Art:"></asp:Label>
            <br />
            <asp:Label ID="Label10" runat="server" Text="All entries required, except Exhbition and Collection." Font-Size="10pt" ForeColor="#0066FF"></asp:Label>
        </p>
        <p>
            <asp:Label ID="Label3" runat="server" Text="New Art Name: "></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><p></p>
            <asp:Label ID="Label5" runat="server" Text="New Art Date of Creation: "></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server" TextMode="Date"></asp:TextBox>
            <br /><p></p>
            <asp:Label ID="Label6" runat="server" Text="New Art's Artist Name: "></asp:Label>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="artistName" DataValueField="artistName">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString %>" SelectCommand="SELECT artistName, ID FROM museumSchema.Artist"></asp:SqlDataSource>
            <br /><p></p>
            <asp:Label ID="Label8" runat="server" Text="New Art Exhibition: "></asp:Label>
                <asp:DropDownList ID="DropDownList2" AppendDataBoundItems="true" runat="server" DataSourceID="SqlDataSource2" DataTextField="exhibit_name" DataValueField="exhibit_name">
                    <asp:ListItem Selected="True">None</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString %>" SelectCommand="SELECT exhibit_name FROM museumSchema.Exhibitions"></asp:SqlDataSource>
            <br /><p></p>
            <asp:Label ID="Label9" runat="server" Text="New Art Collection: "></asp:Label>
                <asp:DropDownList ID="DropDownList3" AppendDataBoundItems="true" runat="server" DataSourceID="SqlDataSource3" DataTextField="collectionName" DataValueField="collectionName">
                    <asp:ListItem Selected="True">None</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString %>" SelectCommand="SELECT collectionName FROM museumSchema.Collections "></asp:SqlDataSource>
        </p>
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add Art" />
            <br />
            <asp:Label ID="Label11" runat="server" Text="Label" Font-Size="10pt" ForeColor="#3366FF" Visible="False"></asp:Label>
            <asp:Label ID="Label12" runat="server" Font-Size="10pt" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
        </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Label ID="Label13" runat="server" Font-Bold="True" Font-Size="18pt" Text="Remove Art:"></asp:Label>
            <br />
            <asp:Label ID="Label14" runat="server" Text="Entry required." Font-Size="10pt" ForeColor="#0066FF"></asp:Label>
        </p>
        <p>
            <asp:Label ID="Label15" runat="server" Text="Remove Art ID: "></asp:Label>
            <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="Button2" runat="server" onClientClick = "javascript:return confirm('you sure you wanna do this?');" OnClick="Button2_Click" Text="Remove Art" />
            <br />
            <asp:Label ID="Label21" runat="server" Text="Label" Font-Size="10pt" ForeColor="#3366FF" Visible="False"></asp:Label>
        </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Label ID="Label22" runat="server" Font-Bold="True" Font-Size="18pt" Text="Search Art:"></asp:Label>
            <br />
            <asp:Label ID="Label23" runat="server" Text="One or more entries required. No entries search all." Font-Size="10pt" ForeColor="#0066FF"></asp:Label>
        </p>
        <p>
            <asp:Label ID="Label24" runat="server" Text="Art Name: "></asp:Label>
            <asp:DropDownList ID="DropDownList7" AppendDataBoundItems="true" runat="server" DataSourceID="SqlDataSource4" DataTextField="artName" DataValueField="artName">
                <asp:ListItem Selected="True">All</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString %>" SelectCommand="SELECT artName FROM museumSchema.Art "></asp:SqlDataSource>
            <br /><p></p>
            <asp:Label ID="Label31" runat="server" Text="Art ID: "></asp:Label>
            <asp:TextBox ID="TextBox16" runat="server"></asp:TextBox>
            <br /><p></p>
            <asp:Label ID="Label25" runat="server" Text="Date of Creation: "></asp:Label>
            <asp:TextBox ID="TextBox10" runat="server" TextMode="Date"></asp:TextBox>
            &nbsp;-
            <asp:TextBox ID="TextBox15" runat="server" TextMode="Date"></asp:TextBox>
            <br /><p></p>
            <asp:Label ID="Label26" runat="server" Text="Artist Name: "></asp:Label>
                <asp:DropDownList ID="DropDownList4" AppendDataBoundItems="true" runat="server" DataSourceID="SqlDataSource1" DataTextField="artistName" DataValueField="artistName">
                    <asp:ListItem Selected="True">All</asp:ListItem>
                </asp:DropDownList>
            <br /><p></p>
            <asp:Label ID="Label28" runat="server" Text="Exhibition: "></asp:Label>
                <asp:DropDownList ID="DropDownList5" AppendDataBoundItems="true" runat="server" DataSourceID="SqlDataSource2" DataTextField="exhibit_name" DataValueField="exhibit_name">
                    <asp:ListItem Selected="True">All</asp:ListItem>
                </asp:DropDownList>
            <br /><p></p>
            <asp:Label ID="Label29" runat="server" Text="Collection: "></asp:Label>
                <asp:DropDownList ID="DropDownList6" AppendDataBoundItems="true" runat="server" DataSourceID="SqlDataSource3" DataTextField="collectionName" DataValueField="collectionName">
                    <asp:ListItem Selected="True">All</asp:ListItem>
                </asp:DropDownList>
                </p>
        <p>
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Search Art" />
            <br />
            <asp:Label ID="Label30" runat="server" Text="Label" Font-Size="10pt" ForeColor="#3366FF" Visible="False"></asp:Label>
            <asp:GridView ID="GridView1" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" ForeColor="Black" AutoGenerateColumns="False" Font-Size="9pt" Width="615px" CellSpacing="2">
                <Columns>
                    <asp:BoundField DataField="artName" HeaderText="Art Name" />
                    <asp:BoundField DataField="dateOfCreation" HeaderText="Date of Creation" />
                    <asp:BoundField DataField="artistName" HeaderText="Artist Name" />
                    <asp:BoundField DataField="exhibition" HeaderText="Exhibition" />
                    <asp:BoundField DataField="collection" HeaderText="Collection" />
                    <asp:BoundField DataField="ID_no" HeaderText="ID Number" />
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
        </p>
        <p>
            &nbsp;</p>
                <p>
            <asp:Label ID="Label32" runat="server" Font-Bold="True" Font-Size="18pt" Text="Modify Art:"></asp:Label>
            <br />
            <asp:Label ID="Label33" runat="server" Text="One or more entries required." Font-Size="10pt" ForeColor="#0066FF"></asp:Label>
        </p>
        <p>
            <asp:Label ID="Label34" runat="server" Text="Art ID:"></asp:Label>
            <asp:TextBox ID="TextBox17" runat="server"></asp:TextBox>
            </p>
                <p>
                    -----------------------------------------------</p>
                <p>
            <asp:Label ID="Label42" runat="server" Text="New Art Name: "></asp:Label>
            <asp:TextBox ID="TextBox23" runat="server"></asp:TextBox>
            </p>
                <p>
                    <asp:Label ID="Label67" runat="server" Text="New Art ID: "></asp:Label>
                    <asp:TextBox ID="TextBox41" runat="server"></asp:TextBox>
            </p>
                <p>
            <asp:Label ID="Label43" runat="server" Text="New Art Date of Creation: "></asp:Label>
            <asp:TextBox ID="TextBox24" runat="server" TextMode="Date"></asp:TextBox>
        </p>
                <p>
            <asp:Label ID="Label44" runat="server" Text="New Art's Artist Name: "></asp:Label>
                <asp:DropDownList ID="DropDownList8" runat="server" DataSourceID="SqlDataSource1" DataTextField="artistName" DataValueField="artistName">
                    <asp:ListItem Selected="True">No Change</asp:ListItem>
                </asp:DropDownList>
            <br />
        </p>
                <p>
            <asp:Label ID="Label46" runat="server" Text="New Art Exhibition: "></asp:Label>
                <asp:DropDownList ID="DropDownList9" AppendDataBoundItems="true" runat="server" DataSourceID="SqlDataSource2" DataTextField="exhibit_name" DataValueField="exhibit_name">
                    <asp:ListItem Selected="True">No Change</asp:ListItem>
                    <asp:ListItem>None</asp:ListItem>
                </asp:DropDownList>
            <br />
        </p>
                <p>
            <asp:Label ID="Label47" runat="server" Text="New Art Collection: "></asp:Label>
                <asp:DropDownList ID="DropDownList10" AppendDataBoundItems="true" runat="server" DataSourceID="SqlDataSource3" DataTextField="collectionName" DataValueField="collectionName">
                    <asp:ListItem Selected="True">No Change</asp:ListItem>
                    <asp:ListItem>None</asp:ListItem>
                </asp:DropDownList>
        </p>
        <p>
            <asp:Button ID="Button4" runat="server" onClientClick = "javascript:return confirm('you sure you wanna do this?');" OnClick="Button4_Click" Text="Modify Art" />
            <br />
            <asp:Label ID="Label40" runat="server" Text="Label" Font-Size="10pt" ForeColor="#3366FF" Visible="False"></asp:Label>
        </p>
            </div>
            <div class="Artists">
                <p>
            <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="28pt" Text="Manage Artist" Font-Underline="True"></asp:Label>
        </p>
             <asp:GridView ID="GridView4" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="ID" DataSourceID="SqlDataSource6" ForeColor="Black" Width="615px" Font-Size="9pt">
                        <Columns>
                            <asp:BoundField DataField="artistName" HeaderText="Artist Name" SortExpression="artistName" />
                            <asp:BoundField DataField="dateOfBirth" HeaderText="Date of Birth" SortExpression="dateOfBirth" />
                            <asp:BoundField DataField="dateOfDeath" HeaderText="Date of Death" SortExpression="dateOfDeath" />
                            <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
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
                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString %>" SelectCommand="SELECT artistName, dateOfBirth, dateOfDeath, ID FROM museumSchema.Artist"></asp:SqlDataSource>
                <p>
                    &nbsp;</p>
                <p>
            <asp:Label ID="Label56" runat="server" Font-Bold="True" Font-Size="18pt" Text="Add Artist:"></asp:Label>
            <br />
            <asp:Label ID="Label57" runat="server" Text="All entries required." Font-Size="10pt" ForeColor="#0066FF"></asp:Label>
        </p>
        <asp:Label ID="Label16" runat="server" Text="Artist Name:"></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <p>
            <asp:Label ID="Label17" runat="server" Text="Artist Date of Birth:"></asp:Label>
            <asp:TextBox ID="TextBox18" runat="server" TextMode="Date"></asp:TextBox>
        </p>
        <asp:Label ID="Label18" runat="server" Text="Artist Date of Death:"></asp:Label>
        <asp:TextBox ID="TextBox19" runat="server" TextMode="Date"></asp:TextBox>
        <br />
        <p>
            <asp:Button ID="Button5" runat="server" Text="Add Artist" OnClick="Button5_Click" />
                </p>
        <p>
            <asp:Label ID="Label20" runat="server" ForeColor="Red" Text="Label6" Visible="False"></asp:Label>
            <asp:Label ID="Label61" runat="server" ForeColor="Blue" Text="Label6" Visible="False"></asp:Label>
            <asp:Label ID="Label62" runat="server"></asp:Label>
        </p>
                <p>
                    &nbsp;</p>
        <asp:Label ID="Label35" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Remove Artist:"></asp:Label>
                <br />
            <asp:Label ID="Label60" runat="server" Text="Entry required." Font-Size="10pt" ForeColor="#0066FF"></asp:Label>
        <p>
            <asp:Label ID="Label36" runat="server" Text="Artist ID:"></asp:Label>
            <asp:TextBox ID="TextBox21" runat="server" MaxLength="7"></asp:TextBox>
        </p>
                <asp:Button ID="Button6" runat="server" Text="Remove Artist" onClientClick = "javascript:return confirm('you sure you wanna do this?');" OnClick="Button6_Click" />
        <br />
        <br />
        <asp:Label ID="Label37" runat="server" ForeColor="Highlight" Text="Label9" Visible="False"></asp:Label>
                <br />
        <p>
            &nbsp;</p>
                <p>
            <asp:Label ID="Label38" runat="server" Font-Bold="True" Font-Size="18pt" Text="Search Artist:"></asp:Label>
                    <br />
            <asp:Label ID="Label58" runat="server" Text="Entry required." Font-Size="10pt" ForeColor="#0066FF"></asp:Label>
        </p>
        <p>
            <asp:Label ID="Label39" runat="server" Text="Artist Name: "></asp:Label>
            <asp:TextBox ID="TextBox22" runat="server" MaxLength="7"></asp:TextBox>
        </p>
                <p>
                    <asp:Label ID="Label63" runat="server" Text="Date of Birth: "></asp:Label>
                    <asp:TextBox ID="TextBox35" runat="server" TextMode="Date"></asp:TextBox>
&nbsp;-
                    <asp:TextBox ID="TextBox38" runat="server" TextMode="Date"></asp:TextBox>
        </p>
                <p>
                    <asp:Label ID="Label64" runat="server" Text="Date of Death: "></asp:Label>
                    <asp:TextBox ID="TextBox36" runat="server" TextMode="Date"></asp:TextBox>
&nbsp;-
                    <asp:TextBox ID="TextBox39" runat="server" TextMode="Date"></asp:TextBox>
        </p>
                <p>
                    <asp:Label ID="Label65" runat="server" Text="ID Number: "></asp:Label>
                    <asp:TextBox ID="TextBox37" runat="server"></asp:TextBox>
        </p>
                <p>
                    <asp:Button ID="Button7" runat="server" Text="Search Artist" OnClick="Button7_Click" />
        </p>
        <p>
            <asp:Label ID="Label41" runat="server" ForeColor="Highlight" Text="Label13" Visible="False"></asp:Label>
        </p>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="Black" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2" Font-Size="9pt" Width="615px">
            <Columns>
                <asp:BoundField DataField="artistName" HeaderText="Name" 
                    ReadOnly="True" />
                <asp:BoundField DataField="dateOfBirth" HeaderText="Date of Birth" 
                    ReadOnly="True" />
                <asp:BoundField DataField="dateOfDeath" HeaderText="Date of Death" 
                    ReadOnly="True" />
                <asp:BoundField DataField="ID" HeaderText="ID Number" />
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
                <br />
                <br />
        <asp:Label ID="Label48" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Modify Artist:"></asp:Label>
                <br />
            <asp:Label ID="Label59" runat="server" Text="One or more entries required." Font-Size="10pt" ForeColor="#0066FF"></asp:Label>
        <p>
            <asp:Label ID="Label49" runat="server" Text="Artist ID:"></asp:Label>
            <asp:TextBox ID="TextBox29" runat="server"></asp:TextBox>
        </p>
                <p>
                    -----------------------------------------------</p>
                <p>
            <asp:Label ID="Label50" runat="server" Text="New Artist Name:"></asp:Label>
            <asp:TextBox ID="TextBox30" runat="server"></asp:TextBox>
        </p>
        <asp:Label ID="Label52" runat="server" Text="New Date of Birth:"></asp:Label>
        <asp:TextBox ID="TextBox32" runat="server" TextMode="Date"></asp:TextBox>
                <p>
            <asp:Label ID="Label54" runat="server" Text="New Date of Death:"></asp:Label>
            <asp:TextBox ID="TextBox34" runat="server" TextMode="Date"></asp:TextBox>
        </p>
                <p>
                    <asp:Label ID="Label66" runat="server" Text="New Artist ID: "></asp:Label>
                    <asp:TextBox ID="TextBox40" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="Button8" runat="server" Text="Modify Artist" onClientClick = "javascript:return confirm('you sure you wanna do this?');" OnClick="Button8_Click" />
                </p>
        <asp:Label ID="Label55" runat="server" ForeColor="Highlight" Text="Label21" Visible="False"></asp:Label>
            </div>
        </div>
        <!--COPY AND PASTE BODY CONTENT HERE-->
    </form>
</body>
</html>

