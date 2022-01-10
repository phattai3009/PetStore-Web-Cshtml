using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAn_DinhPhatTai.Common;
using DoAn_DinhPhatTai.Models;
using Model.EF;
using Model.DAO;

namespace DoAn_DinhPhatTai.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        DBPetStoreDataContext db = new DBPetStoreDataContext();
        // GET: User
        [HttpGet]
        public ActionResult DangKy()
        {
            return View();
        }
        [HttpGet]
        public ActionResult DangNhap()
        {
            return View();
        }
        public ActionResult DangXuat()
        {
            Session[CommonConstant.USER_SESSION] = null;
            return Redirect("/");
        }
        [HttpPost]
        public ActionResult DangNhap(LoginModel model)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserDao();
                var result = dao.Login(model.TaiKhoan, Encryptor.MD5Hash(model.MatKhau));
                if (result == 1)
                {
                    //Gán Session
                    var user = dao.GetByID(model.TaiKhoan);
                    var userSession = new UserLogin();
                    userSession.UserName = user.HoTen;
                    userSession.UserID = user.MaKH;

                    Session.Add(CommonConstant.USER_SESSION, userSession);
                    return RedirectToAction("Index", "Home");
                }
                else if (result == 0)
                {
                    ModelState.AddModelError("", "Tài khoản không tồn tại.");
                }
                else if (result == -1)
                {
                    ModelState.AddModelError("", "Tài khoản bị khóa.");
                }
                else if (result == -2)
                {
                    ModelState.AddModelError("", "Mật khẩu không đúng.");
                }
                else
                {
                    ModelState.AddModelError("", "Đăng nhập không đúng.");
                }
            }
            else
            {

            }
            return View(model);
        }
        [HttpPost]
        public ActionResult DangKy(RegisterModel model)
        {
            if (ModelState.IsValid)
            {
                if (db.KhachHangs.Count(x => x.TaiKhoan == model.TaiKhoan) > 0)
                {
                    ModelState.AddModelError("", "Tên đăng nhập đã tồn tại.");
                }
                else
                {
                    var kh = new KhachHang();
                    kh.TaiKhoan = model.TaiKhoan;
                    kh.MatKhau = Encryptor.MD5Hash(model.MatKhau);
                    kh.XacNhanMK = Encryptor.MD5Hash(model.XacNhanMK);
                    kh.HoTen = model.HoTen;
                    kh.Email = model.Email;
                    kh.DiaChi = model.DiaChi;
                    kh.DienThoai = model.DienThoai;
                    kh.GioiTinh = model.GioiTinh;
                    kh.NgaySinh = model.NgaySinh;

                    //Insert data in table KhachHang
                    db.KhachHangs.InsertOnSubmit(kh);
                    db.SubmitChanges();
                    ViewBag.Success = "Đăng ký thành công.";
                    model = new RegisterModel();
                }
            }
            else
            {
                ModelState.AddModelError("", "Đăng ký thất bại.");
            }
            return View(model);
        }

        //[HttpGet]
        //[AllowAnonymous]
        //public ActionResult ForgotPassword()
        //{
        //    return View();
        //}

        //[HttpPost]
        //[AllowAnonymous]
        //public ActionResult ForgotPassword(ForgotPasswordViewModel request)
        //{
        //    if (!ModelState.IsValid)
        //        return View(request);

        //    var token = await _userApiClient.ForgotPassword(request);
        //    var passwordResetLink = Url.Action(nameof(ResetPassword), "Login",
        //                            new { email = request.Email, token = token.ResultObj }, Request.Scheme);

        //    var email = new EmailService.EmailService();
        //    email.Send("hytranluan@gmail.com", request.Email, "Link khôi phục mật khẩu", passwordResetLink);

        //    return View("ForgotPasswordConfirmation");
        //}



    }
}