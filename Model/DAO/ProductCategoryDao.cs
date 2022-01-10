using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PagedList;
using Model.EF;

namespace Model.DAO
{
    public class ProductCategoryDao
    {
        DBPetStoreDataContext db = null;
        public ProductCategoryDao()
        {
            db = new DBPetStoreDataContext();
        }

        //Tìm theo id
        public Loai GetByID(int maLoai)
        {
            return db.Loais.SingleOrDefault(x => x.MaLoai == maLoai);
        }

        //Get danh sách danh mục có phân trang
        public IEnumerable<Loai> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<Loai> Entity = db.Loais;
            if (!string.IsNullOrEmpty(searchString))
            {
                Entity = Entity.Where(x => x.TenLoai.Contains(searchString));
            }
            return Entity.OrderBy(x => x.MaLoai).ToPagedList(page, pageSize);
        }

        //Thêm mới
        public bool Insert(Loai Entity)
        {
            try
            {
                db.Loais.InsertOnSubmit(Entity);
                db.SubmitChanges();
                return true;
            }
            catch (Exception) { return false; }
        }

        //Cập nhật
        public bool Update(Loai NewEntity)
        {
            try
            {
                var Entity = db.Loais.SingleOrDefault(x=>x.MaLoai == NewEntity.MaLoai);

                //Cập nhật
                Entity.MaLoai = NewEntity.MaLoai;
                Entity.TenLoai = NewEntity.TenLoai;
                db.SubmitChanges(); //Lưu

                return true;

            }
            catch (Exception) { return false; }
        }
        //Xóa
        public bool Delete(int maLoai)
        {
            try
            {
                var Entity = db.Loais.SingleOrDefault(x => x.MaLoai == maLoai);
                db.Loais.DeleteOnSubmit(Entity);
                db.SubmitChanges();

                return true;
            }
            catch (Exception) { return false; }
        }


        //////Giống
        public Giong GetByIDGiong(int maGiong)
        {
            return db.Giongs.SingleOrDefault(x => x.MaGiong == maGiong);
        }

        //Get danh sách danh mục có phân trang
        public IEnumerable<Giong> ListAllPagingGiong(string searchString, int page, int pageSize)
        {
            IQueryable<Giong> Entity = db.Giongs;
            if (!string.IsNullOrEmpty(searchString))
            {
                Entity = Entity.Where(x => x.TenGiong.Contains(searchString));
            }
            return Entity.OrderBy(x => x.MaGiong).ToPagedList(page, pageSize);
        }

        //Thêm mới
        public bool InsertGiong(Giong Entity)
        {
            try
            {
                db.Giongs.InsertOnSubmit(Entity);
                db.SubmitChanges();
                return true;
            }
            catch (Exception) { return false; }
        }

        //Cập nhật
        public bool UpdateGiong(Giong NewEntity)
        {
            try
            {
                var Entity = db.Giongs.SingleOrDefault(x => x.MaGiong == NewEntity.MaGiong);

                //Cập nhật
                Entity.MaLoai = NewEntity.MaLoai;
                Entity.MaGiong = NewEntity.MaGiong;
                Entity.TenGiong = NewEntity.TenGiong;
                Entity.MoTa = NewEntity.MoTa;
                db.SubmitChanges(); //Lưu

                return true;

            }
            catch (Exception) { return false; }
        }
        //Xóa
        public bool DeleteGiong(int maGiong)
        {
            try
            {
                var Entity = db.Giongs.SingleOrDefault(x => x.MaGiong == maGiong);
                db.Giongs.DeleteOnSubmit(Entity);
                db.SubmitChanges();

                return true;
            }
            catch (Exception) { return false; }
        }

    }
}
