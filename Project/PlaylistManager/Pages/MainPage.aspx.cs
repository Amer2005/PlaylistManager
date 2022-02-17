using Models;
using Ninject;
using PlaylistManager.Services.Contracts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PlaylistManager.Pages
{
    public partial class MainPage : BasePlaylistManagerPage
    {
        [Inject]
        public ICategoryService CategoryService { get; set; }

        [Inject]
        public IPlaylistService PlaylistService { get; set; }

        public List<Playlist> playlists { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            PlaylistsGridView.DataSource = PlaylistService.GetPlaylists().Take(10).OrderByDescending(x => PlaylistService.GetPlaylistRating(x));

            PlaylistsGridView.DataBind();
        }
    }
}