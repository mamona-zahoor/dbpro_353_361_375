using SMS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using System.Data.SqlClient;
using System.ComponentModel.DataAnnotations;
namespace SMS.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        public ActionResult Index()
        {
            return View();
        }

        // GET: Admin/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Admin/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        public JsonResult LoadClasses()
        {
            DB35Entities db = new DB35Entities();
            List<Class> t = db.Classes.ToList();
            return Json(t.Select(x => new
            {
                Id = x.ClassId,
                Name = x.Name
            }));
        }

        public JsonResult LoadSections(int Item)
        {
            DB35Entities db = new DB35Entities();
            List<ClassSection> t = db.ClassSections.Where(b => b.ClassId == Item).ToList();
          
            return Json(t.Select(x => new
            {
                ID = x.SectionId,
                Name = db.Sections.Where(b => b.SectionId == x.SectionId).SingleOrDefault().Name 
            }));
        }

       

            public ActionResult AddTimetable()
        {
            return View();
        }
        private void MsgBox(string sMessage)
        {
            string msg = "<script language=\"javascript\">";
            msg += "alert('" + sMessage + "');";
            msg += "</script>";
            Response.Write(msg);
        }


        public JsonResult Loaddtcourses(int item)
        {
            List<Cours> C = new List<Cours>();
            DB35Entities db = new DB35Entities();
            List<ClassSection> Class = db.ClassSections.Where(x => x.ClassId == item).ToList();

            List<Cours> Course = db.Courses.ToList();
          
            
            foreach (ClassSection c in Class)
            {

                foreach (Cours ci in db.Courses)
                {
                    if (c.SectionId == ci.SectionId )
                    {
                        Cours cs = new Cours();
                        cs.CourseId = ci.CourseId;

                        cs.Title = ci.Title;
                      
                        C.Add(cs);
                       
                       
                    }
                }
            }
            
            return Json(C.Select(x => new
            {
                ID = x.CourseId,
                Name = x.Title

            }));
        }

        public JsonResult LoadTeacher()
        {
            DB35Entities db = new DB35Entities();
            List<Teacher> teacher = db.Teachers.ToList();
            return Json(teacher.Select(x => new
            {
                Id = x.Id,
                Name = x.Person.FirstName+' '+x.Person.LastName
            }));

            }
        

        public ActionResult AllCourses()
        {
            DB35Entities db = new DB35Entities();
            List<Cours> C = db.Courses.ToList();
            List<Course> CO = new List<Course>();

            foreach (Cours cs in db.Courses)
            {
                Course CP = new Course();

                CP.SectionName = db.Sections.Where(x => x.SectionId == cs.SectionId).SingleOrDefault().Name;
                CP.ClassId = db.ClassSections.Where(x => x.SectionId == cs.SectionId).SingleOrDefault().ClassId;
                CP.TeacherName = db.People.Where(x => x.Id == cs.TeacherId).SingleOrDefault().FirstName + ' ' + db.People.Where(x => x.Id == cs.TeacherId).SingleOrDefault().LastName;
                CP.ClassName = db.Classes.Where(x => x.ClassId == CP.ClassId).SingleOrDefault().Name;
                CP.SectionId = cs.SectionId;
                CP.TeacherId = cs.TeacherId;
                CP.Title = cs.Title;
                CP.Description = cs.Description;
                CP.CourseId = cs.CourseId;
                CO.Add(CP);
            }

            return View(CO);
        }
        public ActionResult AllCourse()
        {
            DB35Entities db = new DB35Entities();
             return View(db.Courses.ToList());
        }
        public ActionResult AddCourse()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AddCourse(Course obj)
        {
            DB35Entities db = new DB35Entities();
            Cours cs = new Cours();
            Course CN = new Course();
          
            cs.TeacherId = obj.TeacherId;
            cs.Title = obj.Title;
            cs.SectionId = obj.SectionId;
            cs.Description = obj.Description;
            db.Courses.Add(cs);
            obj.sectionName(obj.SectionId);
            obj.teacherName(obj.TeacherId);
            obj.className(obj.ClassId);
            
            
            
            
            db.SaveChanges();
            return View();
        }

        public ActionResult AddDatesheet()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AddDatesheet(DatesheetVM t)
        {
            bool check = true;
            DB35Entities db = new DB35Entities();
            ClassDateSheet cd = new ClassDateSheet();
            DateSheet dt = new DateSheet();
            foreach (DateSheet d in db.DateSheets)
            {
                
                if(d.ClassId == t.ClassId)
                {
                    cd.DateSheetId = d.DateSheetId;
                    check = false;
                    break;
                }
            }
            if(check == true)
            {
                dt.ClassId = t.ClassId;
                db.DateSheets.Add(dt);
                cd.DateSheetId = dt.DateSheetId;
                db.SaveChanges();
            }
            cd.CourseId = t.CourseId;
            cd.EndTime =  t.EndTime;
            cd.StartTime = t.StartTime;
            cd.Date = t.Date;
            db.ClassDateSheets.Add(cd);
            db.SaveChanges();
            return View();
        }



        public JsonResult LoadCourses(int item)
        {
            DB35Entities db = new DB35Entities();
            List<Cours> Course = db.Courses.Where(b => b.SectionId == item).ToList();
            return Json(Course.Select(x => new
            {
                ID = x.CourseId,
                Name = x.Title

            }));
        }

        [HttpPost]
        public ActionResult AddTimetable(TimeTableVM t)
        {
            DB35Entities db = new DB35Entities();
            Timetable tt = new Timetable();
            bool check = true;
            SectionTimetable u = new SectionTimetable();
            foreach(Timetable y in db.Timetables)
            {
                if(y.SectionId == t.SectionId)
                {
                    u.TimetableId = y.TimetableId;
                    check = false;
                    break;
                }
            }
          
            if(check == true)
            {
                tt.SectionId = t.SectionId;
                db.Timetables.Add(tt);
                db.SaveChanges();
                u.TimetableId = tt.TimetableId;
            }
            u.Day = t.Day;
            u.TimeStart = t.StartTime;
            u.TimeEnd = t.EndTime;
            u.CourseId = t.CourseId;
            db.SectionTimetables.Add(u);
            db.SaveChanges();
            return View();
           
        }

        // GET: Admin/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Admin/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Admin/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Admin/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }


        public ActionResult Section(int id)
        {
            List<Section> slist = new List<Section>();
            DB35Entities db = new DB35Entities();
            int i = 0;
            using (db)
            {
                var cs = (db.ClassSections.Where(m => m.ClassId == id).ToList());
                foreach (Section sec in db.Sections)
                {
                    if (i < cs.Count)
                    {
                        if (sec.SectionId == cs[i].SectionId)
                        {
                            slist.Add(sec);
                            i++;
                        }
                    }
                }

            }
            return View(slist);
        }

        public ActionResult CreateSection(int id)
        {
            DB35Entities db = new DB35Entities();
            List<string> TNames = new List<string>();
            List<int> Ids = new List<int>();
            foreach (Teacher t in db.Teachers)
            {
                if (t.InchSec == null)
                {
                    foreach (Person p in db.People)
                    {
                        if (p.Id == t.Id)
                        {
                            Ids.Add(p.Id);
                            TNames.Add(p.FirstName + ' ' + p.LastName);
                            break;
                        }
                    }
                }
            }
            ViewBag.Teachers = TNames;
            ViewBag.Ids = Ids;
            return View();
        }
        [HttpPost]
        public ActionResult CreateSection(SectionVM obj, int id, int TeacherNames)
        {
            DB35Entities db = new DB35Entities();
            Section sec = new Models.Section();
            sec.Name = obj.Name;
            sec.TeacherId = TeacherNames;
            sec.NumOfStudents = 0;
            db.Sections.Add(sec);
            db.SaveChanges();
            ClassSection cs = new ClassSection();
            cs.ClassId = id;
            foreach (Section s in db.Sections)
            {
                if (s.TeacherId == TeacherNames)
                {
                    cs.SectionId = s.SectionId;
                    db.Teachers.Find(TeacherNames).InchSec = id;
                    break;
                }
            }
            db.ClassSections.Add(cs);
            //added section
            db.SaveChanges();
            return RedirectToAction("CreateSection");
        }
        public ActionResult CreateClass()
        {
            return View();
        }



        public ActionResult Class(string Name)
        {

            DB35Entities db = new DB35Entities();
            var c = db.Classes.ToList();
            using (db)
            {
                if (Name != null)
                {

                    foreach (Class cl in db.Classes)
                    {
                        if (cl.Name == (Name))
                        {
                            c = db.Classes.Where(x => (x.ClassId) == cl.ClassId || Name == null).ToList();
                            break;
                        }

                        c = db.Classes.Where(x => (x.ClassId) == 0 || Name == null).ToList();

                    }
                }
                return View(c);

            }
        }

        [HttpPost]
        public ActionResult CreateClass(School_Class c)
        {
            if (ModelState.IsValid)
            {
                DB35Entities db = new DB35Entities();
                Class cl = new Models.Class();
                cl.CreatedOn = DateTime.Now;
                cl.Name = c.Name;
                int number = c.NumberOfSections;
                db.Classes.Add(cl);
                db.SaveChanges();

            }
            return RedirectToAction("CreateClass");
        }
        public ActionResult EditClass(int id)
        {
            DB35Entities db = new DB35Entities();
            School_Class c = new School_Class();
            foreach (Class cl in db.Classes)
            {
                if (cl.ClassId == id)
                {
                    c.Name = cl.Name;
                    break;
                }

            }
            return View(c);

        }
        [HttpPost]
        public ActionResult EditClass(int id, School_Class obj)
        {
            DB35Entities db = new DB35Entities();
            db.Classes.Find(id).Name = obj.Name;
            db.Classes.Find(id).CreatedOn = DateTime.Now;
            db.SaveChanges();
         return RedirectToAction("Class");

        }
       // [HttpGet]
        public ActionResult EditCourse(int id)
        {
            DB35Entities db = new DB35Entities();
            Course cs = new Course();
            foreach (Cours C in db.Courses)
            {
                if (C.CourseId == id)
                {
                   // cs.ClassName = db.Classes.Where(x => x.Sect == cs.ClassId).SingleOrDefault().Name;
                     cs.ClassId = db.ClassSections.Where(x => x.SectionId == C.SectionId).SingleOrDefault().ClassId;
                    cs.ClassName = db.Classes.Where(x => x.ClassId == cs.ClassId).SingleOrDefault().Name;
                    cs.SectionName = db.Sections.Where(x => x.SectionId == C.SectionId).SingleOrDefault().Name;
                    //cs.SectionId = db
                   // cs.TeacherName = db.People.Where(x => x.Id == cs.TeacherId).SingleOrDefault().FirstName + ' ' + db.People.Where(x => x.Id == cs.TeacherId).SingleOrDefault().LastName;
                    cs.Title = C.Title;
                    cs.Description = C.Description;
                }
            }
            return View(cs);
        }
        [HttpPost]
        public ActionResult EditCourse(int id , Course CS)
        {
            DB35Entities db = new DB35Entities();
            //id = 9;
            db.Courses.Find(id).Title = CS.Title;
            db.Courses.Find(id).Description = CS.Description;
            db.Courses.Find(id).SectionId = CS.SectionId;
            db.Courses.Find(id).TeacherId = CS.TeacherId;
            

            db.SaveChanges();
            return RedirectToAction("AllCourses");
        }
        public ActionResult DeleteCourse(int id)
        {
            DB35Entities db = new DB35Entities();
            foreach(Cours C in db.Courses)
            {
                if(C.CourseId == id)
                {
                    db.Courses.Remove(C);
                    break;
                }
            }
            db.SaveChanges();
            return RedirectToAction("AllCourses");
        }


        public ActionResult DeleteClass(int id)
        {
            DB35Entities db = new DB35Entities();
            foreach (Class cl in db.Classes)
            {
                if (cl.ClassId == id)
                {
                    db.Classes.Remove(cl);
                    break;

                }
            }
            db.SaveChanges();

            return RedirectToAction("Class");


        }
    }
    }
