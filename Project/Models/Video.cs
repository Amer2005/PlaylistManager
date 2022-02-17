using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class Video
    {
        [Key]
        public int VideoId { get; set; }

        [Required]
        [Display(Name = "URL")]
        [DataType(DataType.Url)]
        public string URL { get; set; }

        [Required]
        public int PlaylistId { get; set; }

        [Required]
        [ForeignKey("PlaylistId")]
        public Playlist Playlist { get; set; }
    }
}
