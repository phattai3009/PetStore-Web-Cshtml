using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoAn_DinhPhatTai.Common
{
    [Serializable]
    public class AdminLogin
    {
        public int UserID { set; get; }
        public string UserName { set; get; }
    }
}