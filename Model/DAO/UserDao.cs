using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Model.EF;
using PagedList;

namespace Model.DAO
{
    public class UserDao
    {
        DBPetStoreDataContext db = null;

        public object Encryptor { get; private set; }

        public UserDao()
        {
            db = new DBPetStoreDataContext();
        }
        public bool Insert(KhachHang enity)
        {
            try
            {
                db.KhachHangs.InsertOnSubmit(enity);
                db.SubmitChanges();
                return true;
            }
            catch (Exception) { return false; }
        }

        public KhachHang GetByID(string userName)
        {
            return db.KhachHangs.SingleOrDefault(x => x.TaiKhoan == userName);
        }

        public KhachHang GetById(int maKH)
        {
            return db.KhachHangs.SingleOrDefault(x => x.MaKH == maKH);
        }
        public int Login(string userName, string passWord)
        {
            var result = db.KhachHangs.SingleOrDefault(x => x.TaiKhoan == userName);
            if (result == null)
            {
                return 0;
            }
            else
            {
                if (result.MatKhau == passWord)
                    return 1;
                else
                    return -2;
            }

        }
        public bool Delete(int id)
        {
            var user = from dlt in db.KhachHangs
                       where dlt.MaKH == id
                       select dlt;
            foreach (var dlt in user)
            {
                db.KhachHangs.DeleteOnSubmit(dlt);
            }
            try
            {
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public IEnumerable<KhachHang> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<KhachHang> Entity = db.KhachHangs;
            if (!string.IsNullOrEmpty(searchString))
            {
                Entity = Entity.Where(x => x.HoTen.Contains(searchString));
            }
            return Entity.OrderBy(x => x.MaKH).ToPagedList(page, pageSize);
        }
        public KhachHang GetByUsername(string username)
        {
            return db.KhachHangs.SingleOrDefault(x => x.TaiKhoan == username);
        }

        public bool Update(KhachHang NewEntity)
        {
            try
            {
                var Entity = db.KhachHangs.SingleOrDefault(x => x.MaKH == NewEntity.MaKH);

                //Cập nhật
                Entity.MaKH = NewEntity.MaKH;
                Entity.HoTen = NewEntity.HoTen;
                Entity.TaiKhoan = NewEntity.TaiKhoan;
                Entity.Email = NewEntity.Email;
                Entity.DiaChi = NewEntity.DiaChi;
                Entity.DienThoai = NewEntity.DienThoai;
                Entity.GioiTinh = NewEntity.GioiTinh;
                Entity.NgaySinh = NewEntity.NgaySinh;
                db.SubmitChanges(); //Lưu

                return true;

            }
            catch (Exception) { return false; }
        }
    }
}