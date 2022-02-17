using Models;
using Ninject;
using Ninject.Web;
using PlaylistManager.Services.Contracts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PlaylistManager.Pages
{
    public class BasePlaylistManagerPage : PageBase
    {
        protected User LoggedUser;

        [Inject]
        public IUserService userService { get; set; }

        protected void Page_PreLoad(object sender, EventArgs e)
        {
            if (Request.Cookies["email"] != null && Request.Cookies["password"] != null)
            {
                string email = Request.Cookies["email"].Value;
                string password = Request.Cookies["password"].Value;

                LoggedUser = userService.GetUser(email, password);
            }
        }
    }
}