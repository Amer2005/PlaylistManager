using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class Rating
    {
        [Key]
        public int RatingId { get; set; }

        public int UserId { get; set; }

        public int PlaylistId { get; set; }

        [Required]
        [Display(Name = "Value")]
        public int Value { get; set; }
    }
}
