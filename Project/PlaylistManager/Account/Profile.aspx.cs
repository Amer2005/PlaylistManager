using Models;
using PlaylistManager.Pages;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PlaylistManager.Account
{
    public partial class Profile : AuthorisedPage
    {
        public User UserNow { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            UserNow = LoggedUser;
        }
    }
}