<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/PlaylistManagerMaster.Master" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="PlaylistManager.Account.EditProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content1" runat="server">
    <label class="col-lg-6 control-label">Email:</label>
    <br />
    <div style="width:10%; margin-left: 10px;">
        <asp:TextBox CssClass="form-control" ID="EmailTextBox" runat="server"></asp:TextBox>
    </div>

    <br />

    <label class="col-lg-6 control-label">First Name:</label>
    <br />
    <div style="width:10%; margin-left: 10px;">
        <asp:TextBox CssClass="form-control" ID="FirstNameTextBox" runat="server"></asp:TextBox>
    </div>

    <br />

    <label class="col-lg-6 control-label">Last Name:</label>
    <br />
    <div style="width:10%; margin-left: 10px;">
        <asp:TextBox CssClass="form-control" ID="LastNameTextBox" runat="server"></asp:TextBox>
    </div>

    <br />

    <label class="col-lg-6 control-label">Image Url:</label>
    <br />
    <div style="width:10%; margin-left: 10px;">
        <asp:TextBox TextMode="Url" CssClass="form-control" ID="ImageUrlTextBox" runat="server"></asp:TextBox>
    </div>

    <br />

    <label class="col-lg-6 control-label">Youtube Url:</label>
    <br />
    <div style="width:10%; margin-left: 10px;">
        <asp:TextBox TextMode="Url" CssClass="form-control" ID="YoutubeUrlTextBox" runat="server"></asp:TextBox>
    </div>

    <br />

    <label class="col-lg-6 control-label">Facebook Url:</label>
    <br />
    <div style="width:10%; margin-left: 10px;">
        <asp:TextBox TextMode="Url" CssClass="form-control" ID="FacebookUrlTextBox" runat="server"></asp:TextBox>
    </div>

    <br />
    
    <div style="margin-left: 10px" class="form-group">
        <asp:Button CssClass="btn btn-success" OnClick="SaveButton_Click" ID="SaveButton" runat="server" Text="Save"/>
    </div>
</asp:Content>
