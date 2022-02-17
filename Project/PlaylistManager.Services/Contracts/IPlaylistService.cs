using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PlaylistManager.Services.Contracts
{
    public interface IPlaylistService
    {
        List<Video> GetVideos(Playlist playlist);

        List<Playlist> GetPlaylists();

        Playlist GetPlaylistById(int id);

        List<Playlist> GetPlaylistsByCategoryId(int CategoryId);

        List<Playlist> GetPlaylistsByUser(User user);

        List<Playlist> GetPlaylistsInPage(int page, int pageSize);

        bool CreatePlaylist(string title, string description, int categoryId, User creator, List<string> VideoUrls);

        float GetPlaylistRating(Playlist playlist);

        int GetNumberOfPlaylists();

        int GetNumberOfPlaylists(string search);

        List<Playlist> GetPlaylistsInPage(string search, int page, int pageSize);
    }
}
