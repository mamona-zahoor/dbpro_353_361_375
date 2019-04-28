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
            foreach (Cours t in db.Courses)
            {
                if (t.TeacherId == id)
                {
                    CNames.Add(t.Title);
                    sec.Add(db.Sections.First(s => s.SectionId == t.SectionId));
                   cid =(db.ClassSections.First(c => c.SectionId == t.SectionId).ClassId);
                    ClassNames.Add(db.Classes.First(c => c.ClassId == cid).Name);
                }
            }
            ViewBag.ClassNames = ClassNames;
            ViewBag.CNames = CNames;
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
            return View();
        }
    }
}
