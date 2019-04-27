using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SMS.Models
{
    public class FeeChallanVM
    {
        public int FeeChallanId { get; set; }
        public int StudentId { get; set; }
        public decimal Fee { get; set; }
        public decimal Scholarships { get; set; }
        public decimal Fine { get; set; }
        public decimal TotalFee { get; set; }
        public int Status { get; set; }

    }
}