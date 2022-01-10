﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Model.ViewModel
{
    public class OrderViewModel
    {
        public long OrderID { set; get; }
        public string CustomerName { set; get; }
        public List<ProductViewModel> Products { set; get; }
        public decimal PriceTotal { set; get; }
        public string Phone { get; set; }
        public DateTime? CreatedDate { set; get; }
        public bool Status { set; get; }
    }
}