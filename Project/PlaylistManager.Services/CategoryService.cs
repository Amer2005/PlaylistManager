using Data.Contracts;
using Models;
using PlaylistManager.Services.Contracts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PlaylistManager.Services
{
    public class CategoryService : ICategoryService
    {
        private IRepository<Playlist> playlistRepository;
        private IRepository<Category> categoryRepository;
        private IUnitOfWork unitOfWork;

        public CategoryService(IRepository<Playlist> playlistRepository, IRepository<Category> categoryRepository, IUnitOfWork unitOfWork)
        {
            this.playlistRepository = playlistRepository;
            this.categoryRepository = categoryRepository;
            this.unitOfWork = unitOfWork;
        }

        public bool AddCategory(string name)
        {
            if(string.IsNullOrWhiteSpace(name))
            {
                return false;
            }

            var newCategory = new Category(name);

            if(categoryRepository.All().FirstOrDefault(x => x.Name == name) != null)
            {
                return false;
            }

            categoryRepository.Add(newCategory);

            unitOfWork.Commit();

            return true;
        }

        public int CountOfPlaylistsWithCategory(Category category)
        {
            return playlistRepository.All().Where(x => x.CategoryId == category.CategoryId).Count();
        }

        public List<Category> GetCategories()
        {
            return categoryRepository.All().ToList();
        }
    }
}
