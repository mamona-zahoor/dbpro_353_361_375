using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SMS.Models
{
    public class ResultVM
    {
        public int ResultId { get; set; }
        public int SectionId { get; set; }
        public int CourseId { get; set; }
        public string Title { get; set; }
        public decimal TotalMarks { get; set; }
        
    }
}