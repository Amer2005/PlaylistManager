<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/PlaylistManagerMaster.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="PlaylistManager.Account.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/ProfilePage.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content1" runat="server">
    <div class="page-content page-container" id="page-content">
        <div class="padding">
            <div class="row container d-flex justify-content-center">
                <div class="col-xl-6 col-md-12">
                    <div class="card user-card-full">
                        <div class="row m-l-0 m-r-0">
                            <div class="col-sm-4 bg-c-lite-green user-profile">
                                <div class="card-block text-center text-white">
                                    <div class="m-b-25">
                                        <img width="100" src="<%= UserNow == null ? "https://www.pngkey.com/png/full/157-1579943_no-profile-picture-round.png" : string.IsNullOrWhiteSpace(UserNow.ImageURL) ? "https://www.pngkey.com/png/full/157-1579943_no-profile-picture-round.png" : UserNow.ImageURL  %>" class="img-radius" alt="User-Profile-Image">
                                    </div>
                                    <h6 class="f-w-600"><%= UserNow.FirstName + " " + UserNow.LastName %></h6>
                                    <p><%= UserNow.Role.ToString() %></p>
                                    <a href="/Account/EditProfile">Edit</a>
                                    <i class=" mdi mdi-square-edit-outline feather icon-edit m-t-10 f-16"></i>
                                </div>
                            </div>
                            <div class="col-sm-8">
                                <div class="card-block">
                                    <h6 class="m-b-20 p-b-5 b-b-default f-w-600">Information</h6>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <p class="m-b-10 f-w-600">Email</p>
                                            <h6 class="text-muted f-w-400"><%= UserNow.Email %></h6>
                                        </div>
                                        <div class="col-sm-6">
                                            <p class="m-b-10 f-w-600">Playlists</p>
                                            <h6 class="text-muted f-w-400"> <a href="/Playlists/MyPlaylists.aspx">Click here</a></h6>
                                        </div>
                                    </div>

                                    <h6 class="m-b-20 m-t-40 p-b-5 b-b-default f-w-600">Urls</h6>

                                    <div class="row">
                                        <div class="col-sm-6">
                                            <p class="m-b-10 f-w-600">Youtube Url</p>
                                            <h6 class="text-muted f-w-400"> <%= string.IsNullOrEmpty(UserNow.YoutubeURL) ? "None" : $"<a href=\"{UserNow.YoutubeURL}\">Click here</a>" %></h6>
                                        </div>
                                        <div class="col-sm-6">
                                            <p class="m-b-10 f-w-600">Facebook Url</p>
                                            <h6 class="text-muted f-w-400"> <%= string.IsNullOrEmpty(UserNow.FacebookURL) ? "None" : $"<a href=\"{UserNow.FacebookURL}\">Click here</a>" %></h6>
                                        </div>
                                    </div>
                                    <ul class="social-link list-unstyled m-t-40 m-b-10">
                                        <li><a href="#!" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="facebook" data-abc="true"><i class="mdi mdi-facebook feather icon-facebook facebook" aria-hidden="true"></i></a></li>
                                        <li><a href="#!" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="twitter" data-abc="true"><i class="mdi mdi-twitter feather icon-twitter twitter" aria-hidden="true"></i></a></li>
                                        <li><a href="#!" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="instagram" data-abc="true"><i class="mdi mdi-instagram feather icon-instagram instagram" aria-hidden="true"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
