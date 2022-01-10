using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.DAO;
using Model.EF;

namespace DoAn_DinhPhatTai.Areas.Admin.Controllers
{
    public class ProductCategory2Controller : BaseController
    {
        // GET: Admin/ProductCategory2
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            var dao = new ProductCategoryDao();
            var result = dao.ListAllPagingGiong(searchString, page, pageSize);
            ViewBag.searchString = searchString;
            return View(result);
        }

        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(Giong Entity)
        {
            if (ModelState.IsValid)
            {
                var dao = new ProductCategoryDao();
                if (dao.InsertGiong(Entity))
                {
                    SetAlert("Thêm mới danh mục sản phẩm thành công!", AlertType.Success);
                    return RedirectToAction("Index");
                }
                else
                {
                    SetAlert("Thêm mới danh mục sản phẩm không thành công!", AlertType.Error);
                }
            }
            return View();
        }

        [HttpGet]
        public ActionResult Edit(int maGiong)
        {
            var dao = new ProductCategoryDao();
            var result = dao.GetByIDGiong(maGiong);

            if (result != null)
            {
                return View(result);
            }
            else return Redirect("/404/Index.html");
        }

        [HttpPost]
        public ActionResult Edit(Giong Entity)
        {
            if (ModelState.IsValid)
            {
                var dao = new ProductCategoryDao();
                if (dao.UpdateGiong(Entity))
                {
                    SetAlert("Cập nhật danh mục sản phẩm thành công!", AlertType.Success);
                    return RedirectToAction("Index");
                }
                else
                {
                    SetAlert("Cập nhật danh mục sản phẩm không thành công!", AlertType.Error);
                }
            }
            return View();
        }

        public ActionResult Delete(int maGiong)
        {
            var dao = new ProductCategoryDao();
            if (dao.DeleteGiong(maGiong))
            {
                SetAlert("Xóa danh mục sản phẩm thành công!", AlertType.Success);
                return RedirectToAction("Index");
            }
            else
            {
                return Redirect("/404/Index.html");
            }
        }

    }
}