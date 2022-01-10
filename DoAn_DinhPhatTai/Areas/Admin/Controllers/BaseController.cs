using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using DoAn_DinhPhatTai.Common;

namespace DoAn_DinhPhatTai.Areas.Admin.Controllers
{
    public class BaseController : Controller
    {
        // GET: Admin/Base
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var session = (AdminLogin)Session[CommonConstant.ADMIN_SESSION];
            if (session == null)
            {
                filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary(new { controller = "Login", action = "Index", Area = "Admin" }));
            }
            base.OnActionExecuting(filterContext);
        }
        protected void SetAlert(string message, AlertType type)
        {
            TempData["AlertMessage"] = message;
            if (type == AlertType.Success)
            {
                TempData["AlertType"] = "alert-success";
            }
            else if (type == AlertType.Warning)
            {
                TempData["AlertType"] = "alert-warrning";
            }
            else if (type == AlertType.Error)
            {
                TempData["AlertType"] = "alert-danger";
            }
        }
        protected enum AlertType
        {
            Success,
            Error,
            Warning,
        }
    }
}