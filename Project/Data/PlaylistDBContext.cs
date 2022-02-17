using Data.Contracts;
using Microsoft.AspNet.Identity.EntityFramework;
using Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data
{
    public class PlaylistDBContext : DbContext, IPlaylistDBContext
    {
        public PlaylistDBContext() : base("PlaylistConnection")
        {

        }

        public IDbSet<User> Users { get; set; }

        public IDbSet<Playlist> PlayLists { get; set; }

        public IDbSet<Video> Videos { get; set; }

        public IDbSet<Category> Categories { get; set; }

        public IDbSet<Rating> Ratings { get; set; }
    }
}
