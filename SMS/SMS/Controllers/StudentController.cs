﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SMS.Models;
using System.IO;
using System.IO.Compression;

namespace SMS.Controllers
{
    public class StudentController : Controller
    {
        public ActionResult LoggedInView(int id)
        {
            DB35Entities db = new DB35Entities();
            using (db)
            {
                return View(db.People.First(f => f.Id == id));
            }
        }

        public ActionResult StudentFeeChallans(int id)
        {
            DB35Entities db = new DB35Entities();
            ViewBag.SName = db.People.First(d => d.Id == id).FirstName + ' ' + db.People.First(d => d.Id == id).LastName;
            ViewBag.SRegNo = db.Students.First(d => d.Id == id).RegNo;
            List<FeeChallan> pr = new List<FeeChallan>();
            foreach (FeeChallan p in db.FeeChallans)
            {
                if (p.StudentId == id)
                {
                    pr.Add(p);
                }
            }
            return View(pr);

        }
        public ActionResult ViewDateSheet(int id)
        {
            DB35Entities db = new DB35Entities();
            List<DatesheetVM> T = new List<DatesheetVM>();
            int cid = db.Students.Where(x => x.Id == id).SingleOrDefault().ClassId;

            ViewBag.Class = db.Classes.Where(x => x.ClassId == cid).SingleOrDefault().Name;
            int did = db.DateSheets.Where(x => x.ClassId == cid).SingleOrDefault().DateSheetId;
            foreach (ClassDateSheet f in db.ClassDateSheets.Where(x => x.DateSheetId == did).ToList())
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


        public ActionResult UploadedAssign(int id)
        {
            List<Assignment> a = new List<Assignment>();
            DB35Entities db = new DB35Entities();
            int secId = db.Students.Find(id).SectionId;
            foreach (Assignment b in db.Assignments)
            {
                if (b.SectionId == secId)
                {
                    a.Add(b);
                }
            }
            return View(a);
        }

        public ActionResult SubmitFiles(int id, int Stu)
        {
            return View();
        }

        [HttpPost]
        public ActionResult SubmitFiles(HttpPostedFileBase Zip, SubmitFiles obj)
        {
          //  string extractPath = Server.MapPath("~/Files/");
            var stream = new System.IO.MemoryStream();
           // ZipFile.ExtractToDirectory("Files/2016-CS-353.zip", "sbc/");
            return View();
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
