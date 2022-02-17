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
    public partial class CreatePlaylist : AuthorisedPage
    {
        [Inject]
        public ICategoryService CategoryService { get; set; }

        [Inject]
        public IPlaylistService PlaylistService { get; set; }

        public List<Playlist> playlists { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                CategoryDropDown.DataSource = CategoryService.GetCategories();

                CategoryDropDown.DataBind();
            }
        }

        //<button style="display: inline;" class="btn btn-success" type="button" onclick="education_fields();"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></button>

        protected void AddURLButton_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            List<string> urls = Request.Form.GetValues("Url").ToList();

            if(urls.Count == 0)
            {
                this.Master.ErrorMessage = "No Urls";

                return;
            }
            if (string.IsNullOrWhiteSpace(TitleTextBox.Text))
            {
                this.Master.ErrorMessage = "Title can't be empty";

                return;
            }
            if (string.IsNullOrWhiteSpace(DescriptionTextBox.Text))
            {
                this.Master.ErrorMessage = "Title can't be empty";

                return;
            }
            if (urls.Any(x => string.IsNullOrWhiteSpace(x)))
            {
                this.Master.ErrorMessage = "Can't have empty Urls";

                return;
            }

            PlaylistService.CreatePlaylist(TitleTextBox.Text, DescriptionTextBox.Text, int.Parse(CategoryDropDown.SelectedValue), LoggedUser, urls);
        }
    }
}