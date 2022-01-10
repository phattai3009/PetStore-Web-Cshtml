using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using Model.EF;
using Model.DAO;
using DoAn_DinhPhatTai.Common;

namespace DoAn_DinhPhatTai.Controllers
{
    public class TCCategoryController : Controller
    {
        // GET: TCCategory
        DBPetStoreDataContext db = new DBPetStoreDataContext();

        public PartialViewResult NavigationLoai()
        {
            //Lấy ra chủ đề đầu tiên trong csdl
            int MaLoai = int.Parse(db.Loais.ToList().ElementAt(0).MaLoai.ToString());
            //Tạo 1 viewbag gán sách theo Nhà xuất bản đầu tiên trong csdl
            ViewBag.ThuCungTheoLoai = db.Loais.Where(n => n.MaLoai == MaLoai).ToList();
            return PartialView(new CategoryDao().ListLoaiAll());
        }
        public PartialViewResult NavigationGiong()
        {
            //Lấy ra chủ đề đầu tiên trong csdl
            int MaGiong = int.Parse(db.Giongs.ToList().ElementAt(0).MaGiong.ToString());
            //Tạo 1 viewbag gán sách theo Nhà xuất bản đầu tiên trong csdl
            ViewBag.ThuCungTheoGiong = db.Giongs.Where(n => n.MaGiong == MaGiong).ToList();
            return PartialView(new CategoryDao().ListGiongLimit());
        }
        public ViewResult AllGiongThuCungCategory()
        {
            return View(new CategoryDao().ListGiongAll());
        }
        public ViewResult ShowThuCungTheoLoai(int MaLoai = 0)
        {
            Loai loai = db.Loais.SingleOrDefault(n => n.MaLoai == MaLoai);
            if (loai == null)
            {
                Response.StatusCode = 404;
                return null;
            }

            ViewBag.ThuCungTheoLoai = loai.TenLoai;
            //Hiển thị thú cưng theo loại
            List<ThuCung> lstThuCung = db.ThuCungs.Where(n => n.MaLoai == MaLoai).ToList();
            if (lstThuCung.Count == 0)
            {
                ViewBag.Loai = "Không có sản phẩm thuộc danh mục này";
            }
            //Gán danh sách loại
            ViewBag.lstThuCungTheoLoai = db.ThuCungs.ToList();

            return View(lstThuCung.OrderBy(n => n.GiaBan).ToPagedList(1, 50));
        }
        public ViewResult ShowThuCungTheoGiong(int MaGiong = 0)
        {
            Giong giong = db.Giongs.SingleOrDefault(n => n.MaGiong == MaGiong);
            if (giong == null)
            {
                Response.StatusCode = 404;
                return null;
            }

            ViewBag.ThuCungTheoGiong = giong.TenGiong;
            //Hiển thị thú cưng theo giống
            List<ThuCung> lstThuCung = db.ThuCungs.Where(n => n.MaGiong == MaGiong).ToList();
            if (lstThuCung.Count == 0)
            {
                ViewBag.Giong = "Không có sản phẩm thuộc danh mục này";
            }
            //Gán danh sách giống
            ViewBag.lstThuCungTheoGiong = db.ThuCungs.ToList();

            return View(lstThuCung.OrderBy(n => n.GiaBan).ToPagedList(1, 50));
        }
    }
}