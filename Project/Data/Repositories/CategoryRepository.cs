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
    public class CategoryRepository : IRepository<Category>
    {
        private IPlaylistDBContext context;
        private IDbSet<Category> DbSet { get; set; }

        public CategoryRepository(IPlaylistDBContext context)
        {
            if (context == null)
            {
                throw new ArgumentException("An instance of DbContext is required to use this repository.", "context");
            }

            this.context = context;
            this.DbSet = context.Categories;
        }

        public void Add(Category entity)
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

        public IQueryable<Category> All()
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

        public void Delete(Category entity)
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

        public void Detach(Category entity)
        {
            DbEntityEntry entry = this.context.Entry(entity);

            entry.State = EntityState.Detached;
        }

        public void Dispose()
        {
            this.context.Dispose();
        }

        public Category GetById(int id)
        {
            return DbSet.Find(id);
        }

        public void Update(Category entity)
        {
            this.context.Entry(entity).State = EntityState.Modified;
        }
    }
}
