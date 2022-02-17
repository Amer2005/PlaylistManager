using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PlaylistManager.Services.Contracts
{
    public interface ICategoryService
    {
        List<Category> GetCategories();

        bool AddCategory(string name);

        int CountOfPlaylistsWithCategory(Category category);
    }
}
