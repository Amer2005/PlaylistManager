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

namespace PlaylistManager.Account
{
    public partial class EditProfile : AuthorisedPage
    {
        [Inject]
        public IUserService UserService { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                EmailTextBox.Text = LoggedUser.Email;

                FirstNameTextBox.Text = LoggedUser.FirstName;

                LastNameTextBox.Text = LoggedUser.LastName;

                FacebookUrlTextBox.Text = LoggedUser.FacebookURL;

                YoutubeUrlTextBox.Text = LoggedUser.YoutubeURL;

                ImageUrlTextBox.Text = LoggedUser.ImageURL;
            }
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            UserService.UpdateUser(LoggedUser, EmailTextBox.Text, FirstNameTextBox.Text, LastNameTextBox.Text, ImageUrlTextBox.Text, FacebookUrlTextBox.Text, YoutubeUrlTextBox.Text);
        }
    }
}