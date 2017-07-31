using ShopEnMart.Data;
using System;

namespace ShopEnMart.Repository
{

    public class GenericUnitOfWork : IDisposable
    {
        private ShopEnMartEntities DBEntity = new ShopEnMartEntities();

        public IRepository<EntityType> GetRepositoryInstance<EntityType>() where EntityType : class
        {
            return new GenericRepository<EntityType>(DBEntity);
        }

        public void SaveChanges()
        {
            DBEntity.SaveChanges();
        }


        #region Disposing the Unit of work context ...
        private bool disposed = false;
        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    DBEntity.Dispose();
                }
            }
            this.disposed = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
        #endregion
    }
}