<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="WebApplication1.SignIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Azeret+Mono" />
    <link href="HeaderStyle.css" rel="stylesheet" />
    <title></title>
    <style>
        .SignInput {
            width: 500px;
            height: 500px;
            float: left;
            text-align: center;
            padding: 50px 0px;
        }

        .Register {
            width: 500px;
            height: 500px;
            float: left;
            text-align: center;
            padding: 50px 0px;
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
            </div>
        </div>

        <!--COPY AND PASTE BODY CONTENT HERE-->
        <div class="BodyContent">
            <div class="SignInput">
                <asp:Label ID="Label1" runat="server" Text="Sign In" BorderStyle="None" CssClass="SignInLabels"></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label2" runat="server" Text="Username: " CssClass="SignInLabels"></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="SignInLabels"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label3" runat="server" Text="Password: " CssClass="SignInLabels"></asp:Label>
                <asp:TextBox ID="TextBox2" runat="server" CssClass="SignInLabels" TextMode="Password"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label10" runat="server" Text="Login Failed. Username or Password Incorrect." Visible="False" Font-Size="8pt" ForeColor="Red"></asp:Label>
                <br />
                <asp:Button ID="Button1" runat="server" Text="Sign In" OnClick="Button1_Click" />
            </div>
            <div class="Register">
                <asp:Label ID="Label4" runat="server" Text="Register"></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label5" runat="server" Text="ID Number: "></asp:Label>
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label6" runat="server" Text="Username: "></asp:Label>
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label7" runat="server" Text="Password: "></asp:Label>
                <asp:TextBox ID="TextBox5" runat="server" TextMode="Password"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label8" runat="server" Text="Confirm Password: "></asp:Label>
                <asp:TextBox ID="TextBox6" runat="server" TextMode="Password"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label9" runat="server" Text="Failed Registeration. Invalid ID Number." Font-Size="8pt" ForeColor="Red" Visible="False"></asp:Label>
                <br />
                <asp:Button ID="Button2" runat="server" Text="Register" OnClick="Button2_Click" />
            </div>
        </div>
        <!--COPY AND PASTE BODY CONTENT HERE-->
    </form>
</body>
</html>
