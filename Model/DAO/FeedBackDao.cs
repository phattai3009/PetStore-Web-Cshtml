using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using PagedList;

namespace Model.DAO
{
    public class FeedBackDao
    {
        DBPetStoreDataContext db = null;
        public FeedBackDao()
        {
            db = new DBPetStoreDataContext();
        }

        public int GetQuantityByMonth(int month)
        {
            return db.Feedbacks.Where(x => x.CreateDate.Value.Month == month && x.CreateDate.Value.Year == DateTime.Now.Year).Count();
        }
        public IEnumerable<Feedback> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<Feedback> Entity = db.Feedbacks;

            // Lọc theo trạng thái
            if (searchString == "Đã xem")
            {
                Entity = Entity.Where(x => x.Status == true);
            }
            else if (searchString == "Chưa xem")
            {
                Entity = Entity.Where(x => x.Status == false);
            }
            return Entity.OrderByDescending(x => x.CreateDate).ToPagedList(page, pageSize);
        }

        public Feedback GetByID(long id)
        {
            return db.Feedbacks.SingleOrDefault(x => x.ID == id);
        }

        public bool Insert(Feedback entity)
        {
            try
            {
                db.Feedbacks.InsertOnSubmit(entity);
                db.SubmitChanges();
                return true;
            }
            catch (Exception) { return false; }
        }

        //Thay đổi trạng thái
        public bool ChangeStatus(long id)
        {
            var Entity = db.Feedbacks.SingleOrDefault(x => x.ID == id);
            Entity.Status = !Entity.Status;
            db.SubmitChanges();

            return Entity.Status;
        }
    }
}
