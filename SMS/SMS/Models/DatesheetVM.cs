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
        [DataType(DataType.Date)]
        public DateTime Date { get; set; }
        [DataType(DataType.Time)]
        public TimeSpan StartTime { get; set; }
        [DataType(DataType.Time)]
        public TimeSpan EndTime { get; set; }
        [Display(Name ="Day")]
        public DayOfWeek day { get; set; }


    }
}