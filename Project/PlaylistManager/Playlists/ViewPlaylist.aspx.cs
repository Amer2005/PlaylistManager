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
    public partial class ViewPlaylist : BasePlaylistManagerPage
    {
        [Inject]
        public ICategoryService CategoryService { get; set; }

        [Inject]
        public IPlaylistService PlaylistService { get; set; }

        [Inject]
        public IRatingService RatingService { get; set; }

        public Playlist playlist { get; set; }

        public string VideoId { get; set; }

        protected List<Video> videos;

        protected void Page_PreLoad(object sender, EventArgs e)
        {
            base.Page_PreLoad(sender, e);

            if(LoggedUser == null)
            {
                RatingDiv.Visible = false;
            }

            if (!string.IsNullOrEmpty(Request.QueryString["PlaylistId"]))
            {
                int playlistId = int.Parse(Request.QueryString["PlaylistId"]);

                playlist = PlaylistService.GetPlaylistById(playlistId);

                videos = PlaylistService.GetVideos(playlist);

                ThumbnailGridView.DataSource = videos;

                ThumbnailGridView.DataBind();

                UpdateVideo();
            }
            else
            {
                Response.Redirect("~/Pages/MainPage.aspx");

                return;
            }
        }

        protected void PreviousLinkButton_Click(object sender, EventArgs e)
        {
            int videoNow = int.Parse(VideoHiddenField.Value);

            if(videoNow > 0)
            {
                videoNow--;
            }
            else
            {
                videoNow = videos.Count - 1;
            }

            VideoHiddenField.Value = videoNow.ToString();

            UpdateVideo();
        }

        protected void NextLinkButton_Click(object sender, EventArgs e)
        {
            int videoNow = int.Parse(VideoHiddenField.Value);

            if (videoNow < videos.Count - 1)
            {
                videoNow++;
            }
            else
            {
                videoNow = 0;
            }

            VideoHiddenField.Value = videoNow.ToString();

            UpdateVideo();
        }

        private void UpdateVideo()
        {
            RatingGridView.DataSource = new List<Playlist> { playlist };

            RatingGridView.DataBind();

            string videoUrl = videos[int.Parse(VideoHiddenField.Value)].URL;

            var url = videoUrl;
            VideoId = GetVideoId(url);
        }

        protected void StarLinkButton_Click(object sender, EventArgs e)
        {
            if (LoggedUser == null)
            {
                return;
            }

            LinkButton btn = (LinkButton)sender;

            int rating = int.Parse(btn.CommandArgument);

            RatingService.GiveReview(rating, LoggedUser, playlist);
        }

        protected string GetVideoId(string url)
        {
            var uri = new Uri(url);

            // you can check host here => uri.Host <= "www.youtube.com"

            var query = HttpUtility.ParseQueryString(uri.Query);

            return query["v"];
        }
    }
}