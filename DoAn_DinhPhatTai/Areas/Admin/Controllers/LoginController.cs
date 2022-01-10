using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAn_DinhPhatTai.Areas.Admin.Models;
using Model.DAO;
using DoAn_DinhPhatTai.Common;

namespace DoAn_DinhPhatTai.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        // GET: Admin/Login
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult Login()
        {
            return View("Index");
        }
        [HttpPost]
        public ActionResult Login(LoginModel model)
        {
            if (ModelState.IsValid)
            {
                var dao = new AdminDao();
                var result = dao.Login(model.Username, Encryptor.MD5Hash(model.Password));
                if (result == 0)
                {
                    ModelState.AddModelError("", "Tài khoản không tồn tại!");
                }
                else if (result == 1)
                {
                    var user = dao.GetByID(model.Username);
                    var userSession = new AdminLogin();
                    userSession.UserName = user.UserName;
                    userSession.UserID = user.ID;

                    Session.Add(CommonConstant.ADMIN_SESSION, userSession);
                    return RedirectToAction("Index", "HomeAdmin");
                }
                else if (result == -1)
                {
                    ModelState.AddModelError("", "Tài khoản này đang bị khóa!");
                }
                else if (result == -2)
                {
                    ModelState.AddModelError("", "Sai mật khẩu!");
                }
                else
                {
                    ModelState.AddModelError("", "Đăng nhập không đúng!");
                }
            }
            return View("Index");
        }
        public ActionResult Logout()
        {
            Session[CommonConstant.ADMIN_SESSION] = null;
            return RedirectToAction("Index", "HomeAdmin");
        }
    }
}
