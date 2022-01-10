using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using PagedList;

namespace Model.DAO
{
    public class AdminDao
    {
        DBPetStoreDataContext db = null;

        public object Encryptor { get; private set; }

        public AdminDao()
        {
            db = new DBPetStoreDataContext();
        }
        public bool Insert(UserAdmin enity)
        {
            try
            {
                db.UserAdmins.InsertOnSubmit(enity);
                db.SubmitChanges();
                return true;
            }
            catch (Exception) { return false; }
        }

        public UserAdmin GetById(int id)
        {
            return db.UserAdmins.SingleOrDefault(x => x.ID == id);
        }

        public UserAdmin GetByUsername(string username)
        {
            return db.UserAdmins.SingleOrDefault(x => x.UserName == username);
        }
        public bool Update(UserAdmin entity)
        {
            try
            {
                UserAdmin admin = db.UserAdmins.SingleOrDefault(x => x.ID == entity.ID);
                admin.ID = entity.ID;
                admin.UserName = entity.UserName;
                if (!string.IsNullOrEmpty(entity.Password))
                {
                    admin.Password = entity.Password;
                }
                admin.Name = entity.Name;
                admin.Address = entity.Address;
                admin.Email = entity.Email;
                admin.Phone = entity.Phone;
                admin.ModifedBy = entity.ModifedBy;
                admin.Status = entity.Status;
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        public IEnumerable<UserAdmin> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<UserAdmin> model = db.UserAdmins;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.UserName.Contains(searchString) || x.Name.Contains(searchString));
            }

            return model.OrderByDescending(x => x.CreateDate).ToPagedList(page, pageSize);
        }
        public UserAdmin ViewDetail(int id)
        {
            return db.UserAdmins.SingleOrDefault(x => x.ID == id);
        }
        public UserAdmin GetByID(string userName)
        {
            return db.UserAdmins.SingleOrDefault(x => x.UserName == userName);
        }
        public int Login(string userName, string passWord)
        {
            var result = db.UserAdmins.SingleOrDefault(x => x.UserName == userName);
            if (result == null)
            {
                return 0;
            }
            else
            {
                if (result.Status == false)
                    return -1;
                else
                {
                    if (result.Password == passWord)
                        return 1;
                    else
                        return -2;
                }
            }

        }
        public bool Delete(int id)
        {
            var admin = from dlt in db.UserAdmins
                        where dlt.ID == id
                        select dlt;
            foreach (var dlt in admin)
            {
                db.UserAdmins.DeleteOnSubmit(dlt);
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

        public bool ChangStatus(int id)
        {
            var Entity = db.UserAdmins.SingleOrDefault(x => x.ID == id);
            Entity.Status = !Entity.Status;
            db.SubmitChanges();

            return (bool)Entity.Status;
        }
    }
}