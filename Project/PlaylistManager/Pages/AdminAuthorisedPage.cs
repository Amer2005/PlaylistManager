using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PlaylistManager.Pages
{
    public class AdminAuthorisedPage : BasePlaylistManagerPage
    {
        protected void Page_PreLoad(object sender, EventArgs e)
        {
            base.Page_PreLoad(sender, e);

            if (LoggedUser == null)
            {
                Response.Redirect("~/Account/Login.aspx");
            }
            if (LoggedUser.Role != Models.Enums.Roles.Admin)
            {
                Response.Redirect("~/Account/Login.aspx");
            }
        }
    }
}