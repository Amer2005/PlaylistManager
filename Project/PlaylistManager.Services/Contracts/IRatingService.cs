using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PlaylistManager.Services.Contracts
{
    public interface IRatingService
    {
        bool GiveReview(int rating, User user, Playlist playlist);
    }
}
