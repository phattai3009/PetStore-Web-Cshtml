using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using Model.EF;
using Model.DAO;

namespace DoAn_DinhPhatTai.Controllers
{
    public class TCController : Controller
    {
        // GET: TC
        DBPetStoreDataContext db = new DBPetStoreDataContext();
        public PartialViewResult ThuCungNew()
        {
            return PartialView(db.ThuCungs.Where(n => n.Moi == true).Take(5).ToList().OrderByDescending(n => n.GiaBan).ToList());
        }
        public PartialViewResult ThuCungNew1()
        {
            return PartialView(db.ThuCungs.Take(4).ToList().OrderByDescending(n => n.NgayCapNhat).ToList());
        }
        public PartialViewResult ThuCungBestSell()
        {
            return PartialView(db.ThuCungs.Take(10).ToList().OrderByDescending(n => n.GiaBan).ToList());
        }
        public ViewResult ChiTietThuCung(int maTC = 0)
        {
            ThuCung thuCung = db.ThuCungs.SingleOrDefault(n => n.MaTC == maTC);
            if (thuCung == null)
            {
                //Return Page Error
                Response.StatusCode = 404;
                return null;
            }
            return View(thuCung);
        }
        public JsonResult ListName(string q)
        {
            var data = new ThuCungDao().ListName(q);
            return Json(new
            {
                data = data,
                status = true
            }, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public ActionResult TimKiem(FormCollection collection, int? page)
        {
            string sTuKhoa = Convert.ToString(collection["txtKeyword"]);
            ViewBag.KeyWord = sTuKhoa;
            List<ThuCung> lstResult = db.ThuCungs.Where(x => x.TenTC.Contains(sTuKhoa)).ToList();

            int pageNumber = (page ?? 1);
            int pageSize = 8;
            if (lstResult.Count == 0)
            {
                ViewBag.Notify = "Không tìm thấy kết quả.";
                return View(db.ThuCungs.OrderBy(x => x.TenTC).ToPagedList(pageNumber, pageSize));
            }
            ViewBag.Notify = "Đã tìm thấy " + lstResult.Count + " kết quả.";
            return View(lstResult.OrderBy(x => x.TenTC).ToPagedList(pageNumber, pageSize));
        }
        [HttpGet]
        public ActionResult TimKiem(int? page, string sTuKhoa)
        {
            //string sTuKhoa = Convert.ToString(f["txtKeyword"]);

            ViewBag.KeyWord = sTuKhoa;
            List<ThuCung> lstResult = db.ThuCungs.Where(x => x.TenTC.Contains(sTuKhoa)).ToList();

            int pageNumber = (page ?? 1);
            int pageSize = 8;
            if (lstResult.Count == 0)
            {
                ViewBag.Notify = "Không tìm thấy kết quả.";
                return View(db.ThuCungs.OrderBy(x => x.TenTC).ToPagedList(pageNumber, pageSize));
            }
            ViewBag.Notify = "Đã tìm thấy " + lstResult.Count + " kết quả.";
            return View(lstResult.OrderBy(x => x.TenTC).ToPagedList(pageNumber, pageSize));
        }
        public ActionResult TatCaThuCung(int? page)
        {
            //Tao bien so san pham tren trang
            int pageSize = 20;
            //Tao bien so trang
            int pageNumber = (page ?? 1);
            return View(db.ThuCungs.OrderBy(n => n.GiaBan).ToPagedList(pageNumber, pageSize));
        }
    }
}