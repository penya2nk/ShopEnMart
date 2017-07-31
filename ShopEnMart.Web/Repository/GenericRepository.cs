using ShopEnMart.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;
using System.Web;

namespace ShopEnMart.Repository
{
    // This is used to Isolate the EntityFramework based Data Access Layer from the MVC Controller class
   
    public class GenericRepository<TEntity> : IRepository<TEntity> where TEntity : class
    {
        DbSet<TEntity> _dbSet;
        private ShopEnMartEntities _DBEntity;

        public GenericRepository(ShopEnMartEntities DBEntity)
        {
            _DBEntity = DBEntity;
            _dbSet = _DBEntity.Set<TEntity>();

        }

        public IEnumerable<TEntity> GetAllRecords()
        {
            return _dbSet.ToList();
        }

        public IQueryable<TEntity> GetAllRecordsIQueryable()
        {
            return _dbSet;
        }

        public IEnumerable<TEntity> GetRecordsToShow(int pageNo, int pageSize, int currentPageNo, Expression<Func<TEntity, bool>> wherePredict, Expression<Func<TEntity, int>> orderByPredict)
        {        
            if (wherePredict != null)
                return _dbSet.OrderBy(orderByPredict).Where(wherePredict).ToList();
            else
                return _dbSet.OrderBy(orderByPredict).ToList();
        }

        public int GetAllRecordsCount()
        {
            return _dbSet.Count();
        }

        public void Add(TEntity entity)
        {
            _dbSet.Add(entity);
            _DBEntity.SaveChanges();
        }

        /// <summary>
        /// Updates table entity passed to it
        /// </summary>
        /// <param name="entity"></param>
        public void Update(TEntity entity)
        {
            _dbSet.Attach(entity);
            _DBEntity.Entry(entity).State = EntityState.Modified;
        }

        public void UpdateByWhereClause(Expression<Func<TEntity, bool>> wherePredict, Action<TEntity> forEachPredict)
        {
            _dbSet.Where(wherePredict).ToList().ForEach(forEachPredict);
        }

        public TEntity GetFirstOrDefault(int recordId)
        {
            return _dbSet.Find(recordId);
        }

        public TEntity GetFirstOrDefaultByParameter(Expression<Func<TEntity, bool>> wherePredict)
        {
            return _dbSet.Where(wherePredict).FirstOrDefault();
        }

        public IEnumerable<TEntity> GetListByParameter(Expression<Func<TEntity, bool>> wherePredict)
        {
            return _dbSet.Where(wherePredict).ToList();
        }

        public void Remove(TEntity entity)
        {
            if (_DBEntity.Entry(entity).State == EntityState.Detached)
                _dbSet.Attach(entity);
            _dbSet.Remove(entity);
        }

        public void RemoveByWhereClause(Expression<Func<TEntity, bool>> wherePredict)
        {
            TEntity entity = _dbSet.Where(wherePredict).FirstOrDefault();
            Remove(entity);
        }

        public void RemoveRangeByWhereClause(Expression<Func<TEntity, bool>> wherePredict)
        {
            List<TEntity> entity = _dbSet.Where(wherePredict).ToList();
            foreach (var ent in entity)
            {
                Remove(ent);
            }
        }
        public void DeleteMarkByWhereClause(Expression<Func<TEntity, bool>> wherePredict, Action<TEntity> ForEachPredict)
        {
            _dbSet.Where(wherePredict).ToList().ForEach(ForEachPredict);
            _DBEntity.SaveChanges();
        }

        public void InactiveAndDeleteMarkByWhereClause(Expression<Func<TEntity, bool>> wherePredict, Action<TEntity> ForEachPredict)
        {
            _dbSet.Where(wherePredict).ToList().ForEach(ForEachPredict);
            _DBEntity.SaveChanges();
        }

        /// <summary>
        /// Returns result by where clause in descending order
        /// </summary>
        /// <param name="orderByPredict"></param>
        /// <returns></returns>
        public IQueryable<TEntity> OrderByDescending(Expression<Func<TEntity, int>> orderByPredict)
        {
            if (orderByPredict == null)
            {
                return _dbSet;
            }
            return _dbSet.OrderByDescending(orderByPredict);
        }

        /// <summary>
        /// Executes procedure in database and returns result
        /// </summary>
        /// <param name="query"></param>
        /// <param name="parameters"></param>
        /// <returns></returns>
        public IEnumerable<TEntity> GetResultBySqlProcedure(string query, params object[] parameters)
        {
            if (parameters != null)
                return _DBEntity.Database.SqlQuery<TEntity>(query, parameters).ToList();
            else
                return _DBEntity.Database.SqlQuery<TEntity>(query).ToList();
        }
    }
}