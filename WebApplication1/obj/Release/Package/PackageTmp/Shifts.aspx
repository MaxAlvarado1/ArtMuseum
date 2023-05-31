<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Shifts.aspx.cs" Inherits="WebApplication1.Shifts" %>

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
                    <h1><a href="Shifts.aspx">MFA, <span>Museum Of Fine Arts</span></a></h1>
                </div>
                <div class="SignIn">
                    <p><asp:Label ID="HelloName" runat="server" Text="Hello, EmployeeName"></asp:Label></p>
                    <a href="Home.aspx"><p id="sign">
                    <asp:Button ID="SignOut" runat="server" OnClick="SignOut_Click" Text="Sign Out" BackColor="#101010" BorderStyle="None" Font-Names="&quot;Azeret Mono&quot;" Font-Size="12pt" CssClass="SignOut" />
                    </p></a>
                </div>
            </div>
        </div>

        <!--COPY AND PASTE BODY CONTENT HERE-->
        <div class="BodyContent">
            
            <br />
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="28pt" Font-Underline="True" Text="View Your Shifts"></asp:Label>
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Width="1250px" OnRowCommand="GridView1_RowCommand">
                <Columns>
                    <asp:BoundField DataField="employeeID" HeaderText="ID" />
                    <asp:BoundField DataField="startDateTime" HeaderText="Start Time" />
                    <asp:BoundField DataField="endDateTime" HeaderText="End Time" />
                    <asp:BoundField DataField="requestOff" HeaderText="Requested Off" />
                    <asp:ButtonField ButtonType="Button" CommandName="RequestOff" HeaderText="Request Off" Text="Requeste Off" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
            <br />
            <asp:Label ID="Label2" runat="server" Font-Size="9pt" ForeColor="Blue" Text="Label" Visible="False"></asp:Label>
            <br />
            
        </div>
        <!--COPY AND PASTE BODY CONTENT HERE-->
    </form>
</body>
</html>
