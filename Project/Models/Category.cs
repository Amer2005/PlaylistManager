using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class Category
    {
        public Category()
        {

        }

        public Category(string name)
        {
            Name = name;
        }

        [Key]
        public int CategoryId { get; set; }

        [Required]
        [Column(TypeName = "VARCHAR")]
        [StringLength(100)]
        [Display(Name = "Name")]
        [Index(IsUnique = true)]
        public string Name { get; set; }
    }
}
