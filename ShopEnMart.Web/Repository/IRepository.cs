using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;

namespace ShopEnMart.Repository
{
    public interface IRepository<TEntity> where TEntity : class
    {
        IEnumerable<TEntity> GetAllRecords();
        IQueryable<TEntity> GetAllRecordsIQueryable();
        IEnumerable<TEntity> GetRecordsToShow(int pageNo, int pageSize, int currentPageNo, Expression<Func<TEntity, bool>> wherePredict, Expression<Func<TEntity, int>> orderByPredict);
        int GetAllRecordsCount();
        void Add(TEntity entity);
        void Update(TEntity entity);
        void UpdateByWhereClause(Expression<Func<TEntity, bool>> wherePredict, Action<TEntity> ForEachPredict);
        TEntity GetFirstOrDefault(int recordId);
        void Remove(TEntity entity);
        void RemoveByWhereClause(Expression<Func<TEntity, bool>> wherePredict);
        void RemoveRangeByWhereClause(Expression<Func<TEntity, bool>> wherePredict);
        void InactiveAndDeleteMarkByWhereClause(Expression<Func<TEntity, bool>> wherePredict, Action<TEntity> ForEachPredict);
        TEntity GetFirstOrDefaultByParameter(Expression<Func<TEntity, bool>> wherePredict);
        IEnumerable<TEntity> GetListByParameter(Expression<Func<TEntity, bool>> wherePredict);
        IEnumerable<TEntity> GetResultBySqlProcedure(string query, params object[] parameters);
    }
}