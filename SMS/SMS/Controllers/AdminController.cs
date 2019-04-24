using SMS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using System.Data.SqlClient;

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
            //List<Section> f = new List<Section>();
            //Section g = new Section();
            //foreach (ClassSection s in t)
            //{
            //    g.SectionId = s.SectionId;
            //    g.Name = db.Sections.Where(b => b.SectionId == g.SectionId).SingleOrDefault().Name;

            //    f.Add(g);
            //}

            // List<Section> tr = db.Sections.Where(x => x.SectionId = db.ClassSections.Where(g => g.SectionId== )
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
        public ActionResult CreateClass()
        {
            return View();
        }
        public ActionResult Class(string Name)
        {
            DB35Entities db = new DB35Entities();
            using (db)
            {
                return View(db.Classes.Where(x => x.Name.Contains(Name) || Name == null).ToList());

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
