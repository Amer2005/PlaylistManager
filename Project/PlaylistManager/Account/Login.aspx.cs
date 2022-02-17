using Ninject;
using Ninject.Web;
using PlaylistManager.Services.Contracts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PlaylistManager.Account
{
    public partial class Login : PageBase
    {
        [Inject]
        public IUserService UserService { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            if(UserService.LoginUser(EmailTextBox.Text, PasswordTextBox.Text))
            {
                HttpCookie emailCookie = new HttpCookie("email", EmailTextBox.Text);
                HttpCookie passwordCokkie = new HttpCookie("password", PasswordTextBox.Text);

                emailCookie.Expires = DateTime.Now.AddYears(1);
                passwordCokkie.Expires = DateTime.Now.AddYears(1);

                Response.SetCookie(emailCookie);
                Response.SetCookie(passwordCokkie);

                Response.Redirect("~/Pages/MainPage.aspx");
            }
            else
            {
                WrongInfoLabel.Visible = true;
            }
        }
    }
}