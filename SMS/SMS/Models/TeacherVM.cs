using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SMS.Models
{
    public class TeacherVM:PersonVM
    {
        public int Salary { get; set; }
        public Nullable<int> InchSec { get; set; }
        public string ResetPassword { get; set; }
        public string Name { get; set; }
        public decimal Pay { get; set; }

    }
}