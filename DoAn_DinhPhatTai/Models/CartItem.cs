using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Model.EF;

namespace DoAn_DinhPhatTai.Models
{
    public class CartItem
    {
        public ThuCung ThuCung { get; set; }
        public int Quantity { get; set; }
    }
}