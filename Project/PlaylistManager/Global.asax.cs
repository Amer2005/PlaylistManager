using Data;
using Data.Contracts;
using Data.Repositories;
using Data.UnitOfWorks;
using Models;
using Ninject;
using Ninject.Web.Common;
using Ninject.Web.Common.WebHost;
using PlaylistManager.Services;
using PlaylistManager.Services.Contracts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace PlaylistManager
{
    public class Global : NinjectHttpApplication
    {
        protected override IKernel CreateKernel()
        {
            IKernel kernel = new StandardKernel();

            kernel.Bind<IUserService>().To<UserService>();
            kernel.Bind<ICategoryService>().To<CategoryService>();
            kernel.Bind<IPlaylistService>().To<PlaylistService>();
            kernel.Bind<IRatingService>().To<RatingService>();

            kernel.Bind<IRepository<User>>().To<UserRepository>();
            kernel.Bind<IRepository<Category>>().To<CategoryRepository>();
            kernel.Bind<IRepository<Playlist>>().To<PlaylistRepository>();
            kernel.Bind<IRepository<Video>>().To<VideoRepository>();
            kernel.Bind<IRepository<Rating>>().To<RatingRepository>();

            kernel.Bind<IPlaylistDBContext>().To<PlaylistDBContext>().InRequestScope();
            kernel.Bind<IUnitOfWork>().To<UnitOfWork>();


            return kernel;
        }

        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            base.Application_Start();
        }
    }
}