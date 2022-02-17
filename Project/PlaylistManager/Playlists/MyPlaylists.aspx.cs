using Models;
using Ninject;
using PlaylistManager.Pages;
using PlaylistManager.Services.Contracts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PlaylistManager.Playlists
{
    public partial class MyPlaylists : AuthorisedPage
    {
        [Inject]
        public ICategoryService CategoryService { get; set; }

        [Inject]
        public IPlaylistService PlaylistService { get; set; }

        public List<Playlist> playlists { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            base.Page_PreLoad(sender, e);

            playlists = PlaylistService.GetPlaylistsByUser(LoggedUser);

            PlaylistsGridView.DataSource = playlists;

            PlaylistsGridView.DataBind();
        }
    }
}