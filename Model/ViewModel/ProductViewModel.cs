using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Model.ViewModel
{
    public class ProductViewModel
    {
        public long ID { set; get; }
        public string Images { set; get; }
        public string Name { set; get; }
        public string CateName { set; get; }
        public string GioiThieu { set; get; }
        public string CateGioiThieu { set; get; }
        public int Quantity { set; get; }
        public decimal Price { set; get; }
        public DateTime? CreatedDate { set; get; }
    }
}