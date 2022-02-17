<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="PlaylistManager.Account.Register" %>

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
            <h2>Register Page</h2>
        </div>
        <div class="form-group" style=" width:80%">
            <asp:RequiredFieldValidator Display="Dynamic" ID="EmailValidator" runat="server" ErrorMessage="Email cannot be blank <br />" ControlToValidate="EmailTextBox" ForeColor="Red"></asp:RequiredFieldValidator>
            <label class="text-dark" for="emailLabel">Email Address</label>
            <label class="text-red" for="emailLabel" style="color:red">*</label>
            <div class="input-group mb-2">
                <div class="input-group-prepend">
                    <div class="input-group-text">@</div>
                </div>
                <asp:TextBox TextMode="Email" ID="EmailTextBox" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <asp:RequiredFieldValidator Display="Dynamic" ID="PasswordValidator" runat="server" ErrorMessage="Password cannot be blank <br />" ControlToValidate="PasswordTextBox" ForeColor="Red"></asp:RequiredFieldValidator>
            
            <asp:RegularExpressionValidator ForeColor="Red" runat="server" ID="PasswordRegularExpressionValidator"
                Display = "Dynamic"
                ControlToValidate = "PasswordTextBox"
                ValidationExpression = "^[\s\S]{5,}$"
                ErrorMessage="Minimum 5 characters required <br />">
                </asp:RegularExpressionValidator>
            
            <label class="text-dark" for="passLabel">Password</label>
            <label class="text-red" for="emailLabel" style="color:red">*</label>
            <asp:TextBox ID="PasswordTextBox" runat="server" CssClass="form-control" TextMode="Password" Width="80%"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:RequiredFieldValidator Display="Dynamic" ID="FirstNameValidator" runat="server" ErrorMessage="First name cannot be blank <br />" ControlToValidate="FirstNameTextBox" ForeColor="Red"></asp:RequiredFieldValidator>
            <label class="text-dark" for="passLabel">First Name</label>
            <label class="text-red" for="emailLabel" style="color:red">*</label>
            <asp:TextBox ID="FirstNameTextBox" runat="server" CssClass="form-control" Width="80%"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:RequiredFieldValidator Display="Dynamic" ID="LastNameValidator" runat="server" ErrorMessage="Last name cannot be blank <br />" ControlToValidate="LastNameTextBox" ForeColor="Red"></asp:RequiredFieldValidator>
            <label class="text-dark" for="passLabel">Last Name</label>
            <label class="text-red" for="emailLabel" style="color:red">*</label>
            <asp:TextBox ID="LastNameTextBox" runat="server" CssClass="form-control" Width="80%"></asp:TextBox>
        </div>
        <div class="form-group">
            <label class="text-dark" for="passLabel">Image URL</label>
            <asp:TextBox TextMode="Url" ID="ImageURLTextBox" runat="server" CssClass="form-control" Width="80%"></asp:TextBox>
        </div>
        <div class="form-group">
            <label class="text-dark" for="passLabel">Facebook URL</label>
            <asp:TextBox TextMode="Url" ID="FacebookURLTextBox" runat="server" CssClass="form-control" Width="80%"></asp:TextBox>
        </div>
        <div class="form-group">
            <label class="text-dark" for="passLabel">Youtube URL</label>
            <asp:TextBox TextMode="Url" ID="YoutubeURLTextBox" runat="server" CssClass="form-control" Width="80%"></asp:TextBox>
        </div>
        <br />
        <asp:Button ID="RegisterButton" runat="server" Text="Register" OnClick="RegisterButton_Click"  CssClass="btn btn-primary"/>
        <div>
            <label class="text-dark" for="passLabel">Already have an account?</label>
            <a href = "~/Account/Login.aspx" runat="server">Sign in.</a>
            
        </div>
    </div>
    </form>
</body>
</html>
