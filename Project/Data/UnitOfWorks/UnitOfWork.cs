using Data.Contracts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.UnitOfWorks
{
    public class UnitOfWork : IUnitOfWork
    {
        private IPlaylistDBContext context;

        public UnitOfWork(IPlaylistDBContext context)
        {
            if (context == null)
            {
                throw new NullReferenceException("Context cannot be null");
            }

            this.context = context;
        }

        public void Commit()
        {
            this.context.SaveChanges();
        }
    }
}
