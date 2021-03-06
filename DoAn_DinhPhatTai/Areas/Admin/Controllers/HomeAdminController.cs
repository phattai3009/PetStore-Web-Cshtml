using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.DAO;
using Model.ViewModel;
using Model.EF;

namespace DoAn_DinhPhatTai.Areas.Admin.Controllers
{
    public class HomeAdminController : BaseController
    {
        // GET: Admin/HomeAdmin
        DBPetStoreDataContext ketnoi = new DBPetStoreDataContext();
        [HttpGet]
        public ActionResult Index()
        {
            ViewBag.Thang = DateTime.Now.Month;
            ViewBag.Nam = DateTime.Now.Year;
            ViewBag.FilterType = "Tháng";
            ViewBag.SLThanhVien = ketnoi.KhachHangs.Count() + ketnoi.UserAdmins.Count();
            DateTime date = DateTime.Now;
            ListTopProduct(date, StatisticDao.FilterType.Month);
            return View();
        }

        [HttpPost]
        public ActionResult Index(int Thang, int Nam, string FilterType)
        {
            StatisticDao.FilterType type;
            if (FilterType == "Năm")
            {
                Thang = DateTime.Now.Month;
                type = StatisticDao.FilterType.Year;
            }
            else
            {
                type = StatisticDao.FilterType.Month;
            }

            DateTime date = new DateTime(Nam, Thang, DateTime.Now.Day);
            ListTopProduct(date, type);

            ViewBag.FilterType = FilterType;
            ViewBag.Thang = Thang;
            ViewBag.Nam = Nam;
            return View();
        }

        private void ListTopProduct(DateTime date, StatisticDao.FilterType type)
        {
            var statisticDao = new StatisticDao();


            // Data String
            List<decimal> listPrice = statisticDao.GetPrice(date, type);
            string dataString = "data: [";
            string labelString = "labels: [";

            if (type == StatisticDao.FilterType.Year)
            {

                for (int i = 1; i < 13; i++)
                {
                    dataString += listPrice[i - 1] != null ? (listPrice[i - 1].ToString() + ",") : "0,";
                    labelString += "\"Tháng " + i + "\",";
                }
            }
            else if (type == StatisticDao.FilterType.Month)
            {
                int Day = DateTime.DaysInMonth(date.Year, date.Month);
                for (int i = 1; i <= Day; i++)
                {
                    dataString += listPrice[i - 1] != null ? (listPrice[i - 1].ToString() + ",") : "0,";
                    labelString += "\"Ng " + i + "\",";
                }
            }
            dataString += "],";
            labelString += "],";

            List<ProductViewModel> listTopProductByPrice = statisticDao.TopProduct(date, type, StatisticDao.FilterType.Price, 5);
            List<ProductViewModel> listTopProductByQuantity = statisticDao.TopProduct(date, type, StatisticDao.FilterType.Quantity, 5);


            // Tổng doanh thu
            decimal PriceTotalYear = 0;
            decimal PriceTotalMonth = 0;
            List<decimal> listPriceYear = listPrice;
            List<decimal> listPriceMonth = listPrice;

            if (type == StatisticDao.FilterType.Year)
            {
                listPriceYear = statisticDao.GetPrice(date, StatisticDao.FilterType.Year);
            }
            foreach (var item in listPriceYear)
            {
                PriceTotalYear += item;
            }
            if (type == StatisticDao.FilterType.Month)
            {
                listPriceMonth = statisticDao.GetPrice(date, StatisticDao.FilterType.Month);
            }
            foreach (var item in listPriceMonth)
            {
                PriceTotalMonth += item;
            }


            ViewBag.listTopProductByPrice = listTopProductByPrice;
            ViewBag.listTopProductByQuantity = listTopProductByQuantity;
            ViewBag.dataString = dataString;
            ViewBag.labelString = labelString;
            ViewBag.PriceTotalYear = PriceTotalYear.ToString("N0") + "đ";
            ViewBag.PriceTotalMonth = PriceTotalMonth.ToString("N0") + "đ";
            ViewBag.OrderQuantity = new OrderDao().OrderQuantity(date.Month);
        }
    }
}