using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PlaylistManager.Services.Contracts
{
    public interface IUserService
    {
        bool RegisterUser(string email, string password, string firstName, string lastName, string imageURL, string FacebookURL, string youtubeURL);

        bool UpdateUser(User loggedUser, string email, string firstName, string lastName, string imageURL, string FacebookURL, string youtubeURL);

        bool LoginUser(string email, string password);

        User GetUser(string email, string password);
    }
}
