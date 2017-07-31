using ShopEnMart.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShopEnMart.Data;
using System.Data.SqlClient;
using System.Data;
using ShopEnMart.Filters;
namespace ShopEnMart.Controllers
{
    [FrontPageActionFilter]
    public class SearchController : Controller
    {
        #region Other Class references ...         
        // Instance on Unit of Work         
        public GenericUnitOfWork _unitOfWork = new GenericUnitOfWork();
        private int _memberId;
        public int memberId
        {
            get { return Convert.ToInt32(Session["MemberId"]); }
            set { _memberId = Convert.ToInt32(Session["MemberId"]); }
        }
        #endregion  
        /// <summary>
        /// Search Result Page
        /// </summary>
        /// <param name="searchKey"></param>
        /// <returns></returns>
        public ActionResult Index(string searchKey = "")
        {
            ViewBag.searchKey = searchKey; List<Search_Result> sr = _unitOfWork.GetRepositoryInstance<Search_Result>().GetResultBySqlProcedure("Search @searchKey", new SqlParameter("searchKey", SqlDbType.VarChar) { Value = searchKey }).ToList();
            return View(sr);
        }

        /// <summary>
        /// Product Detail
        /// </summary>
        /// <param name="pId"></param>
        /// <returns></returns>
        public ActionResult ProductDetail(int pId)
        {
            Product pd = _unitOfWork.GetRepositoryInstance<Product>().GetFirstOrDefault(pId);
            ViewBag.SimilarProducts = _unitOfWork.GetRepositoryInstance<Product>().GetListByParameter(i => i.CategoryId == pd.CategoryId).ToList();
            return View(pd);
        }
        
    }
}