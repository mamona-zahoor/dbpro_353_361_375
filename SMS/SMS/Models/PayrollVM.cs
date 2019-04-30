using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace SMS.Models
{
    public class PayrollVM
    {
        public int PayrollId { get; set; }
        public int TeacherId { get; set; }

        public decimal Salary { get; set; }
        public decimal Bonus { get; set; }
        public decimal Deductions { get; set; }
        public decimal Payable { get; set; }
        public int Status { get; set; }
        [DataType(DataType.Date)]
        public DateTime Date { get; set; }

    }
}