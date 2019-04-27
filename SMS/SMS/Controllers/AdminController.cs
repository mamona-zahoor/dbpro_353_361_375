﻿using SMS.Models;
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

        public ActionResult ViewTimeTable()
        {
            DB35Entities db = new DB35Entities();
            List<ViewTimeTable> Time = new List<ViewTimeTable>();
            List<ClassSection> C = db.ClassSections.ToList();

            foreach(ClassSection c in C)
            {
                ViewTimeTable t = new Models.ViewTimeTable();
                t.ClassId = c.ClassId;
                t.ClassName = db.Classes.Where(x => x.ClassId == c.ClassId).SingleOrDefault().Name;
                t.SectionId = c.SectionId;
                t.SectionName = db.Sections.Where(x => x.SectionId == c.SectionId).SingleOrDefault().Name;
                int ti = db.Timetables.Where(x => x.SectionId == t.SectionId).SingleOrDefault().TimetableId;
                t.CourseId = db.SectionTimetables.Where(x => x.TimetableId == ti).SingleOrDefault().CourseId;
                t.CourseName = db.Courses.Where(x => x.CourseId == t.CourseId).SingleOrDefault().Title;
                t.Starttime = db.SectionTimetables.Where(x => x.TimetableId == ti).SingleOrDefault().TimeStart;
                t.EndTime = db.SectionTimetables.Where(x => x.TimetableId == ti).SingleOrDefault().TimeEnd;
                t.day = db.SectionTimetables.Where(x => x.TimetableId == ti).SingleOrDefault().Day;
                Time.Add(t);
            }
            return View(Time);
        }
       
        public ActionResult Index()
        {
            return View();
        }

        // GET: Admin/Details/5
        public ActionResult Details(int id)
        {
            DB35Entities db = new DB35Entities();
            ViewTimeTable to = new Models.ViewTimeTable();
            int t = db.Timetables.Where(x => x.SectionId == id).SingleOrDefault().TimetableId;
            if(db.SectionTimetables.Where(x => x.TimetableId == t).SingleOrDefault().TimeEnd == DateTime.Parse("9:00 AM").TimeOfDay)
            {
                int cid = db.SectionTimetables.Where(x => x.TimetableId == t).SingleOrDefault().CourseId;
                to.R8to9 = db.Courses.Where(x => x.CourseId == cid).SingleOrDefault().Title;
                to.day = db.SectionTimetables.Where(x => x.CourseId == cid && x.TimetableId == t).SingleOrDefault().Day;
            }
            if (db.SectionTimetables.Where(x => x.TimetableId == t).SingleOrDefault().TimeEnd == DateTime.Parse("10:00 AM").TimeOfDay)
            {
                int cid = db.SectionTimetables.Where(x => x.TimetableId == t).SingleOrDefault().CourseId;
                to.R9to10 = db.Courses.Where(x => x.CourseId == cid).SingleOrDefault().Title;
                to.day = db.SectionTimetables.Where(x => x.CourseId == cid && x.TimetableId == t).SingleOrDefault().Day;
            }
            if (db.SectionTimetables.Where(x => x.TimetableId == t).SingleOrDefault().TimeEnd == DateTime.Parse("11:00 AM").TimeOfDay)
            {
                int cid = db.SectionTimetables.Where(x => x.TimetableId == t).SingleOrDefault().CourseId;
                to.R10to11 = db.Courses.Where(x => x.CourseId == cid).SingleOrDefault().Title;
                to.day = db.SectionTimetables.Where(x => x.CourseId == cid && x.TimetableId == t).SingleOrDefault().Day;
            }
            if (db.SectionTimetables.Where(x => x.TimetableId == t).SingleOrDefault().TimeEnd == DateTime.Parse("12:00 AM").TimeOfDay)
            {
                int cid = db.SectionTimetables.Where(x => x.TimetableId == t).SingleOrDefault().CourseId;
                to.R11to12 = db.Courses.Where(x => x.CourseId == cid).SingleOrDefault().Title;
                to.day = db.SectionTimetables.Where(x => x.CourseId == cid && x.TimetableId == t).SingleOrDefault().Day;
            }
            if (db.SectionTimetables.Where(x => x.TimetableId == t).SingleOrDefault().TimeEnd == DateTime.Parse("2:00 AM").TimeOfDay)
            {
                int cid = db.SectionTimetables.Where(x => x.TimetableId == t).SingleOrDefault().CourseId;
                to.R1to2 = db.Courses.Where(x => x.CourseId == cid).SingleOrDefault().Title;
                to.day = db.SectionTimetables.Where(x => x.CourseId == cid && x.TimetableId == t).SingleOrDefault().Day;
            }





            List<ViewTimeTable> Time = new List<ViewTimeTable>();
            //List<ClassSection> C = db.ClassSections.ToList();

            //foreach (ClassSection c in db.ClassSections.Where(x => x.SectionId == id))
            //{
            //    ViewTimeTable t = new Models.ViewTimeTable();
            //    t.ClassId = c.ClassId;
            //    t.ClassName = db.Classes.Where(x => x.ClassId == c.ClassId).SingleOrDefault().Name;
            //    t.SectionId = c.SectionId;
            //    t.SectionName = db.Sections.Where(x => x.SectionId == c.SectionId).SingleOrDefault().Name;
            //    int ti = db.Timetables.Where(x => x.SectionId == t.SectionId).SingleOrDefault().TimetableId;
            //    t.CourseId = db.SectionTimetables.Where(x => x.TimetableId == ti).SingleOrDefault().CourseId;
            //    t.CourseName = db.Courses.Where(x => x.CourseId == t.CourseId).SingleOrDefault().Title;
            //    t.Starttime = db.SectionTimetables.Where(x => x.TimetableId == ti).SingleOrDefault().TimeStart;
            //    t.EndTime = db.SectionTimetables.Where(x => x.TimetableId == ti).SingleOrDefault().TimeEnd;
            //    t.day = db.SectionTimetables.Where(x => x.TimetableId == ti).SingleOrDefault().Day;
            //    Time.Add(t);
            //}
            Time.Add(to);


            return View(Time);
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


        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(LoginUsers obj)
        {
            string u = "";
            string p = "";
            DB35Entities db = new DB35Entities();
            using (db)
            {
                foreach (Admin a in db.Admins)
                {
                    u = a.UserName;
                    p = a.Password;
                    break;

                }
            }
            if (obj.UserName == u && obj.Password == p)
            {
                return RedirectToAction("Class", "Admin");
            }
            return View();
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


                List<string> TNames = new List<string>();
                List<int> Ids = new List<int>();
                foreach (Teacher t in db.Teachers)
                {
                    if (t.InchSec != null)
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
                int count = 0;
                foreach (ClassSection c in db.ClassSections)
                {
                    if (c.ClassId == id)
                    {
                        count++;
                    }
                }
                ViewBag.NumOfSec = count;
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
                    db.Teachers.Find(TeacherNames).InchSec = s.SectionId;
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
            DB35Entities db = new DB35Entities();
            int count = 0;
            foreach (Class c in db.Classes)
            {
                count++;
            }
            ViewBag.Classes = count;
            return View();
        }



        public ActionResult EditSection(int id)
        {
            DB35Entities db = new DB35Entities();
            SectionVM s = new SectionVM();
            foreach (Section sec in db.Sections)
            {
                if (sec.SectionId == id)
                {
                    db.Teachers.Find(sec.TeacherId).InchSec = null;
                  
                    break;
                }
            }
            db.SaveChanges();
            foreach (Section sec in db.Sections)
            {
                if (sec.SectionId == id)
                {
                    ViewBag.SecName = sec.Name;
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
                }
            }
            return View(s);
        }


        [HttpPost]
        public ActionResult EditSection(int id, SectionVM obj, int TeacherNames)
        {
            DB35Entities db = new DB35Entities();
            db.Sections.Find(id).TeacherId = TeacherNames;
            int ClassId = db.ClassSections.First(cs => cs.SectionId == id).ClassId;
            db.Teachers.Find(TeacherNames).InchSec = id;
            db.SaveChanges();
            return RedirectToAction("Section", "Admin", new { id = ClassId });
        }

        public ActionResult DeleteSection(int id, int ClassId)
        {
            DB35Entities db = new DB35Entities();
            ClassSection cs = new ClassSection();
            foreach (ClassSection c in db.ClassSections)
            {
                if (c.ClassId == ClassId && c.SectionId == id)
                {
                    db.ClassSections.Remove(c);
                 
                    break;
                }
            }
            foreach (Section s in db.Sections)
            {
                if (s.SectionId == id)
                {
                    db.Sections.Remove(s);
                    break;
                }
            }

            foreach (Teacher t in db.Teachers)
            {
                if (t.InchSec == id)
                {
                    int i = t.Id;
                    db.Teachers.Find(i).InchSec = null;
                    break;
                }
            }
            db.SaveChanges();
            return RedirectToAction("Section", "Admin", new { id = ClassId });

        }

        public ActionResult FeeChallans(int id)
        {
            List<FeeChallan> fvm = new List<FeeChallan>();
            DB35Entities db = new DB35Entities();
            fvm.Add(db.FeeChallans.First(f => f.StudentId == id));
            return View(fvm);
        }

        public ActionResult EditFeeChallans(int id, int StudentId)
        {
            DB35Entities db = new DB35Entities();
            ViewBag.RegNo = db.Students.First(s => s.Id == StudentId).RegNo;
            FeeChallanVM fvm = new FeeChallanVM();
            foreach (FeeChallan f in db.FeeChallans)
            {
                if (f.FeeChallanId == id)
                {
                    fvm.StudentId = f.StudentId;
                    fvm.Status = f.Status;
                    fvm.Fee = f.Fee;
                    fvm.Fine = Convert.ToDecimal(f.Fine);
                    fvm.Scholarships = Convert.ToDecimal(f.Scholarships);
                    fvm.TotalFee = f.TotalFee;

                }
            }
            return View(fvm);
        }


        [HttpPost]
        public ActionResult EditFeeChallans(int id, FeeChallanVM obj)
        {
            DB35Entities db = new DB35Entities();
            int StuId = db.FeeChallans.Find(id).StudentId;
            db.FeeChallans.Find(id).Fee = obj.Fee;
            db.FeeChallans.Find(id).Scholarships = obj.Scholarships;
            string s = "Unpaid";
            if (obj.Status == 0)
            {
                s = "Paid";
            }
            db.FeeChallans.Find(id).Status = db.LookUps.First(l => l.Value == s).Id;
            db.FeeChallans.Find(id).Fine = obj.Fine;
            db.FeeChallans.Find(id).TotalFee = (obj.Fee + obj.Fine) - obj.Scholarships;
            db.SaveChanges();
            return RedirectToAction("FeeChallans", "Admin", new { id = StuId });

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
                        if (cl.Name == Convert.ToInt32(Name))
                        {
                            c = db.Classes.Where(x => (x.ClassId) == cl.ClassId || Name == null).ToList();
                            break;
                        }

                        c = db.Classes.Where(x => (x.ClassId) == 0 || Name == null).ToList();

                    }
                }
                int count = 0;
                foreach (Class ci in db.Classes)
                {
                    count++;
                }
                ViewBag.Classes = count;

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


        // -------------------Student Management---------------



        public ActionResult Student(string RegNo)
        {

            DB35Entities db = new DB35Entities();
            var c = db.Students.ToList();
            using (db)
            {
                if (RegNo != null)
                {

                    foreach (Student cl in db.Students)
                    {
                        if (cl.RegNo == RegNo)
                        {
                            c = db.Students.Where(x => (x.Id) == cl.Id || RegNo == null).ToList();
                            break;
                        }

                        c = db.Students.Where(x => (x.Id) == 0 || RegNo == null).ToList();

                    }
                }

                int count = 0;
                foreach (Student s in db.Students)
                {
                    count++;
                }
                ViewBag.Students = count;
                return View(c);

            }
        }

        public ActionResult StudentDetails()
        {
            return View();
        }


        public ActionResult AddStudent()
        {
            return View();
        }

        [HttpPost]
        public ActionResult AddStudent(PersonVM p, decimal Fee)
        {


            DB35Entities db = new DB35Entities();
            Student st = new Student();
            Class cs = new Class();
            Section sec = new Section();
            Person pe = new Person();
            FeeChallan fe = new FeeChallan();
            pe.FirstName = p.FirstName;
            pe.LastName = p.LastName;
            pe.Contact = p.Contact;
            //con.Open();
            //string query = "Select Id From Lookup where Value= 'Male' OR Value = 'Female' ";
            //SqlCommand cmd = new SqlCommand(query, con);
            //var a = cmd.ExecuteNonQuery();
            //con.Close();
            //pe.Id = db.People.Max(u => u.Id);
            pe.Gender = 2;
            pe.DateOfBirth = p.DateOfBirth;
            pe.Address = p.Address;

            db.People.Add(pe);

            p.RegNo = "2-B-38";

            st.Id = p.Id;
            st.RegNo = p.RegNo;

            string clas = (st.RegNo.Split('-'))[0];
            string sectn = (st.RegNo.Split('-'))[1];
            int ce = Convert.ToInt32(clas);

            foreach (Student s in db.Students)
            {

                if (ce == cs.Name)
                {
                    st.ClassId = cs.ClassId;
                }
            }

            foreach (Student s in db.Students)
            {

                if (sectn == sec.Name)
                {
                    st.SectionId = sec.SectionId;
                }
            }

            st.Password = "any";
            st.SecretQuestion = "any";
            st.SecretAnswer = "any";
            st.Fee = Fee;
            db.Students.Add(st);
         
            db.SaveChanges();
            fe.Fee = Fee;
            fe.StudentId = db.Students.Max(u => u.Id);
            fe.TotalFee = Fee;
            fe.Status =  db.LookUps.First(l => l.Value == "Unpaid").Id;
            db.FeeChallans.Add(fe);
            db.SaveChanges();
            return RedirectToAction("AddStudent");

        }

        public ActionResult EditStudent(int id)
        {
            DB35Entities db = new DB35Entities();
            StudentVM st = new StudentVM();
            foreach (Student s in db.Students)
            {
                if (s.Id == st.Id)
                {
                    st.RegNo = s.RegNo;

                    st.Fee = s.Fee;
                    StudentVM stt = new StudentVM();
                    School_Class cs = new School_Class();
                    SectionVM sec = new SectionVM();
                    PersonVM p = new PersonVM();

                    string clas = (st.RegNo.Split('-'))[0];
                    string sectn = (st.RegNo.Split('-'))[1];
                    int ce = Convert.ToInt32(clas);

                    foreach (Student ss in db.Students)
                    {

                        if (ce == cs.Name)
                        {
                            stt.ClassId = cs.ClassId;
                        }
                    }

                    foreach (Student sss in db.Students)
                    {

                        if (sectn == sec.Name)
                        {
                            st.SectionId = sec.SectionId;
                        }
                    }
                    break;
                }
            }
            return View(st);

        }
        [HttpPost]
        public ActionResult EditStudent(int id, Student obj, decimal Fee)
        {
            DB35Entities db = new DB35Entities();
            db.Students.Find(id).RegNo = obj.RegNo;
            db.Students.Find(id).Fee = obj.Fee;
            db.FeeChallans.First(f => f.StudentId == id).Fee = Fee;
            //db.People.Find(id).Address = p.Address;
            //db.People.Find(id).Contact= p.Contact;
            //db.Students.Find(id).SectionId = obj.SectionId;
            db.SaveChanges();
            return RedirectToAction("Student");

        }

        public ActionResult DeleteStudent(int id)
        {
            DB35Entities db = new DB35Entities();
            foreach (Student s in db.Students)
            {
                if (s.Id == id)
                {
                    db.Students.Remove(s);
                    break;

                }
            }
            db.SaveChanges();

            return RedirectToAction("Student");


        }




        //---------------------Manage Teachers--------------



        public ActionResult Teacher(string Id)
        {
            DB35Entities db = new DB35Entities();
            var c = db.Teachers.ToList();
            using (db)
            {
                if (Id != null)
                {

                    foreach (Teacher cl in db.Teachers)
                    {
                        if (cl.Id == Convert.ToInt32(Id))
                        {
                            c = db.Teachers.Where(x => (x.Id) == cl.Id || Id == null).ToList();
                            break;
                        }

                        c = db.Teachers.Where(x => (x.Id) == 0 || Id == null).ToList();

                    }
                }

                int count = 0;
                foreach (Teacher t in db.Teachers)
                {
                    count++;
                }
                ViewBag.Teachers = count;
                return View(c);

            }
        }

        public ActionResult AddTeacher()
        {
            return View();
        }

        [HttpPost]
        public ActionResult AddTeacher(PersonVM p, TeacherVM s)
        {

            DB35Entities db = new DB35Entities();
            Teacher st = new Models.Teacher();
            //Class c = new Class();
            Person pe = new Models.Person();

            pe.FirstName = p.FirstName;
            pe.LastName = p.LastName;
            pe.Contact = p.Contact;
            pe.Gender = 2;
            pe.DateOfBirth = p.DateOfBirth;
            pe.Address = p.Address;
            db.People.Add(pe);

            p.Email = "teacher123@gmail.com";

            st.Id = p.Id;
            st.Email = p.Email;
            st.Salary = s.Salary;
            st.InchSec = s.InchSec;
            st.ResetPassword = null;

            db.Teachers.Add(st);
            db.SaveChanges();

            return RedirectToAction("AddTeacher");
        }

        public ActionResult EditTeacher(int id)
        {
            DB35Entities db = new DB35Entities();
            TeacherVM s = new TeacherVM();
            foreach (Teacher st in db.Teachers)
            {
                if (st.Id == s.Id)
                {
                    st.Email = s.Email;
                    break;
                }

            }
            return View(s);

        }
        [HttpPost]
        public ActionResult EditTeacher(int id, Teacher obj)
        {
            DB35Entities db = new DB35Entities();
            db.Teachers.Find(id).InchSec = obj.InchSec;
            db.Teachers.Find(id).Email = obj.Email;
            db.Teachers.Find(id).Salary = obj.Salary;
            db.Teachers.Find(id).InchSec = obj.InchSec;
            //db.Students.Find(id).SectionId = obj.SectionId;
            db.SaveChanges();
            return RedirectToAction("Teacher");

        }

        public ActionResult DeleteTeacher(int id)
        {
            DB35Entities db = new DB35Entities();
            foreach (Teacher s in db.Teachers)
            {
                if (s.Id == id)
                {
                    db.Teachers.Remove(s);
                    break;

                }
            }
            db.SaveChanges();

            return RedirectToAction("Teacher");


        }


    }
}
