<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/PlaylistManagerMaster.Master" AutoEventWireup="true" CodeBehind="CreatePlaylist.aspx.cs" Inherits="PlaylistManager.Playlists.CreatePlaylist" %>

<%@ MasterType VirtualPath="~/MasterPages/PlaylistManagerMaster.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="../js/DynamicFields.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content1" runat="server">
    <h2>Playlist Creator</h2>
    <div class="form-group">
        <asp:TextBox Width="10%" class="form-control" ID="TitleTextBox" placeholder="Title" runat="server"></asp:TextBox>
    </div>
    <div class="form-group">
        <asp:TextBox Width="30%" class="form-control" TextMode="MultiLine" ID="DescriptionTextBox" placeholder="Description" runat="server"></asp:TextBox>
    </div>
    <div class="form-group">
        <asp:Label class="text-dark" Text="Category" runat="server" />
        <asp:DropDownList CssClass="form-control" DataValueField="CategoryId" DataTextField="Name" ID="CategoryDropDown" runat="server">
        </asp:DropDownList>
    </div>

    <div class="form-group display: inline-block">
        <div id="education_fields">
        </div>

        <div class="form-group" style="display: inline;">
            <input  style="width: 30%; display: inline;" type="url" class="form-control" id="VideoURL1" name="Url" value="" placeholder="Video URL">
        </div>



        <div class="input-group-btn" style="display: inline;">
            <button style="display: inline;" class="btn btn-success" type="button" onclick="education_fields();"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></button>
        </div>
    </div>

    <div class="form-group">
        <asp:Button Width="10%" OnClick="AddButton_Click" class="btn btn-success" ID="AddButton" runat="server" Text="Create Playlist" />
    </div>

</asp:Content>
