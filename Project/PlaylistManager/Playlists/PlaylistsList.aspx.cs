using Models;
using Ninject;
using PlaylistManager.Pages;
using PlaylistManager.Services.Contracts;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PlaylistManager.Playlists
{
    public partial class PlaylistsList : AuthorisedPage
    {
        [Inject]
        public ICategoryService CategoryService { get; set; }

        [Inject]
        public IPlaylistService PlaylistService { get; set; }

        public List<Playlist> playlists { get; set; }

        private const int pageSize = 10;

        private string search;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["Search"]))
            {
                search = Request.QueryString["Search"];

                if(LoggedUser == null)
                {
                    Response.Redirect("~");
                }
            }

            if (!Page.IsPostBack)
            {
                PlaylistsGridView.DataSource = string.IsNullOrWhiteSpace(search) ? PlaylistService.GetPlaylistsInPage(0, pageSize) : PlaylistService.GetPlaylistsInPage(search, 0, pageSize);

                PlaylistsGridView.DataBind();
            }
        }

        protected void PreviousLinkButton_Click(object sender, EventArgs e)
        {
            int page = int.Parse(PageHiddenField.Value);

            if (!string.IsNullOrEmpty(Request.QueryString["Search"]))
            {
                search = Request.QueryString["Search"];
            }

            int numberOfPlaylists = string.IsNullOrWhiteSpace(search) ? PlaylistService.GetNumberOfPlaylists() : PlaylistService.GetNumberOfPlaylists(search);

            if (page > 0)
            {
                page--;
            }
            else
            {
                page = numberOfPlaylists / pageSize + (numberOfPlaylists % pageSize == 0 ? -1 : 0);
            }

            playlists = string.IsNullOrWhiteSpace(search) ? PlaylistService.GetPlaylistsInPage(page, pageSize) : PlaylistService.GetPlaylistsInPage(search, page, pageSize);

            PlaylistsGridView.DataSource = playlists;

            PlaylistsGridView.DataBind();

            PageHiddenField.Value = page.ToString();
        }

        protected void NextLinkButton_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["Search"]))
            {
                search = Request.QueryString["Search"];
            }

            int page = int.Parse(PageHiddenField.Value);

            int numberOfPlaylists = string.IsNullOrWhiteSpace(search) ? PlaylistService.GetNumberOfPlaylists() : PlaylistService.GetNumberOfPlaylists(search);

            if (page >= numberOfPlaylists / pageSize + (numberOfPlaylists % pageSize == 0 ? -1 : 0))
            {
                page = 0;
            }
            else
            {
                page++;
            }

            playlists = string.IsNullOrWhiteSpace(search) ? PlaylistService.GetPlaylistsInPage(page, pageSize) : PlaylistService.GetPlaylistsInPage(search, page, pageSize);

            PlaylistsGridView.DataSource = playlists;

            PlaylistsGridView.DataBind();

            PageHiddenField.Value = page.ToString();
        }
    }
}