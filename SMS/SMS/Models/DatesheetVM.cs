using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace SMS.Models
{
    public class DatesheetVM
    {
        public string ClassName { get; set; }
        public int ClassId { get; set; }
        public int CourseId { get; set; }
        [Display(Name  = "Subject")]
        public string Title { get; set; }
        public DateTime Date { get; set; }
        public TimeSpan StartTime { get; set; }
        public TimeSpan EndTime { get; set; }


    }
}