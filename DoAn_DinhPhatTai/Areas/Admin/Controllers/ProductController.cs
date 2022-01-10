using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.DAO;
using Model.EF;

namespace DoAn_DinhPhatTai.Areas.Admin.Controllers
{
    public class ProductController : BaseController
    {
        // GET: Admin/Product
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            var dao = new ThuCungDao();
            var result = dao.ListAllPaging(searchString, page, pageSize);
            ViewBag.searchString = searchString;
            return View(result);
        }

        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(ThuCung Entity)
        {
            if (ModelState.IsValid)
            {
                Entity.NgayCapNhat = DateTime.Now;  // Thời gian tạo
                var dao = new ThuCungDao();
                if (dao.Insert(Entity))
                {
                    SetAlert("Thêm mới sản phẩm thành công!", AlertType.Success);
                    return RedirectToAction("Index");
                }
                else
                {
                    SetAlert("Thêm mới sản phẩm không thành công!", AlertType.Error);
                }
            }
            return View();
        }

        [HttpGet]
        public ActionResult Edit(int maTC)
        {
            var dao = new ThuCungDao();
            var result = dao.GetByID(maTC);

            if (result != null)
            {
                return View(result);
            }
            else return Redirect("/404/Index.html");
        }

        [HttpPost]
        public ActionResult Edit(ThuCung Entity)
        {
            if (ModelState.IsValid)
            {
                Entity.NgayCapNhat = DateTime.Now;  // Thời gian tạo
                var dao = new ThuCungDao();
                if (dao.Update(Entity))
                {
                    SetAlert("Cập nhật sản phẩm thành công!", AlertType.Success);
                    return RedirectToAction("Index");
                }
                else
                {
                    SetAlert("Cập nhật sản phẩm không thành công!", AlertType.Error);
                }
            }

            return View();
        }

        public ActionResult Delete(int maTC)
        {
            var dao = new ThuCungDao();
            if (dao.Delete(maTC))
            {
                SetAlert("Xóa sản phẩm thành công!", AlertType.Success);
                return RedirectToAction("Index");
            }
            else
            {
                return Redirect("/404/Index.html");
            }
        }

        // Thay đổi trạng thái
        [HttpPost]
        public JsonResult ChangeStatus(int maTC)
        {
            var result = new ThuCungDao().ChangeStatus(maTC);
            return Json(new
            {
                status = result
            });
        }
    }
}