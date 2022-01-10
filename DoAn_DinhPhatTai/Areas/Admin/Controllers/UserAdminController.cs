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
    public class UserAdminController : BaseController
    {
        // GET: Admin/UserAdmin
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            var dao = new AdminDao();
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
        public ActionResult Create(UserAdmin Entity)
        {
            if (ModelState.IsValid)
            {
                var dao = new AdminDao();
                if (dao.GetByUsername(Entity.UserName) != null)
                {
                    SetAlert("Tài khoản này đã tồn tại", AlertType.Error);
                    return View("Create");
                }
                var EnCryptedMd5Pas = Encryptor.MD5Hash(Entity.Password);
                Entity.Password = EnCryptedMd5Pas;
                Entity.CreateBy = ((AdminLogin)Session[CommonConstant.ADMIN_SESSION]).UserName.ToString();  // Người tạo
                Entity.CreateDate = DateTime.Now;  // Thời gian tạo

                if (dao.Insert(Entity))
                {
                    SetAlert("Thêm người dùng thành công!", AlertType.Success);
                    return RedirectToAction("Index", "UserAdmin");
                }
                else
                {
                    SetAlert("Thêm người dùng không thành công!", AlertType.Error);
                }
            }
            return View("Create");
        }


        [HttpGet]
        public ActionResult Edit(int id)
        {
            var dao = new AdminDao().GetById(id);
            return View(dao);
        }

        [HttpPost]
        public ActionResult Edit(UserAdmin Entity)
        {
            if (ModelState.IsValid)
            {
                var dao = new AdminDao();
                var md5hash = Encryptor.MD5Hash(Entity.Password); // Mã hóa mật khẩu
                Entity.Password = md5hash;
                Entity.ModifedBy = ((AdminLogin)Session[CommonConstant.ADMIN_SESSION]).UserName.ToString();  // Người sửa
                Entity.CreateDate = DateTime.Now;  // Thời gian tạo
                var res = dao.Update(Entity);

                if (res)
                {
                    SetAlert("Cập nhật thông tin người dùng thành công!", AlertType.Success);
                    return RedirectToAction("Index", "UserAdmin");
                }
                else
                {
                    SetAlert("Cập nhật thông tin người dùng không thành công!", AlertType.Error);
                }

            }
            return View("Edit");
        }

        public ActionResult Delete(int id)
        {
            var dao = new AdminDao();
            dao.Delete(id);
            SetAlert("Xóa người dùng thành công!", AlertType.Success);
            return RedirectToAction("Index", "UserAdmin");
        }

        [HttpPost]
        public JsonResult ChangeStatus(int id)
        {
            var dao = new AdminDao();
            var res = dao.ChangStatus(id);
            return Json(new
            {
                status = res
            });
        }

    }
}