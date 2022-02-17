using Data.Contracts;
using Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Repositories
{
    public class RatingRepository : IRepository<Rating>
    {
        private IPlaylistDBContext context;
        private IDbSet<Rating> DbSet { get; set; }

        public RatingRepository(IPlaylistDBContext context)
        {
            if (context == null)
            {
                throw new ArgumentException("An instance of DbContext is required to use this repository.", "context");
            }

            this.context = context;
            this.DbSet = context.Ratings;
        }

        public void Add(Rating entity)
        {
            DbEntityEntry entry = this.context.Entry(entity);
            if (entry.State != EntityState.Detached)
            {
                entry.State = EntityState.Added;
            }
            else
            {
                this.DbSet.Add(entity);
            }
        }

        public IQueryable<Rating> All()
        {
            return this.DbSet.AsQueryable();
        }

        public void Delete(int id)
        {
            var entity = this.GetById(id);

            if (entity != null)
            {
                this.Delete(entity);
            }
        }

        public void Delete(Rating entity)
        {
            DbEntityEntry entry = this.context.Entry(entity);
            if (entry.State != EntityState.Deleted)
            {
                entry.State = EntityState.Deleted;
            }
            else
            {
                this.DbSet.Attach(entity);
                this.DbSet.Remove(entity);
            }
        }

        public void Detach(Rating entity)
        {
            DbEntityEntry entry = this.context.Entry(entity);

            entry.State = EntityState.Detached;
        }

        public void Dispose()
        {
            this.context.Dispose();
        }

        public Rating GetById(int id)
        {
            return DbSet.Find(id);
        }

        public void Update(Rating entity)
        {
            this.context.Entry(entity).State = EntityState.Modified;
        }
    }
}
