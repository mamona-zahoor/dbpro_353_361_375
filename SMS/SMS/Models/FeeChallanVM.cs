using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace SMS.Models
{
    public class FeeChallanVM
    {
        public int FeeChallanId { get; set; }
        public int StudentId { get; set; }
        [Required]
        [DataType(DataType.Currency)]
        public decimal Fee { get; set; }
        public decimal Scholarships { get; set; }
        public decimal Fine { get; set; }
        public decimal TotalFee { get; set; }
        public int Status { get; set; }
        [Required]
        [DataType(DataType.Date)]
        public System.DateTime DueDate { get; set; }
    }
}