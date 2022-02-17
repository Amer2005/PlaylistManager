<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PlaylistManager.Account.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
    <form id="form1" runat="server">
        <br />
        <br />
    <div align="center" class="container jumbotron bg-light boxshadow" style="width:25%">
        <div class="card-header-pills bg-dark text-white">
            <h2>Login Page</h2>
        </div>
        <div class="form-group" style=" width:80%">
            <asp:Label ForeColor="Red" Visible="false" Display="Dynamic" ID="WrongInfoLabel" Text="Wrong email or passoword <br/>" runat="server" />
            <asp:RequiredFieldValidator Display="Dynamic" ID="EmailValidator" runat="server" ErrorMessage="Email cannot be blank <br />" ControlToValidate="PasswordTextBox" ForeColor="Red"></asp:RequiredFieldValidator>
            <label class="text-dark" for="emailLabel">Email Address</label>
            <div class="input-group mb-2">
                <div class="input-group-prepend">
                    <div class="input-group-text">@</div>
                </div>
                <asp:TextBox TextMode="Email" ID="EmailTextBox" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <asp:RequiredFieldValidator Display="Dynamic" ID="PasswordValidator" runat="server" ErrorMessage="Password cannot be blank <br />" ControlToValidate="PasswordTextBox" ForeColor="Red"></asp:RequiredFieldValidator>
            <label class="text-dark" for="passLabel">Password</label>
            <asp:TextBox ID="PasswordTextBox" runat="server" CssClass="form-control" TextMode="Password" Width="80%"></asp:TextBox>
        </div>
        <br />
        <asp:Button ID="LoginButton" runat="server" Text="Login" OnClick="LoginButton_Click"  CssClass="btn btn-primary"/>
        <div>
            <label class="text-dark" for="passLabel">Need an account?</label>
            <a href = "~/Account/Register.aspx" runat="server">Sign up.</a>
        </div>
    </div>
    </form>
</body>
</html>
