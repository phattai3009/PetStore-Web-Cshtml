using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Model.EF;
using Model.ViewModel;

namespace Model.DAO
{
    public class OrderDao
    {
        DBPetStoreDataContext db = null;
        public OrderDao()
        {
            db = new DBPetStoreDataContext();
        }
        public int Insert(DonHang order)
        {
            db.DonHangs.InsertOnSubmit(order);
            db.SubmitChanges();
            return order.MaDH;
        }
        public bool Insert2(DonHang enity)
        {
            try
            {
                db.DonHangs.InsertOnSubmit(enity);
                db.SubmitChanges();
                return true;
            }
            catch (Exception) { return false; }
        }

        public int OrderQuantity(int month)
        {
            return db.DonHangs.Where(x => x.CreatedDate.Value.Month == month).Count();
        }
        public IQueryable<OrderViewModel> ListAll()
        {
            var Order = from order in db.DonHangs
                        join orderDetail in db.ChiTietDonHangs on order.MaDH equals orderDetail.MaDH
                        join product in db.ThuCungs on orderDetail.MaTC equals product.MaTC
                        select new
                        {
                            OrderID = order.MaDH,
                            CustomerName = order.NguoiNhan,
                            ProductID = orderDetail.MaTC,
                            Quantity = orderDetail.SoLuong,
                            Price = orderDetail.ThanhTien,
                            Phone = order.SoDT,
                            CreatedDate = order.CreatedDate,
                            Status = order.Status,
                        };

            var Entity = from kq in Order
                         group kq by kq.OrderID into g
                         select new OrderViewModel
                         {
                             OrderID = g.Key,
                             CustomerName = (from gg in g select gg.CustomerName).FirstOrDefault(),
                             Products = (from product in db.ThuCungs join gg in g on product.MaTC equals gg.ProductID select new ProductViewModel { ID = gg.ProductID, Name = product.TenTC, Quantity = gg.Quantity, Price = gg.Price }).ToList(),
                             PriceTotal = g.Sum(x => x.Price),
                             Phone = (from gg in g select gg.Phone).FirstOrDefault(),
                             CreatedDate = (DateTime)(from gg in g select gg.CreatedDate).FirstOrDefault(),
                             Status = (from gg in g select gg.Status).FirstOrDefault(),
                         };
            return Entity;
        }
        public List<OrderViewModel> ListAllPaging(string searchString, ref int totalRecord, int page, int pageSize)
        {
            var Entity = ListAll();
            if (searchString == "Chưa thanh toán")
            {
                Entity = Entity.Where(x => x.Status == false);
            }
            else if (searchString == "Đã thanh toán")
            {
                Entity = Entity.Where(x => x.Status == true);
            }
            totalRecord = Entity.Count();
            return Entity.OrderBy(x => x.OrderID).Skip((page - 1) * pageSize).Take(pageSize).ToList();
        }

        public enum FilterType
        {
            Day, Month, Year, Unpaid, Paid, All
        }

        // Lọc
        public IQueryable<OrderViewModel> Filter(DateTime date, FilterType typeTime, FilterType typePaid)
        {
            var Entity = ListAll();
            if (typeTime == FilterType.Month)
            {
                Entity = Entity.Where(x => x.CreatedDate.Value.Month == date.Month && x.CreatedDate.Value.Year == date.Year);
            }
            else if (typeTime == FilterType.Year)
            {
                Entity = Entity.Where(x => x.CreatedDate.Value.Year == date.Year);
            }

            if (typePaid == FilterType.Paid)
            {
                Entity = Entity.Where(x => x.Status == true);
            }
            else if (typePaid == FilterType.Unpaid)
            {
                Entity = Entity.Where(x => x.Status == false);
            }
            return Entity;
        }


        // Thay đổi trạng thái thanh toán
        public bool ChangeStatus(long id)
        {
            try
            {
                var Entity = db.DonHangs.SingleOrDefault(x=>x.MaDH == id);
                Entity.Status = !Entity.Status; // Thay đổi trạng thái thanh toán
                db.SubmitChanges(); // Lưu thay đổi

                return true;
            }
            catch (Exception) { return false; }
        }
    }
}