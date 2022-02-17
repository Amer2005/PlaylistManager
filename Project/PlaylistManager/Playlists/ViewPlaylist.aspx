<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/PlaylistManagerMaster.Master" AutoEventWireup="true" CodeBehind="ViewPlaylist.aspx.cs" Inherits="PlaylistManager.Playlists.ViewPlaylist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="../css/PlaylistsList.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content1" runat="server">
    <asp:HiddenField ID="VideoHiddenField" Value="0" runat="server" />
    <div style="width: 50%; float: left;">
        <div style="width: 100%">
            <div class="embed-responsive embed-responsive-16by9">
                <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/<%= VideoId %>"></iframe>
            </div>
            <div class="card-body">
                <h1 class="card-title"><%= playlist.Title %></h1>
                <p class="h2 card-text"><%= playlist.Description %></p>
                <p class="card-text"><small class="text-muted"><%= playlist.CreationDate %></small></p>

                <asp:GridView BorderStyle="None" ID="RatingGridView" ItemType="Models.Playlist" AutoGenerateColumns="false" runat="server">
                    <Columns>
                        <asp:TemplateField HeaderText="Rating:">
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

                <ul class="pager">
                    <li class="previous">
                        <asp:LinkButton OnClick="PreviousLinkButton_Click" ID="PreviousLinkButton" runat="server">Previous</asp:LinkButton></li>
                    <li class="next">
                        <asp:LinkButton OnClick="NextLinkButton_Click" ID="NextLinkButton" runat="server">Next</asp:LinkButton></li>
                </ul>
            </div>
        </div>
    </div>

    <div style="width: 50%; float: left; padding-left: 2%" class="col">
        <div id="RatingDiv" runat="server">
            <h2>Leave a rating</h2>

            <div class="rate">

                <asp:LinkButton CommandArgument='1' CommandName="LinkButtonRating" OnClick="StarLinkButton_Click" CssClass="imjusttext rate-item" ID="StarLinkButton1" runat="server">
                <span class="fa fa-star checked"></span>
                </asp:LinkButton>

                <asp:LinkButton CommandArgument='2' CommandName="LinkButtonRating" OnClick="StarLinkButton_Click" CssClass="imjusttext rate-item" ID="StarLinkButton2" runat="server">
                <span class="fa fa-star checked"></span>
                </asp:LinkButton>

                <asp:LinkButton CommandArgument='3' CommandName="LinkButtonRating" OnClick="StarLinkButton_Click" CssClass="imjusttext rate-item" ID="StarLinkButton3" runat="server">
                <span class="fa fa-star checked"></span>
                </asp:LinkButton>

                <asp:LinkButton CommandArgument='4' CommandName="LinkButtonRating" OnClick="StarLinkButton_Click" CssClass="imjusttext rate-item" ID="StarLinkButton4" runat="server">
                <span class="fa fa-star checked"></span>
                </asp:LinkButton>

                <asp:LinkButton CommandArgument='5' CommandName="LinkButtonRating" OnClick="StarLinkButton_Click" CssClass="imjusttext rate-item" ID="StarLinkButton5" runat="server">
                <span class="fa fa-star checked"></span>
                </asp:LinkButton>
            </div>
            <br />
            <br />
        </div>
        <asp:GridView BorderStyle="None" ID="ThumbnailGridView" ItemType="Models.Video" AutoGenerateColumns="false" runat="server">
            <Columns>
                <asp:TemplateField HeaderText="Videos:">
                    <ItemTemplate>
                        <a href="<%# Item.URL %>">
                            <img style="margin-top: 30px" src="https://img.youtube.com/vi/<%# GetVideoId(Item.URL) %>/0.jpg">
                        </a>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

    </div>
    <br />
    <br />
</asp:Content>
