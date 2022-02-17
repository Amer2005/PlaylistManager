using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Models.Enums;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class User
    {
        public User()
        {

        }

        public User(string email, string password, string firstName, string lastName, string imageURL, string facebookURL, string youtubeURL)
        {
            Email = email;
            Password = password;
            FirstName = firstName;
            LastName = lastName;
            ImageURL = imageURL;
            FacebookURL = facebookURL;
            YoutubeURL = YoutubeURL;
        }

        public User(string email, string password, string firstName, string lastName)
        {
            Email = email;
            Password = password;
            FirstName = firstName;
            LastName = lastName;
        }

        [Key]
        public int UserId { get; set; }

        [Required]
        [Display(Name = "Email")]
        public string Email { get; set; }

        [Required]
        [Display(Name = "Password")]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [Required]
        [Display(Name = "First Name")]
        public string FirstName { get; set; }

        [Required]
        [Display(Name = "Last Name")]
        public string LastName { get; set; }

        [Display(Name = "Image URL")]
        [DataType(DataType.ImageUrl)]
        public string ImageURL { get; set; }

        [Display(Name = "Facebook URL")]
        [DataType(DataType.Url)]
        public string FacebookURL { get; set; }

        [Display(Name = "Youtube URL")]
        [DataType(DataType.Url)]
        public string YoutubeURL { get; set; }

        [Display(Name = "Role")]
        public Roles Role { get; set; }

    }
}
