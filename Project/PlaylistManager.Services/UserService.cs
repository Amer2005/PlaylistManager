using Data.Contracts;
using Models;
using PlaylistManager.Services.Contracts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace PlaylistManager.Services
{
    public class UserService : IUserService
    {
        private IRepository<User> userRepository;
        private IUnitOfWork unitOfWork;

        public UserService(IRepository<User> userRepository, IUnitOfWork unitOfWork)
        {
            this.userRepository = userRepository;
            this.unitOfWork = unitOfWork;
        }

        public User GetUser(string email, string password)
        {
            if (email == "")
            {
                return null;
            }
            if (password == "")
            {
                return null;
            }

            password = HashText(password);

            User user = userRepository.All().FirstOrDefault(u => u.Email == email && u.Password == password);

            return user;
        }

        public bool LoginUser(string email, string password)
        {
            if (email == "")
            {
                return false;
            }
            if(password == "")
            {
                return false;
            }

            password = HashText(password);

            User user = userRepository.All().FirstOrDefault(u => u.Email == email && u.Password == password);

            if(user == null)
            {
                return false;
            }

            return true;
        }

        public bool RegisterUser(string email, string password, string firstName, string lastName, string imageURL, string facebookURL, string youtubeURL)
        {
            if (email == "")
            {
                return false;
            }

            if (password == "")
            {
                return false;
            }

            if (firstName == "")
            {
                return false;
            }

            if (lastName == "")
            {
                return false;
            }

            password = HashText(password);

            User newUser = new User(email, password, firstName, lastName);

            newUser.Role = Models.Enums.Roles.User;

            if(imageURL != "")
            {
                newUser.ImageURL = imageURL;
            }

            if (facebookURL != "")
            {
                newUser.FacebookURL = facebookURL;
            }

            if(youtubeURL != "")
            {
                newUser.YoutubeURL = youtubeURL;
            }

            if(userRepository.All().FirstOrDefault(x => x.Email == newUser.Email) != null)
            {
                return false;
            }

            userRepository.Add(newUser);

            unitOfWork.Commit();

            return true;
        }

        public bool UpdateUser(User loggedUser, string email, string firstName, string lastName, string imageURL, string facebookURL, string youtubeURL)
        {
            if (email == "")
            {
                return false;
            }
            if (firstName == "")
            {
                return false;
            }

            if (lastName == "")
            {
                return false;
            }

            User user = userRepository.GetById(loggedUser.UserId);

            user.ImageURL = imageURL;

            user.FacebookURL = facebookURL;

            user.YoutubeURL = youtubeURL;

            userRepository.Update(user);

            unitOfWork.Commit();

            return true;
        }

        private string HashText(string text)
        {
            HashAlgorithm hasher = new SHA1CryptoServiceProvider();
            byte[] textWithSaltBytes = Encoding.UTF8.GetBytes(string.Concat(text, "BruhMoment"));
            byte[] hashedBytes = hasher.ComputeHash(textWithSaltBytes);
            hasher.Clear();
            return Convert.ToBase64String(hashedBytes);
        }
    }
}
