using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAn_DinhPhatTai.Common;
using DoAn_DinhPhatTai.Models;
using System.Web.Script.Serialization;
using Model.DAO;
using Model.EF;

namespace DoAn_DinhPhatTai.Controllers
{
    public class CartController : Controller
    {
        // GET: Cart
        public ActionResult Index()
        {
            var cart = Session[CommonConstant.CartSession];
            var list = new List<CartItem>();
            if (cart != null)
            {
                list = (List<CartItem>)cart;
            }
            return View(list);
        }

        public JsonResult DeleteAll()
        {
            Session[CommonConstant.CartSession] = null;
            return Json(new
            {
                status = true
            });
        }

        public JsonResult Delete(long id)
        {
            var sessionCart = (List<CartItem>)Session[CommonConstant.CartSession];
            sessionCart.RemoveAll(x => x.ThuCung.MaTC == id);
            Session[CommonConstant.CartSession] = sessionCart;
            return Json(new
            {
                status = true
            });
        }
        public JsonResult Update(string cartModel)
        {
            var jsonCart = new JavaScriptSerializer().Deserialize<List<CartItem>>(cartModel);
            var sessionCart = (List<CartItem>)Session[CommonConstant.CartSession];

            foreach (var item in sessionCart)
            {
                var jsonItem = jsonCart.SingleOrDefault(x => x.ThuCung.MaTC == item.ThuCung.MaTC);
                if (jsonItem != null)
                {
                    item.Quantity = jsonItem.Quantity;
                }
            }
            Session[CommonConstant.CartSession] = sessionCart;
            return Json(new
            {
                status = true
            });
        }
        public ActionResult AddItem(int productID, int quantity, string strURL)
        {
            var product = new ThuCungDao().GetById(productID);
            var cart = Session[CommonConstant.CartSession];
            if (cart != null)
            {
                var list = (List<CartItem>)cart;
                if (list.Exists(x => x.ThuCung.MaTC == productID))
                {
                    foreach (var item in list)
                    {
                        if (item.ThuCung.MaTC == productID)
                        {
                            item.Quantity += quantity;
                        }
                    }
                }
                else
                {
                    //tao moi doi tuong cart item
                    var item = new CartItem();
                    item.ThuCung = product;
                    item.Quantity = quantity;
                    list.Add(item);
                }
                //Gan vao Session
                Session[CommonConstant.CartSession] = list;
            }
            else
            {
                //tao moi doi tuong cart item
                var item = new CartItem();
                item.ThuCung = product;
                item.Quantity = quantity;
                var list = new List<CartItem>();
                list.Add(item);
                // Gan vao session
                Session[CommonConstant.CartSession] = list;
            }
            return Redirect(strURL);
        }
        public ActionResult Sucess()
        {
            return View();
        }
        public ActionResult Error(string email)
        {
            return View();
        }

        [HttpGet]
        public ActionResult Payment()
        {
            var cart = Session[CommonConstant.CartSession];
            var list = new List<CartItem>();
            if (cart != null)
            {
                list = (List<CartItem>)cart;
            }
            return View(list);
        }
        [HttpPost]
        public ActionResult Payment(string shipName, string mobile, string address, string email)
        {
            var productDao = new ThuCungDao();
            var cartt = Session[CommonConstant.CartSession];
            var list = new List<CartItem>();
            if (cartt != null)
            {
                list = (List<CartItem>)cartt;
            }
            var order = new DonHang();
            order.CreatedDate = DateTime.Now;
            order.DiaChi = address;
            order.SoDT = mobile;
            order.NguoiNhan = shipName;
            order.Email = email;

            try
            {
                var id = new OrderDao().Insert(order);
                var cart = (List<CartItem>)Session[CommonConstant.CartSession];
                var detailDao = new OrderDetailDao();
                decimal total = 0;
                foreach (var item in cart)
                {
                    var orderDetail = new ChiTietDonHang();

                    orderDetail.MaTC = item.ThuCung.MaTC;
                    orderDetail.MaDH = id;
                    orderDetail.ThanhTien = item.ThuCung.GiaBan;
                    orderDetail.SoLuong = item.Quantity;
                    detailDao.Insert(orderDetail);
                    total += (item.ThuCung.GiaBan * item.Quantity);

                    var email1 = new Common.EmailService();
                    email1.Send("zeedijkdinh@gmail.com", "zeedijkdinh@gmail.com",
                        "ĐƠN HÀNG MỚI", $"Mã đơn hàng là <strong>{id}</strong>, nhấn vào <a href='" + "https://localhost:44334/Admin/Order/Index" + "'>đây</a> để đến trang quản lý đơn hàng này.");
                    
                    var templateHtml =
                        "<h1>PetStore - Shop Thú Cưng Phát Tài</h1>" + "<br>"
                        + $"<h2>Cảm ơn quý khách đã đặt thú cưng bên chúng tôi. Chúng tôi sẽ duyệt đơn và giao hàng sớm nhất có thể cho quý khách"
                        + "<br>"
                        + $"Mã đơn là {id}"
                        + "<br>"
                        + "<h3>Danh sách thú cưng đã đặt</h3>"
                        + "<br>";

                    var orderSummaryHtml = 
                        "<table border='1' style='border-collapse:collapse'>"
                        + "<thead>"
                            + "<tr>"
                                + "<th>Tên Thú Cưng</th>"
                                + "<th>Đơn giá</th>"
                                + "<th>Số lượng mua</th>"
                            + "</tr>"
                        + "</thead>"
                        + "<tbody>"
                            + "<tr>"
                                + "<td>" + item.ThuCung.TenTC + "</td>"
                                + "<td>" + item.ThuCung.GiaBan.ToString("N0") + " <span>&#8363;</span>" + "</td>"
                                + "<td>" + item.Quantity
                            + "</tr>"
                        + "</tbody>"
                        +"<tfoot>"
                        + "<tr>"
                        + "<td><strong>Tổng giá đơn hàng</strong></td>"
                        + $"<td><strong> {total:N0} <span> &#8363;</span></strong></td>"
                        + "</tr>"
                        + "</tfoot>"
                        + "</table>";



                    var email2 = new Common.EmailService();
                    email2.Send("zeedijkdinh@gmail.com", email,
                                    "PETSTORE - ĐẶT HÀNG THÀNH CÔNG",
                                    templateHtml
                                    + orderSummaryHtml
                                    );
                }
                list.Clear();

            }
            catch (Exception ex)
            {
                return Redirect("/loi-thanh-toan");
            }
            return Redirect("/hoan-thanh");
        }

    }
}