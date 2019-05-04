using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace SMS.Models
{
    public class ViewTimeTable
    {
        public int ClassId { get; set; }
        public int ClassName { get; set; }
        public int SectionId { get; set; }
        public string SectionName { get; set; }
        public int CourseId { get; set; }
        public string CourseName { get; set; }
        [DataType(DataType.Time)]
        public TimeSpan Starttime { get; set; }
        [DataType(DataType.Time)]
        public TimeSpan EndTime { get; set; }
        [Display (Name = "DAY")]
        public string day { get; set; }
        [Display(Name = "8:00 to 9:00")]
        public string R8to9 { get; set; }
        [Display(Name = "9:00 to 10:00")]
        public string R9to10 { get; set; }
        [Display(Name = "10:00 to 11:00")]
        public string R10to11 { get; set; }
        [Display(Name = "11:00 to 12:00")]
        public string R11to12 { get; set; }
        [Display(Name = "1:00 to 2:00")]
        public string R1to2 { get; set; }
    }
}