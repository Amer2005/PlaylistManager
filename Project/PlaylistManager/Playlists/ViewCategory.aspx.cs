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
    public partial class ViewCategory : BasePlaylistManagerPage
    {
        [Inject]
        public ICategoryService CategoryService { get; set; }

        [Inject]
        public IPlaylistService PlaylistService { get; set; }

        public List<Playlist> playlists { get; set; }


        protected void Page_PreLoad(object sender, EventArgs e)
        {
            base.Page_PreLoad(sender, e);

            if (!string.IsNullOrEmpty(Request.QueryString["CategoryId"]))
            {
                int categoryId = int.Parse(Request.QueryString["CategoryId"]);

                playlists = PlaylistService.GetPlaylistsByCategoryId(categoryId);

                PlaylistsGridView.DataSource = playlists;

                PlaylistsGridView.DataBind();
            }
            else
            {
                Response.Redirect("~/Pages/MainPage.aspx");

                return;
            }
        }
    }
}