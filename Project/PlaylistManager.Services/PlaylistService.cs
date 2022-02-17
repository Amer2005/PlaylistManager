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
    public class PlaylistService : IPlaylistService
    {
        private IRepository<Rating> ratingRepository;
        private IRepository<Category> categoryRepository;
        private IRepository<Video> videoRepository;
        private IUnitOfWork unitOfWork;
        private IRepository<Playlist> playlistRepository;

        public PlaylistService(IRepository<Rating> ratingRepository, IRepository<Category> categoryRepository, IRepository<Video> videoRepository, IUnitOfWork unitOfWork, IRepository<Playlist> playlistRepository)
        {
            this.ratingRepository = ratingRepository;
            this.categoryRepository = categoryRepository;
            this.videoRepository = videoRepository;
            this.unitOfWork = unitOfWork;
            this.playlistRepository = playlistRepository;
        }

        public bool CreatePlaylist(string title, string description, int categoryId, User creator, List<string> VideoUrls)
        {
            if (string.IsNullOrEmpty(title))
            {
                return false;
            }
            if (string.IsNullOrEmpty(description))
            {
                return false;
            }
            if(creator == null)
            {
                return false;
            }

            Playlist playlist = new Playlist();

            Category categoryModel = categoryRepository.GetById(categoryId);

            if(categoryModel == null)
            {
                return false;
            }

            playlist.Title = title;
            playlist.Description = description;
            playlist.Category = categoryModel;
            playlist.Creator = creator;

            playlist.CreationDate = DateTime.UtcNow;

            playlistRepository.Add(playlist);

            unitOfWork.Commit();

            for (int i = 0; i < VideoUrls.Count; i++)
            {
                if(string.IsNullOrWhiteSpace(VideoUrls[i]))
                {
                    continue;
                }

                Video video = new Video();

                video.Playlist = playlist;

                video.PlaylistId = playlist.PlaylistId;

                video.URL = VideoUrls[i];

                videoRepository.Add(video);
            }

            unitOfWork.Commit();

            return true;
        }

        public List<Playlist> GetPlaylistsByCategoryId(int CategoryId)
        {
            return playlistRepository.All().Where(x => x.CategoryId == CategoryId).ToList();
        }

        public Playlist GetPlaylistById(int id)
        {
            return playlistRepository.GetById(id);
        }

        public float GetPlaylistRating(Playlist playlist)
        {
            var ratings = ratingRepository.All().Where(x => x.PlaylistId == playlist.PlaylistId).ToList();

            float ratingSum = 0;

            foreach (var rating in ratings)
            {
                ratingSum += rating.Value;
            }

            float totalRating = ratingSum / (float)ratings.Count;

            return totalRating;
        }

        public List<Playlist> GetPlaylists()
        {
            return playlistRepository.All().ToList<Playlist>();
        }

        public List<Video> GetVideos(Playlist playlist)
        {
            return videoRepository.All().Where(x => playlist.PlaylistId == x.Playlist.PlaylistId).ToList();
        }

        public List<Playlist> GetPlaylistsByUser(User user)
        {
            return playlistRepository.All().Where(x => x.CreatorId == user.UserId).ToList();
        }

        public List<Playlist> GetPlaylistsInPage(int page, int pageSize)
        {
            return playlistRepository.All().OrderBy(x => x.Title).Skip(page * pageSize).Take(pageSize).ToList();
        }

        public int GetNumberOfPlaylists()
        {
            return playlistRepository.All().Count();
        }

        public int GetNumberOfPlaylists(string search)
        {
            return playlistRepository.All().Where(x => x.Title.IndexOf(search) != -1 || x.Description.IndexOf(search) != -1).Count();
        }

        public List<Playlist> GetPlaylistsInPage(string search, int page, int pageSize)
        {
            return playlistRepository.All().Where(x => x.Title.IndexOf(search) != -1 || x.Description.IndexOf(search) != -1).OrderBy(x => x.Title).Skip(page * pageSize).Take(pageSize).ToList();
        }
    }
}
