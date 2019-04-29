using SMS.Models;
using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using System.Data.SqlClient;
using System.ComponentModel.DataAnnotations;

namespace SMS.Controllers
{
    public class TeacherController : Controller
    {
        // GET: Teacher
        public ActionResult Index()
        {
            return View();
        }

        // GET: Teacher/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Teacher/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Teacher/Create
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

        // GET: Teacher/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Teacher/Edit/5
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

        // GET: Teacher/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Teacher/Delete/5
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
        public ActionResult LoggedInView(int id)
        {
            return View();
        }

        public ActionResult TeacherSections(int id)
        {
            int cid = 0;
            List<Section> sec = new List<Section>();
            DB35Entities db = new DB35Entities();
            List<string> CNames = new List<string>();
            List<int> ClassNames = new List<int>();
            List<int> Ids = new List<int>();
            List<int> CIds = new List<int>();
            List<int> CoIds = new List<int>();
            foreach (Result r in db.Results)
            {
                Ids.Add(r.SectionId);
                CIds.Add(r.CourseId);
            }
            foreach (Cours t in db.Courses)
            {
                if (t.TeacherId == id)
                {
                    CNames.Add(t.Title);
                    sec.Add(db.Sections.First(s => s.SectionId == t.SectionId));
                    cid = (db.ClassSections.First(c => c.SectionId == t.SectionId).ClassId);
                    ClassNames.Add(db.Classes.First(c => c.ClassId == cid).Name);
                    CoIds.Add(t.CourseId);
                }
            }
            ViewBag.ClassNames = ClassNames;
            ViewBag.CNames = CNames;
            ViewBag.Marked = Ids;
            ViewBag.Cid = CIds;
            ViewBag.Coid = CoIds;
            return View(sec);
        }

        public ActionResult Result(int id, int Tid)
        {
            int cid = 0;
            DB35Entities db = new DB35Entities();
            foreach (Cours c in db.Courses)
            {
                if (c.TeacherId == Tid && c.SectionId == id)
                {
                    ViewBag.CN = c.Title;
                    break;
                }
            }
            cid = db.ClassSections.First(cs => cs.SectionId == id).ClassId;
            ViewBag.ClassName = db.Classes.First(c => c.ClassId == cid).Name;
            ViewBag.Sec = db.Sections.First(s => s.SectionId == id).Name;
            ViewBag.Cid = db.Courses.First(c => c.TeacherId == Tid && c.SectionId == id).CourseId;
            return View();
        }
        [HttpPost]
        public ActionResult Result(ResultVM r, int Course, int Section)
        {
            DB35Entities db = new DB35Entities();
            Result re = new Models.Result();
            re.CourseId = Course;
            re.SectionId = Section;
            re.Title = r.Title;
            re.TotalMarks = r.TotalMarks;
            db.Results.Add(re);
            db.SaveChanges();
            int t = db.Courses.First(c => c.CourseId == Course && c.SectionId == Section).TeacherId;
            int Rid = db.Results.Max(e => e.ResultId);
            return RedirectToAction("UploadResult", new { id = Rid });
        }

        public ActionResult UploadResult(int id)
        {
            DB35Entities db = new DB35Entities();
            ViewBag.Title = db.Results.First(r => r.ResultId == id).Title;
            int sec = db.Results.First(r => r.ResultId == id).SectionId;
            int c = db.ClassSections.First(r => r.SectionId == sec).ClassId;
            ViewBag.Class = db.Classes.First(cl => cl.ClassId == c).Name;
            ViewBag.Sec = db.Sections.First(s => s.SectionId == sec).Name;
            ViewBag.Total = db.Results.First(t => t.ResultId == id).TotalMarks;
            int co = db.Results.First(f => f.ResultId == id).CourseId;
            ViewBag.co = db.Courses.Find(co).Title;
            List<Student> S = new List<Student>();
            List<string> RegNo = new List<string>();
            List<int> Ids = new List<int>();

            foreach (Student s in db.Students)
            {
                bool pre = true;
                foreach (StudentResult sr in db.StudentResults)
                {
                    if (s.Id == sr.StudentId)
                    {
                        pre = false;
                    }
                }
                if (pre)
                {
                    if (s.SectionId == sec)
                    {
                        S.Add(s);
                        RegNo.Add(s.RegNo);
                        Ids.Add(s.Id);
                    }
                }
            }

            ViewBag.RegNo = RegNo;
            ViewBag.Ids = Ids;
            return View(S);
        }
        [HttpPost]
        public ActionResult UploadResult(int StuRegNo, decimal OMarks, int Id)
        {
            DB35Entities db = new DB35Entities();
            StudentResult sr = new StudentResult();
            sr.StudentId = StuRegNo;
            sr.ResultId = Id;
            sr.ObtainedMarks = OMarks;
            db.StudentResults.Add(sr);
            db.SaveChanges();
            return RedirectToAction("UploadResult", new { id = Id });
        }

    }
}
