<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageEmployee.aspx.cs" Inherits="WebApplication1.ManageEmployee" %>

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

        
        <div class="BodyContent">
            <!--COPY AND PASTE BODY CONTENT HERE-->
            <asp:Panel ID="Panel1" runat="server" BackColor="#FFFFCC" BorderStyle="None" Font-Size="Medium" Height="1500px" Width="1253px" Font-Bold="False" style="margin-top: 0px">
            <asp:Label ID="LabelEmployees" runat="server" Text="Manage Employees" Font-Bold="True" Font-Size="28pt" Font-Underline="True"></asp:Label>
                <br />
                <br />
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="SSN" DataSourceID="SqlDataSource1" ForeColor="Black" Width="1250px">
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="ID_num" HeaderText="ID Number" SortExpression="ID_num" />
                        <asp:BoundField DataField="SSN" HeaderText="SSN" ReadOnly="True" SortExpression="SSN" />
                        <asp:BoundField DataField="SuperSSN" HeaderText="Supervisor SSN" SortExpression="SuperSSN" />
                        <asp:BoundField DataField="dateOfBirth" HeaderText="Date of Birth" SortExpression="dateOfBirth" />
                        <asp:BoundField DataField="gender" HeaderText="Gender" SortExpression="gender" />
                        <asp:BoundField DataField="wage" HeaderText="Wage" SortExpression="wage" />
                        <asp:BoundField DataField="job_Title" HeaderText="Job Title" SortExpression="job_Title" />
                        <asp:BoundField DataField="location_Num" HeaderText="Location Number" SortExpression="location_Num" />
                        <asp:BoundField DataField="start_employ" HeaderText="Start Employment" SortExpression="start_employ" />
                        <asp:BoundField DataField="end_Employ" HeaderText="End Employment" SortExpression="end_Employ" />
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString %>" SelectCommand="SELECT Name, ID_num, SSN, SuperSSN, dateOfBirth, gender, wage, job_Title, location_Num, start_employ, end_Employ FROM museumSchema.Employees"></asp:SqlDataSource>
                <br />
                <br />
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="18pt" Text="Add Employee:"></asp:Label>
                <br />
                <asp:Label ID="LabelSearchEmployeesReq0" runat="server" Text="All entries required. " Font-Size="X-Small" ForeColor="#FF5050"></asp:Label>
                <br />
            <asp:Label ID="LabelNewEmployeeName" runat="server" Font-Size="Small" Text="New Employee Name: "></asp:Label>
            <asp:TextBox ID="NewEmployeeName" runat="server" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                <br />
            <asp:Label ID="LabelNewEmployeeSSN" runat="server" Text="New Employee SSN: " Font-Size="Small"></asp:Label>
            <asp:TextBox ID="NewEmployeeSSN" runat="server" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                <br />
                <asp:Label ID="LabelNewEmployeeDOB" runat="server" Text="New Employee Date of Birth: " Font-Size="Small"></asp:Label>
            <asp:TextBox ID="NewEmployeeDOB" runat="server" BorderStyle="Solid" BorderWidth="1px" TextMode="Date"></asp:TextBox>
                <br />
                <asp:Label ID="LabelNewEmployeeGender" runat="server" Text="New Employee Gender: " Font-Size="Small"></asp:Label>
            <asp:DropDownList ID="NewEmployeeGender" runat="server">
                <asp:ListItem Value="M">Male</asp:ListItem>
                <asp:ListItem Value="F">Female</asp:ListItem>
                <asp:ListItem Value="O">Other</asp:ListItem>
            </asp:DropDownList>
                <br />
            <asp:Label ID="LabelNewEmployeeWage" runat="server" Text="New Employee Wage: " Font-Size="Small"></asp:Label>
            <asp:TextBox ID="NewEmployeeWage" runat="server" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
            <asp:Label ID="LabelNewEmployeeWageReq" runat="server" Font-Size="X-Small" Text="(Per hour). Min: 7.50"></asp:Label>
                <br />
            <asp:Label ID="LabelNewEmployeeJobTitle" runat="server" Text="New Employee Job Title: " Font-Size="Small"></asp:Label>
                <asp:DropDownList ID="NewEmployeeJobTitle" runat="server">
                    <asp:ListItem>Maintenance</asp:ListItem>
                    <asp:ListItem>Ticket Booth </asp:ListItem>
                    <asp:ListItem>Gallery Assiantant</asp:ListItem>
                    <asp:ListItem>Theater</asp:ListItem>
                    <asp:ListItem>Gift Shop</asp:ListItem>
                    <asp:ListItem>Exhibition Assiantant</asp:ListItem>
                    <asp:ListItem>Security</asp:ListItem>
                    <asp:ListItem>Maintenance Manager</asp:ListItem>
                    <asp:ListItem>Tickets Manager</asp:ListItem>
                    <asp:ListItem>Gallery Manager</asp:ListItem>
                    <asp:ListItem>Theater Manager</asp:ListItem>
                    <asp:ListItem>Merchandise Manager</asp:ListItem>
                    <asp:ListItem>Exhibition Manager</asp:ListItem>
                    <asp:ListItem>Security Manager</asp:ListItem>
                </asp:DropDownList>
                <br />
            <asp:Label ID="LabelNewEmployeeStart" runat="server" Text="New Employee Employement Start: " Font-Size="Small"></asp:Label>
            <asp:TextBox ID="NewEmployeeStart" runat="server" BorderStyle="Solid" BorderWidth="1px" TextMode="Date"></asp:TextBox>
                <br />
                <br />
            <asp:Button ID="NewEmployeeSubmit" runat="server" BackColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" OnClick="NewEmployeeSubmit_Click" Text="Submit New Employee" />
                <br />
            <asp:Label ID="LabelNewEmployeeMessage" runat="server" Font-Size="X-Small" ForeColor="#FF5050" Text="Invisible message" Visible="False"></asp:Label>
            <asp:Label ID="LabelNewEmployeeID" runat="server" Font-Size="12pt" ForeColor="Blue" Text="Invisible new ID" Visible="False"></asp:Label>
                &nbsp;<asp:Label ID="Label66" runat="server" ForeColor="Red" Text="&lt;- COPY THIS. USE THIS TO REGISTER." Visible="False"></asp:Label>
                <br />
                <br />
                <br />
                <asp:Label ID="LabelTerminateEmployee" runat="server" Font-Bold="True" Font-Size="18pt" Text="Terminate Employee:"></asp:Label>
                <br />
                <asp:Label ID="LabelSearchEmployeesReq1" runat="server" Font-Size="X-Small" ForeColor="#FF5050" Text="Entry required. "></asp:Label>
                <br />
                <asp:Label ID="LabelTerminateEmployeeID" runat="server" Font-Size="Small" Text="Terminate Employee ID: "></asp:Label>
            <asp:TextBox ID="InputTerminateEmployeeID" runat="server" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="DeleteEmployeeSubmit0" runat="server" BackColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" onClientClick = "javascript:return confirm('you sure you wanna do this?');" OnClick="DeleteEmployeeSubmit0_Click" Text="Submit Termination" />
                <br />
                <asp:Label ID="LabelDeleteEmployeeMessage" runat="server" Font-Size="X-Small" ForeColor="#FF5050" Text="Invisible message" Visible="False"></asp:Label>
                <br />
                <br />
                <br />
                <asp:Label ID="LabelSearchEmployees" runat="server" Font-Bold="True" Font-Size="18pt" Text="Search Employee(s):"></asp:Label>
                <br />
                <asp:Label ID="LabelSearchEmployeesReq" runat="server" Font-Size="X-Small" ForeColor="#FF5050" Text="One or more entries required. No entries will give all employees."></asp:Label>
                <br />
                <asp:Label ID="LabelEmployeeName" runat="server" Font-Size="Small" Text="Employee Name: "></asp:Label>
                <asp:TextBox ID="SearchEmployeeName" runat="server" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                <br />
                <asp:Label ID="LabelEmployeeID" runat="server" Font-Size="Small" Text="Employee ID:"></asp:Label>
                <asp:TextBox ID="SearchEmployeeID" runat="server" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                <br />
                <asp:Label ID="LabelEmployeeSSN" runat="server" Font-Size="Small" Text="Employee SNN: "></asp:Label>
                <asp:TextBox ID="SearchEmployeeSSN" runat="server" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                <br />
                <asp:Label ID="LabelEmployeeSupSSN" runat="server" Font-Size="Small" Text="Employee Supervisor SNN: "></asp:Label>
                <asp:TextBox ID="SearchEmployeeSupSSN" runat="server" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                <br />
                <asp:Label ID="LabelEmployeeDOB" runat="server" Font-Size="Small" Text="Employee Date of Birth: "></asp:Label>
                <asp:TextBox ID="SearchEmployeeDOB" runat="server" BorderStyle="Solid" BorderWidth="1px" TextMode="Date"></asp:TextBox>
                <br />
                <asp:Label ID="LabelEmployeeGender" runat="server" Font-Size="Small" Text="Employee Gender: "></asp:Label>
                <asp:DropDownList ID="SearchEmployeeGender" runat="server">
                    <asp:ListItem Value="Empty">Empty</asp:ListItem>
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                    <asp:ListItem>Other</asp:ListItem>
                </asp:DropDownList>
                <br />
                <asp:Label ID="LabelEmployeeWage" runat="server" Font-Size="Small" Text="Employee Wage: "></asp:Label>
                <asp:TextBox ID="SearchEmployeeWage" runat="server" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                <asp:Label ID="LabelEmployeeWageReq" runat="server" Font-Size="X-Small" Text="(Per hour). Min: 7.50"></asp:Label>
                <br />
                <asp:Label ID="LabelEmployeeJobTitle" runat="server" Font-Size="Small" Text="Employee Job Title: "></asp:Label>
                <asp:DropDownList ID="SearchEmployeeJob" runat="server">
                    <asp:ListItem>ALL</asp:ListItem>
                    <asp:ListItem>Maintenance</asp:ListItem>
                    <asp:ListItem>Ticket Booth </asp:ListItem>
                    <asp:ListItem>Gallery Assiantant</asp:ListItem>
                    <asp:ListItem>Theater</asp:ListItem>
                    <asp:ListItem>Gift Shop</asp:ListItem>
                    <asp:ListItem>Exhibition Assiantant</asp:ListItem>
                    <asp:ListItem>Security</asp:ListItem>
                    <asp:ListItem>Maintenance Manager</asp:ListItem>
                    <asp:ListItem>Tickets Manager</asp:ListItem>
                    <asp:ListItem>Gallery Manager</asp:ListItem>
                    <asp:ListItem>Theater Manager</asp:ListItem>
                    <asp:ListItem>Merchandise Manager</asp:ListItem>
                    <asp:ListItem>Exhibition Manager</asp:ListItem>
                    <asp:ListItem>Security Manager</asp:ListItem>
                    <asp:ListItem>Director</asp:ListItem>
                </asp:DropDownList>
                <br />
                <asp:Label ID="LabelEmployeeLocationNum" runat="server" Font-Size="Small" Text="Employee Location Num: "></asp:Label>
                <asp:TextBox ID="SearchLocationNum" runat="server" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                <br />
                <asp:Label ID="LabelEmploymentStart" runat="server" Font-Size="Small" Text="Employee Employement Start: "></asp:Label>
                <asp:TextBox ID="SearchEmployeeStart1" runat="server" BorderStyle="Solid" BorderWidth="1px" TextMode="Date"></asp:TextBox>
                -
                <asp:TextBox ID="SearchEmployeeStart2" runat="server" BorderStyle="Solid" BorderWidth="1px" TextMode="Date"></asp:TextBox>
                <br />
            <asp:Label ID="LabelEmploymentEnd" runat="server" Font-Size="Small" Text="Employee Employement End: "></asp:Label>
            <asp:TextBox ID="SearchEmploymentEnd1" runat="server" BorderStyle="Solid" BorderWidth="1px" TextMode="Date"></asp:TextBox>
            -
            <asp:TextBox ID="SearchEmployeeEnd2" runat="server" BorderStyle="Solid" BorderWidth="1px" TextMode="Date"></asp:TextBox>
                <br />
                <br />
            <asp:Button ID="SearchEmployeeSubmit" runat="server" BackColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" OnClick="SearchEmployeeSubmit1_Click" Text="Search Employee(s)" />
                <br />
            <asp:Label ID="Label32" runat="server" Font-Size="X-Small" ForeColor="#FF5050" Text="Invisible message" Visible="False"></asp:Label>
                <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" Font-Size="Small" ForeColor="Black" GridLines="Vertical" HorizontalAlign="Center">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="ID_num" HeaderText="ID Number" />
                    <asp:BoundField DataField="SSN" HeaderText="SSN" />
                    <asp:BoundField DataField="SuperSSN" HeaderText="Supervisor SNN" />
                    <asp:BoundField DataField="dateOfBirth" DataFormatString="{0:MM/dd/yyyy}" HeaderText="Date of Birth" />
                    <asp:BoundField DataField="gender" HeaderText="Gender" />
                    <asp:BoundField DataField="wage" HeaderText="Wage (Per Hour)" />
                    <asp:BoundField DataField="job_Title" HeaderText="Job Title" />
                    <asp:BoundField DataField="location_Num" HeaderText="Location" />
                    <asp:BoundField DataField="start_employ" DataFormatString="{0:MM/dd/yyyy}" HeaderText="Start Date" />
                    <asp:BoundField DataField="end_Employ" DataFormatString="{0:MM/dd/yyyy}" HeaderText="End Date" />
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
            <asp:Label ID="Label35" runat="server" Font-Bold="True" Font-Size="18pt" Text="Update Employee(s):"></asp:Label>
                <br />
            <asp:Label ID="Label36" runat="server" Font-Size="X-Small" ForeColor="#FF5050" Text="Entry Required."></asp:Label>
                <br />
                <asp:Label ID="Label60" runat="server" Font-Size="Small" Text="Employee ID:"></asp:Label>
            <asp:TextBox ID="OldID" runat="server"></asp:TextBox>
                <br />
                -----------------------------------------------<br />
                <asp:Label ID="Label65" runat="server" Font-Size="X-Small" ForeColor="#FF5050" Text="One of more entries required."></asp:Label>
                <br />
                <asp:Label ID="Label48" runat="server" Font-Size="Small" Text="New Employee Name: "></asp:Label>
                <asp:TextBox ID="NewName" runat="server"></asp:TextBox>
                <br />
            <asp:Label ID="Label61" runat="server" Font-Size="Small" Text="New Employee ID:"></asp:Label>
            <asp:TextBox ID="NewID" runat="server"></asp:TextBox>
                <br />
            <asp:Label ID="Label49" runat="server" Font-Size="Small" Text="New Employee SSN: "></asp:Label>
            <asp:TextBox ID="NewSSN" runat="server"></asp:TextBox>
                <br />
            <asp:Label ID="Label50" runat="server" Font-Size="Small" Text="New Employee Supervisor SSN: "></asp:Label>
            <asp:TextBox ID="NewSupSSN" runat="server"></asp:TextBox>
                <br />
            <asp:Label ID="Label51" runat="server" Font-Size="Small" Text="New Employee Date of Birth: "></asp:Label>
            <asp:TextBox ID="NewDOB" runat="server" TextMode="Date"></asp:TextBox>
                <br />
            <asp:Label ID="Label52" runat="server" Font-Size="Small" Text="New Employee Gender: "></asp:Label>
            <asp:DropDownList ID="NewGender" runat="server">
                <asp:ListItem>Male</asp:ListItem>
                <asp:ListItem>Female</asp:ListItem>
                <asp:ListItem>Other</asp:ListItem>
            </asp:DropDownList>
                <br />
            <asp:Label ID="Label53" runat="server" Font-Size="Small" Text="New Employee Wage: "></asp:Label>
            <asp:TextBox ID="NewWage" runat="server"></asp:TextBox>
                <asp:Label ID="LabelEmployeeWageReq0" runat="server" Font-Size="X-Small" Text="(Per hour). Min: 7.50"></asp:Label>
                <br />
            <asp:Label ID="Label55" runat="server" Font-Size="Small" Text="New Employee Job Title: "></asp:Label>
                <asp:DropDownList ID="NewEmployeeJobTitle0" runat="server">
                    <asp:ListItem>Maintenance</asp:ListItem>
                    <asp:ListItem>Ticket Booth </asp:ListItem>
                    <asp:ListItem>Gallery Assiantant</asp:ListItem>
                    <asp:ListItem>Theater</asp:ListItem>
                    <asp:ListItem>Gift Shop</asp:ListItem>
                    <asp:ListItem>Exhibition Assiantant</asp:ListItem>
                    <asp:ListItem>Security</asp:ListItem>
                    <asp:ListItem>Maintenance Manager</asp:ListItem>
                    <asp:ListItem>Tickets Manager</asp:ListItem>
                    <asp:ListItem>Gallery Manager</asp:ListItem>
                    <asp:ListItem>Theater Manager</asp:ListItem>
                    <asp:ListItem>Merchandise Manager</asp:ListItem>
                    <asp:ListItem>Exhibition Manager</asp:ListItem>
                    <asp:ListItem>Security Manager</asp:ListItem>
                </asp:DropDownList>
                <br />
            <asp:Label ID="Label57" runat="server" Font-Size="Small" Text="New Employee Location Number: "></asp:Label>
            <asp:TextBox ID="NewLoc" runat="server"></asp:TextBox>
                <br />
            <asp:Label ID="Label58" runat="server" Font-Size="Small" Text="New Employee Employement Start: "></asp:Label>
            <asp:TextBox ID="NewStart" runat="server" TextMode="Date"></asp:TextBox>
                <br />
            <asp:Label ID="Label63" runat="server" Font-Size="Small" Text="New Employee Employement End: "></asp:Label>
            <asp:TextBox ID="NewEnd" runat="server" TextMode="Date"></asp:TextBox>
                <br />
                <br />
            <asp:Button ID="Button2" runat="server" BackColor="#CCCCCC" BorderStyle="None" onClientClick = "javascript:return confirm('you sure you wanna do this?');" OnClick="Button2_Click" Text="Update Employee(s)" />
                <br />
            <asp:Label ID="Label47" runat="server" Font-Size="X-Small" ForeColor="#FF5050" Text="Invisible message" Visible="False"></asp:Label>
            </asp:Panel>
            <!--COPY AND PASTE BODY CONTENT HERE-->
        </div>
    </form>
</body>
</html>
