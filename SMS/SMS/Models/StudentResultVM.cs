using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SMS.Models
{
    public class StudentResultVM
    {
        public int Id { get; set; }
        public int ResultId { get; set; }
        public int StudentId { get; set; }
        public decimal ObtainedMarks { get; set; }

    }
}