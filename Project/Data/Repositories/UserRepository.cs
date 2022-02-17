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
    public class UserRepository : IRepository<User>
    {
        private IPlaylistDBContext context;
        private IDbSet<User> DbSet { get; set; }

        public UserRepository(IPlaylistDBContext context)
        {
            if (context == null)
            {
                throw new ArgumentException("An instance of DbContext is required to use this repository.", "context");
            }

            this.context = context;
            this.DbSet = context.Users;
        }



        public void Add(User user)
        {
            DbEntityEntry entry = this.context.Entry(user);
            if (entry.State != EntityState.Detached)
            {
                entry.State = EntityState.Added;
            }
            else
            {
                this.DbSet.Add(user);
            }
        }

        public IQueryable<User> All()
        {
            return this.DbSet.AsQueryable();
        }

        public void Delete(int id)
        {
            var entity = this.GetById(id);

            if(entity != null)
            {
                this.Delete(entity);
            }
        }

        public virtual void Delete(User entity)
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

        public void Detach(User entity)
        {
            DbEntityEntry entry = this.context.Entry(entity);

            entry.State = EntityState.Detached;
        }

        public void Dispose()
        {
            this.context.Dispose();
        }

        public User GetById(int id)
        {
            return DbSet.Find(id);
        }

        public void Update(User entity)
        {
            this.context.Entry(entity).State = EntityState.Modified;
        }
    }
}
