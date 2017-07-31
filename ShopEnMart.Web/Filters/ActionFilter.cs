using ShopEnMart.Controllers;
using ShopEnMart.Data;
using ShopEnMart.Repository;
using System.Linq;
using System.Web.Mvc;

namespace ShopEnMart.Filters
{
    public class FrontPageActionFilter : FilterAttribute, IActionFilter
    {
        public void OnActionExecuting(ActionExecutingContext filterContext)
        {
            dynamic controller;
            string controllerName = filterContext.RequestContext.HttpContext.Request.RawUrl.Split('/')[1].ToLower();
            switch (controllerName)
            {
                case "home":
                    controller = (HomeController)filterContext.Controller;
                    break;
                case "search":
                    controller = (SearchController)filterContext.Controller;
                    break;
                case "account":
                    controller = (AccountController)filterContext.Controller;
                    break;
                case "admin":
                    controller = (AdminController)filterContext.Controller;
                    break;
                case "shopping":
                    controller = (ShoppingController)filterContext.Controller;
                    break;
                default:
                    controller = (HomeController)filterContext.Controller;
                    break;
            }

            GenericUnitOfWork _unitOfWork = controller._unitOfWork;
            filterContext.Controller.ViewBag.CategoryAndSubCategory = _unitOfWork.GetRepositoryInstance<Category>().GetAllRecordsIQueryable().ToList();
        }

        void IActionFilter.OnActionExecuted(ActionExecutedContext filterContext)
        {
            //  throw new System.NotImplementedException();
        }
    }
    
}