<%@ Page Language="C#" MasterPageFile="~/MasterPages/PlaylistManagerMaster.Master" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="PlaylistManager.Pages.MainPage" %>
<%@ MasterType VirtualPath="~/MasterPages/PlaylistManagerMaster.Master" %>  

<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="../css/PlaylistsList.css" rel="stylesheet" />
</asp:Content>

<asp:Content ContentPlaceHolderID="Content1" runat="server">
    <h3>Best playlists</h3>

    <asp:GridView AllowSorting="true" ItemType="Models.Playlist" AutoGenerateColumns="false" class="table table-bordered table-condensed table-responsive table-hover" ID="PlaylistsGridView" runat="server">
        <Columns>
            <asp:TemplateField HeaderText="Title">
                <ItemTemplate>
                    <a class="link-primary" href="/Playlists/ViewPlaylist?PlaylistId=<%# Item.PlaylistId %>"><%# Item.Title %></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Description" HeaderText="Description" />
            <asp:TemplateField HeaderText="Category">
                <ItemTemplate>
                    <a class="link-primary" href="/Playlists/ViewCategory?CategoryId=<%# Item.Category.CategoryId %>"><%# Item.Category.Name %></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Creator">
                <ItemTemplate>
                    <asp:Label ID="CreatorLabel" runat="server"
                        Text='<%# Item.Creator.FirstName %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="CreationDate" HeaderText="Date Created" />
            <asp:TemplateField HeaderText="Rating">
                <ItemTemplate>
                    <span class="fa fa-star <%# PlaylistService.GetPlaylistRating(Item) >= 0.5 ? "checked" : "" %>"></span>
                    <span class="fa fa-star <%# PlaylistService.GetPlaylistRating(Item) >= 1.5 ? "checked" : "" %>"></span>
                    <span class="fa fa-star <%# PlaylistService.GetPlaylistRating(Item) >= 2.5 ? "checked" : "" %>"></span>
                    <span class="fa fa-star <%# PlaylistService.GetPlaylistRating(Item) >= 3.5 ? "checked" : "" %>"></span>
                    <span class="fa fa-star <%# PlaylistService.GetPlaylistRating(Item) >= 4.5 ? "checked" : "" %>"></span>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
