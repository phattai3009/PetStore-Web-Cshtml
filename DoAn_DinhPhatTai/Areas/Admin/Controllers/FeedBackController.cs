using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.DAO;

namespace DoAn_DinhPhatTai.Areas.Admin.Controllers
{
    public class FeedBackController : BaseController
    {
        // GET: Admin/FeedBack
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            var result = new FeedBackDao().ListAllPaging(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            return View(result);
        }

        public ActionResult View(long id)
        {
            var result = new FeedBackDao().GetByID(id);
            if (result != null)
            {
                return View(result);
            }
            return Redirect("/404/Index.html");
        }

        [HttpPost]
        public JsonResult ChangeStatus(long id)
        {
            var result = new FeedBackDao().ChangeStatus(id);
            return Json(new
            {
                status = result
            });
        }
    }
}