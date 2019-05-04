using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SMS.Models
{
    public class UploadAssignment
    {
        public int AssignmentId { get; set; }
        public string Title { get; set; }
        public DateTime Duedate { get; set; }
        public string Desription { get; set; }
      public string filename { get; set; }
        public string Path { get; set; }
        public string Name { get; set; }
        public int SectionId { get; set; }
        public string SectionName { get; set; }
        public int CourseId { get; set; }
        public string CourseName { get; set; }
        public int TeacherId { get; set; }
        public string TeacherName { get; set; }
        public int TotalMarks { get; set; }
        public int ClassId { get; set; }
        public int ClassName { get; set; }
    }
}