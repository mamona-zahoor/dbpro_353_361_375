using System;
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

        public static int a = AdminController.var1;

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
            foreach (SubmittedAssign s in db.SubmittedAssigns)
            {
                if (s.Assignemnt == id)
                {
                    ViewBag.DoneS.Add(s.SubmittedBy);
                }
            }
            return View(a);
        }
        

        public ActionResult SubmitFiles(int id, int Stu)
        {
           
            return View();
        }

        [HttpPost]
        public ActionResult SubmitFiles(HttpPostedFileBase Zip, SubmitFiles obj, string q, int id)
        {
            string path = Path.Combine(Server.MapPath("~/Files"), Path.GetFileName(Zip.FileName));
            Zip.SaveAs(path);
            DB35Entities db = new DB35Entities();
            SubmittedAssign sf = new Models.SubmittedAssign();
            sf.FileName = Zip.FileName;
            sf.Path = path;
            sf.Assignemnt = id;
            sf.Submited_On = DateTime.Now;
            sf.SubmittedBy = Convert.ToInt32(q);
            db.SubmittedAssigns.Add(sf);  
            db.SaveChanges();
            return SubmitFiles(id, Convert.ToInt32(q));
        }



            public void Calculate(int id)
        {
            DB35Entities db = new DB35Entities();

            int secid = db.Students.Where(x => x.Id == id).SingleOrDefault().SectionId;
            Detail(secid);
             
        }

        public ActionResult Detail(int id)
        {
            DB35Entities db = new DB35Entities();
            //ViewBag.Section = db.Sections.Where(x => x.SectionId == id).SingleOrDefault().Name;
            int Id = db.Students.Where(x => x.Id == id).SingleOrDefault().SectionId;
            id = Id;
            int f = db.ClassSections.Where(x => x.SectionId == id).SingleOrDefault().ClassId;

          //  ViewBag.Class = db.Classes.Where(x => x.ClassId == f).SingleOrDefault().Name;

            List<ViewTimeTable> Time = new List<Models.ViewTimeTable>();
            int tid = db.Timetables.Where(x => x.SectionId == id).SingleOrDefault().TimetableId;
            List<SectionTimetable> S = db.SectionTimetables.Where(x => x.TimetableId == tid).ToList();
            foreach (SectionTimetable m in S)
            {
                ViewTimeTable v = new Models.ViewTimeTable();
                int s = m.Id;
                v.day = m.Day;

                Nullable<int> r = db.Lectures.Where(x => x.Id == s).SingleOrDefault().Lecture1;
                if (r == null)
                {
                    v.R8to9 = "";
                }
                else
                {
                    //
                    v.R8to9 = db.Courses.Where(x => x.CourseId == r).SingleOrDefault().Title;

                }
                r = db.Lectures.Where(x => x.Id == s).SingleOrDefault().Lecture2;
                if (r == null)
                {
                    v.R9to10 = "";
                }
                else
                {
                    v.R9to10 = db.Courses.Where(x => x.CourseId == r).SingleOrDefault().Title;
                }
                r = db.Lectures.Where(x => x.Id == s).SingleOrDefault().Lecture3;
                if (r == null)
                {
                    v.R10to11 = "";
                }
                else
                {
                    v.R10to11 = db.Courses.Where(x => x.CourseId == r).SingleOrDefault().Title;
                }
                r = db.Lectures.Where(x => x.Id == s).SingleOrDefault().Lecture4;
                if (r == null)
                {
                    v.R11to12 = "";

                }
                else
                {
                    v.R11to12 = db.Courses.Where(x => x.CourseId == r).SingleOrDefault().Title;
                }
                r = db.Lectures.Where(x => x.Id == s).SingleOrDefault().Lecture5;
                if (r == null)
                {
                    v.R1to2 = "";
                }
                else
                {
                    v.R1to2 = db.Courses.Where(x => x.CourseId == r).SingleOrDefault().Title;
                }

                Time.Add(v);

            }





            return View(Time.OrderBy(x => x.day));
        }

        public ActionResult StudentRequests(string Id)
        {
            DB35Entities db = new DB35Entities();
            var c = db.Suggestions.ToList();
            using (db)
            {
                if (Id != null)
                {

                    foreach (Suggestion cl in db.Suggestions)
                    {
                        if (cl.SuggestionId == Convert.ToInt32(Id))
                        {
                            c = db.Suggestions.Where(x => (x.PersonId) == a || Id == null).ToList();
                            //break;
                        }

                        c = db.Suggestions.Where(x => (x.PersonId) == a || Id == null).ToList();

                    }
                }
                return View(c);

            }
        }


        public ActionResult StudentRequestSubmit()
        {

            return View();
        }

        [HttpPost]
        public ActionResult StudentRequestSubmit(/* int id,*/ SuggestionsVM svm)
        {
            DB35Entities db = new DB35Entities();
            Person p = new Person();
            Student st = new Student();
            Suggestion s = new Suggestion();

            int var = AdminController.var1;

            s.PersonId = var;
            s.Subject = svm.Subject;
            s.Description = svm.Description;
            s.Status = db.LookUps.First(l => l.Value == "Pending").Id;

            db.Suggestions.Add(s);

            db.SaveChanges();

            return RedirectToAction("LoggedInView", "Student", new { id = s.PersonId });
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
