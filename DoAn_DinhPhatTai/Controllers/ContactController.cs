using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using Model.DAO;

namespace DoAn_DinhPhatTai.Controllers
{
    public class ContactController : Base2Controller
    {
        // GET: Contact
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Index(Feedback model)
        {
            if (ModelState.IsValid)
            {
                var dao = new FeedBackDao();

                model.CreateDate = DateTime.Now;
                var result = dao.Insert(model);
                if (result)
                {
                    ViewBag.Success = "Gửi phản hồi thành công!";
                    
                }
                else
                {
                    ModelState.AddModelError("", "Gửi phản hồi không thành công!");
                }
            }
            return View(model);
        }
    }
}