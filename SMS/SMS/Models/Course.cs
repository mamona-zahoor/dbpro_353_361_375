using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SMS.Models
{
    public class Course
    {
        public int CourseId { get; set; }
        public int TeacherId { get; set; }
        public int SectionId { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
    }
}