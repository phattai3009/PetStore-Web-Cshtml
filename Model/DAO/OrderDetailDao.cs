using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Model.EF; 

namespace Model.DAO
{
    public class OrderDetailDao
    {
        DBPetStoreDataContext db = null;
        public OrderDetailDao()
        {
            db = new DBPetStoreDataContext();
        }
        public bool Insert(ChiTietDonHang orderDetail)
        {
            try
            {
                db.ChiTietDonHangs.InsertOnSubmit(orderDetail);
                db.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}