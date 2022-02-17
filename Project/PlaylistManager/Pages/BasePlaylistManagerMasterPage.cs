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
    public class BasePlaylistManagerMasterPage : MasterPageBase
    {
        protected User LoggedUser;

        [Inject]
        public IUserService userService { get; set; }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            Page.PreLoad += OnPreLoad;
        }

        protected void OnPreLoad(object sender, EventArgs e)
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