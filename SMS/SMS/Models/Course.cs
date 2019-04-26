using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace SMS.Models
{
    public class Course
    {
        public static List<Course> C = new List<Course>();
        public int ClassId { get; set; }
        public int ClassName { get; set; }
        public int CourseId { get; set; }
        //    public string CourseName { get; set; }
        public int TeacherId { get; set; }
        public string TeacherName { get; set; }
        public int SectionId { get; set; }
        public string SectionName { get; set; }
        [Display(Name = "Course Name")]
        public string Title { get; set; }
        public string Description { get; set; }


        public void className(int id){
            DB35Entities db = new DB35Entities();
            ClassName = db.Classes.Where(x => x.ClassId == id).SingleOrDefault().Name;
            }
        public void teacherName(int id)
        {
            DB35Entities db = new DB35Entities();
            TeacherName = db.People.Where(x => x.Id == id).SingleOrDefault().FirstName + ' ' + db.People.Where(x => x.Id == id).SingleOrDefault().LastName;
        }
        public void sectionName(int id)
        {
            DB35Entities db = new DB35Entities();
            SectionName = db.Sections.Where(x => x.SectionId == id).SingleOrDefault().Name;
        }
    }
}