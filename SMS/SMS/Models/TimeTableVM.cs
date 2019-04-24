using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SMS.Models
{
    public class TimeTableVM
    {

        public string ClassName { get; set; }
        public int ClassId { get; set; }
        public int SectionId { get; set; }
        public string SectionName { get; set; }
        public string CourseName { get; set; }
        public int CourseId { get; set; }
        public TimeSpan StartTime { get; set; }
        public TimeSpan EndTime { get; set; }
    }
}