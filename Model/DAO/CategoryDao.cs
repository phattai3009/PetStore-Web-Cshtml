using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PagedList;
using Model.EF;

namespace Model.DAO
{
    public class CategoryDao
    {
        DBPetStoreDataContext db = null;
        public CategoryDao()
        {
            db = new DBPetStoreDataContext();
        }
        public List<Loai> ListLoaiAll()
        {
            return db.Loais.ToList();
        }

        public List<Loai> ListLoaiLimit()
        {
            return db.Loais.Take(10).ToList();
        }
        public List<Giong> ListGiongAll()
        {
            return db.Giongs.ToList();
        }
        public List<Giong> ListGiongLimit()
        {
            return db.Giongs.Take(10).ToList();
        }


        public Loai GetByIdLoai(int id)
        {
            return db.Loais.SingleOrDefault(x => x.MaLoai == id);
        }

        public Giong GetByIdGiong(int id)
        {
            return db.Giongs.SingleOrDefault(x => x.MaGiong == id);
        }
        public IEnumerable<Loai> ListLoaiAllPaging(int page, int pageSize)
        {
            return db.Loais.OrderBy(x => x.MaLoai).ToPagedList(page, pageSize);
        }

        public IEnumerable<Giong> ListGiongAllPaging(int page, int pageSize)
        {
            return db.Giongs.OrderBy(x => x.MaGiong).ToPagedList(page, pageSize);
        }
        public List<string> ListLoaiName(string keyword)
        {
            return db.Loais.Where(x => x.TenLoai.Contains(keyword)).Select(x => x.TenLoai).ToList();
        }

        public List<string> ListGiongName(string keyword)
        {
            return db.Giongs.Where(x => x.TenGiong.Contains(keyword)).Select(x => x.TenGiong).ToList();
        }
        public int InsertLoai(Loai enity)
        {
            db.Loais.InsertOnSubmit(enity);
            db.SubmitChanges();
            return enity.MaLoai;
        }

        public int InsertGiong(Giong enity)
        {
            db.Giongs.InsertOnSubmit(enity);
            db.SubmitChanges();
            return enity.MaGiong;
        }

        public bool UpdateLoai(Loai entity)
        {
            try
            {
                Loai loai = db.Loais.SingleOrDefault(x => x.MaLoai == entity.MaLoai);
                loai.MaLoai = entity.MaLoai;
                loai.TenLoai = entity.TenLoai;

                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool UpdateGiong(Giong entity)
        {
            try
            {
                Giong giong = db.Giongs.SingleOrDefault(x => x.MaGiong == entity.MaGiong);
                giong.MaLoai = entity.MaLoai;
                giong.MaGiong = entity.MaGiong;
                giong.TenGiong = entity.TenGiong;
                giong.MoTa = entity.MoTa;

                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool DeleteLoai(int id)
        {
            var loai = from dlt in db.Loais
                        where dlt.MaLoai == id
                        select dlt;
            foreach (var dlt in loai)
            {
                db.Loais.DeleteOnSubmit(dlt);
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

        public bool DeleteGiong(int id)
        {
            var giong = from dlt in db.Giongs
                       where dlt.MaGiong == id
                       select dlt;
            foreach (var dlt in giong)
            {
                db.Giongs.DeleteOnSubmit(dlt);
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
    }

}