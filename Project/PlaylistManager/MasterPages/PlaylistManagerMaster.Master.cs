using Models;
using Ninject.Web;
using PlaylistManager.Pages;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PlaylistManager.MasterPages
{
    public partial class PlaylistManagerMaster : BasePlaylistManagerMasterPage
    {

        private bool loggedIn;

        private bool isAdmin;

        public User UserNow { get; set; }

        public PlaylistManagerMaster()
        {
            loggedIn = false;
            isAdmin = false;
        }

        public string ErrorMessage
        {
            get
            {
                return ErrorMessageHiddenField.Value;
            }
            set
            {
                ErrorMessageHiddenField.Value = value;
            }
        }

        public string SuccessMessage
        {
            get
            {
                return SuccessMessageHiddenField.Value;
            }
            set
            {
                SuccessMessageHiddenField.Value = value;
            }
        }

        public bool LoggedIn
        {
            get
            {
                return loggedIn;
            }
            set
            {
                loggedIn = value;

                if (value == true)
                {
                    ProfileLink.Visible = true;
                    MyPlaylistsLink.Visible = true;
                    LogOutLink.Visible = true;
                    LogInLink.Visible = false;
                    SearchButton.Visible = true;
                    SearchTextBox.Visible = true;

                    CreatePlaylistLink.CssClass = "nav-link";
                    PlaylistsListLink.CssClass = "nav-link";
                }
                else
                {
                    ProfileLink.Visible = false;
                    MyPlaylistsLink.Visible = false;
                    LogOutLink.Visible = false;
                    LogInLink.Visible = true;
                    SearchButton.Visible = false;
                    SearchTextBox.Visible = false;

                    CreatePlaylistLink.CssClass = "nav-link disabled";
                    PlaylistsListLink.CssClass = "nav-link disabled";
                }
            }
        }

        public bool IsAdmin 
        {
            get
            {
                return isAdmin;
            }
            set
            {
                isAdmin = value;

                if (value == true)
                {
                    CreateCategoryLink.Visible = true;
                }
                else
                {
                    CreateCategoryLink.Visible = false;
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            UserNow = LoggedUser;

            if (!Page.IsPostBack)
            {
                if (LoggedUser == null)
                {
                    LoggedIn = false;
                }
                else
                {
                    LoggedIn = true;

                    if (this.LoggedUser.Role == Models.Enums.Roles.Admin)
                    {
                        IsAdmin = true;
                    }
                    else
                    {
                        IsAdmin = false;
                    }
                }
            }
        }

        protected void LogOutLink_Click(object sender, EventArgs e)
        {
            HttpCookie emailCookie = new HttpCookie("email", null);
            HttpCookie passwordCokkie = new HttpCookie("password", null);

            emailCookie.Expires = DateTime.Now.AddYears(1);
            passwordCokkie.Expires = DateTime.Now.AddYears(1);

            Response.SetCookie(emailCookie);
            Response.SetCookie(passwordCokkie);

            Response.Redirect("~/Account/Login.aspx");
        }

        protected void MyPlaylistsLink_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Playlists/MyPlaylists.aspx");
        }

        protected void CreatePlaylistLink_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Playlists/CreatePlaylist.aspx");
        }

        protected void PlaylistsListLink_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Playlists/PlaylistsList.aspx");
        }

        protected void CreateCategoryLink_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/CreateCategory.aspx");
        }

        protected void ProfileLink_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Account/Profile.aspx");
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            Response.Redirect($"~/Playlists/PlaylistsList.aspx?Search={SearchTextBox.Text}");
        }
    }
}