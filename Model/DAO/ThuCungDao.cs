using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Model.EF;
using PagedList;

namespace Model.DAO
{
    public class ThuCungDao
    {
        DBPetStoreDataContext db = null;
        public ThuCungDao()
        {
            db = new DBPetStoreDataContext();
        }
        public ThuCung GetById(int id)
        {
            return db.ThuCungs.SingleOrDefault(x => x.MaTC == id);
        }

        public ThuCung GetByID(int maTC)
        {
            return db.ThuCungs.SingleOrDefault(x => x.MaTC == maTC);
        }
        public IEnumerable<ThuCung> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<ThuCung> Entity = db.ThuCungs;
            if (!string.IsNullOrEmpty(searchString))
            {
                Entity = Entity.Where(x => x.TenTC.Contains(searchString));
            }
            return Entity.OrderByDescending(x => x.MaTC).ToPagedList(page, pageSize);
        }
        public List<string> ListName(string keyword)
        {
            return db.ThuCungs.Where(x => x.TenTC.Contains(keyword)).Select(x => x.TenTC).ToList();
        }
        public bool Insert(ThuCung enity)
        {
            try
            {
                db.ThuCungs.InsertOnSubmit(enity);
                db.SubmitChanges();
                return true;
            }
            catch (Exception) { return false; }
        }
        public bool Update(ThuCung entity)
        {
            try
            {
                var tcung = db.ThuCungs.SingleOrDefault(x => x.MaTC == entity.MaTC);
                tcung.MaTC = entity.MaTC;
                tcung.TenTC = entity.TenTC;
                tcung.GiaBan = entity.GiaBan;
                tcung.GioiThieu = entity.GioiThieu;
                tcung.MoTaChiTiet = entity.MoTaChiTiet;
                tcung.AnhBia = entity.AnhBia;
                tcung.SoLuongTon = entity.SoLuongTon;
                tcung.MaGiong = entity.MaGiong;
                tcung.MaLoai = entity.MaLoai;
                tcung.Moi = entity.Moi;
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        public bool Delete(int id)
        {
            var tcung = from dlt in db.ThuCungs
                        where dlt.MaTC == id
                       select dlt;
            foreach (var dlt in tcung)
            {
                db.ThuCungs.DeleteOnSubmit(dlt);
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
        public bool ChangeStatus(int maTC)
        {
            var Entity = db.ThuCungs.SingleOrDefault(x => x.MaTC == maTC);
            Entity.Moi = !Entity.Moi;
            db.SubmitChanges();

            return (bool)Entity.Moi;
        }
    }
}