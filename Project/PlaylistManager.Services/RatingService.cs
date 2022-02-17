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
    public class RatingService : IRatingService
    {
        private IRepository<Rating> ratingRepository;
        private IUnitOfWork unitOfWork;

        public RatingService(IRepository<Rating> ratingRepository, IUnitOfWork unitOfWork)
        {
            this.ratingRepository = ratingRepository;
            this.unitOfWork = unitOfWork;
        }

        public bool GiveReview(int rating, User user, Playlist playlist)
        {
            if(rating < 0 || rating > 5)
            {
                return false;
            }

            if (user == null)
            {
                return false;
            }

            if(playlist == null)
            {
                return false;
            }

            if (!ratingRepository.All().Any(x => x.UserId == user.UserId && x.PlaylistId == playlist.PlaylistId))
            {
                Rating ratingModel = new Rating();

                ratingModel.UserId = user.UserId;
                ratingModel.PlaylistId = playlist.PlaylistId;
                ratingModel.Value = rating;

                ratingRepository.Add(ratingModel);

                unitOfWork.Commit();
            }
            else
            {
                Rating ratingModel = ratingRepository.All().FirstOrDefault(x => x.UserId == user.UserId && x.PlaylistId == playlist.PlaylistId);

                ratingRepository.Delete(ratingModel.RatingId);

                unitOfWork.Commit();

                ratingModel.Value = rating;

                ratingRepository.Add(ratingModel);

                unitOfWork.Commit();
            }


            return true;
        }
    }
}
