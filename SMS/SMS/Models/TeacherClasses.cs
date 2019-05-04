using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SMS.Models
{
    public class TeacherClasses
    {
        public int TeacherId { get; set; }
        public int SectionId { get; set; }
        public int ClassId { get; set; }
        public int CourseID { get; set; }
        public int ClassName { get; set; }
        public string SecName { get; set; }
        public string CourseName { get; set; }
    }
}