using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.DAO;
using Model.EF;
using DoAn_DinhPhatTai.Common;

namespace DoAn_DinhPhatTai.Areas.Admin.Controllers
{
    public class UserKhachHangController : BaseController
    {
        // GET: Admin/User
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            var dao = new UserDao();
            var result = dao.ListAllPaging(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            return View(result);
        }

        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(KhachHang Entity)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserDao();
                if (dao.GetByUsername(Entity.TaiKhoan) != null)
                {
                    SetAlert("Tài khoản này đã tồn tại", AlertType.Error);
                    return View("Create");
                }
                var EnCryptedMd5Pas = Encryptor.MD5Hash(Entity.MatKhau);
                Entity.MatKhau = EnCryptedMd5Pas;

                if (dao.Insert(Entity))
                {
                    SetAlert("Thêm người dùng thành công!", AlertType.Success);
                    return RedirectToAction("Index", "UserKhachHang");
                }
                else
                {
                    SetAlert("Thêm người dùng không thành công!", AlertType.Error);
                }
            }
            return View("Create");
        }


        [HttpGet]
        public ActionResult Edit(int maKH)
        {
            var dao = new UserDao().GetById(maKH);
            return View(dao);
        }

        [HttpPost]
        public ActionResult Edit(KhachHang Entity)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserDao();
                Entity.MatKhau = Encryptor.MD5Hash(Entity.MatKhau); // Mã hóa mật khẩu

                if (dao.Update(Entity))
                {
                    SetAlert("Cập nhật thông tin người dùng thành công!", AlertType.Success);
                    return RedirectToAction("Index", "UserKhachHang");
                }
                else
                {
                    SetAlert("Cập nhật thông tin người dùng không thành công!", AlertType.Error);
                }

            }
            return View("Edit");
        }

        public ActionResult Delete(int maKH)
        {
            var dao = new UserDao();
            dao.Delete(maKH);
            SetAlert("Xóa người dùng thành công!", AlertType.Success);
            return RedirectToAction("Index", "UserKhachHang");
        }

    }
}