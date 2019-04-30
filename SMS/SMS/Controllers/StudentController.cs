using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SMS.Models;

namespace SMS.Controllers
{
    public class StudentController : Controller
    {
        public ActionResult LoggedInView(int id)
        {
            return View();
        }
        public ActionResult ViewDateSheet(int id)
        {
            DB35Entities db = new DB35Entities();
            List<DatesheetVM> T = new List<DatesheetVM>();
            int cid = db.Students.Where(x => x.Id == id).SingleOrDefault().ClassId;
            
            ViewBag.Class = db.Classes.Where(x => x.ClassId == cid).SingleOrDefault().Name;
            int did = db.DateSheets.Where(x => x.ClassId == cid).SingleOrDefault().DateSheetId;
            foreach(ClassDateSheet f in db.ClassDateSheets.Where(x => x.DateSheetId == did).ToList())
            {
                DatesheetVM d = new DatesheetVM();
                d.CourseId = f.CourseId;
                d.Date = f.Date;
                DayOfWeek g = d.Date.DayOfWeek;
                d.day = g;
                d.EndTime = f.EndTime;
                d.StartTime = f.StartTime;
                d.Title = db.Courses.Where(x => x.CourseId == d.CourseId).SingleOrDefault().Title;
                T.Add(d);

            }

            return View(T);
        }
        // GET: Student
        public ActionResult Index()
        {
            return View();
        }

        // GET: Student/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Student/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Student/Create
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

        // GET: Student/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Student/Edit/5
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

        // GET: Student/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Student/Delete/5
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
    }
}
