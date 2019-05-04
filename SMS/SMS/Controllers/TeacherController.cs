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
using System.Text.RegularExpressions;
using System.IO;

namespace SMS.Controllers
{
    public class TeacherController : Controller
    {
       

        public static int b = AdminController.var2;

        public ActionResult Uploadedassign(int tid, int cid, int secid)
        {
            DB35Entities db = new DB35Entities();
            List<UploadAssignment> a = new List<UploadAssignment>();
            foreach (Assignment at in db.Assignments.Where(x => x.TeacherId == tid && x.CourseId == cid && x.SectionId == secid).ToList())
            {
                UploadAssignment f = new UploadAssignment();
                f.AssignmentId = at.AssignmentId;
                f.TeacherId = tid;
                f.SectionId = secid;
                f.Duedate = at.DueDate;
                f.CourseId = cid;
                f.Title = at.Title;
                f.Desription = at.Description;
                a.Add(f);

            }
            return View(a);
        }
        public FileResult Download(int id, string Title)
        {
            DB35Entities db = new DB35Entities();
            byte[] fileBytes = System.IO.File.ReadAllBytes(db.Assignments.First(x => x.AssignmentId == id).Path);

            string fileName = Title + ".pdf";
            return File(fileBytes, System.Net.Mime.MediaTypeNames.Application.Octet, fileName);
        }
        public ActionResult Uploadassignments(int tid, int cid, int secid)
        {
            return View();

        }


        [HttpPost]
        public ActionResult Uploadassignments(int tid, int cid, int secid, UploadAssignment at, HttpPostedFileBase file)
        {

            DB35Entities db = new DB35Entities();
            Assignment a = new Assignment();
            a.Name = file.FileName;

            a.TotalMarks = at.TotalMarks;
            string path = Path.Combine(Server.MapPath("~/TFiles"), Path.GetFileName(file.FileName));
            file.SaveAs(path);
            a.Path = path;
            at.filename = file.FileName;
            a.TeacherId = tid;
            a.SectionId = secid;
            a.CourseId = cid;
            a.Title = at.Title;
            a.Description = at.Desription;
            a.DueDate = at.Duedate;
            db.Assignments.Add(a);
            db.SaveChanges();

            a.Title = "";
            a.Description = "";
            a.DueDate = DateTime.Now;
            a.TotalMarks = 0;

            return Uploadassignments(tid, cid, secid);



        }
        public ActionResult ViewAll(int id)
        {
            DB35Entities db = new DB35Entities();
            List<TeacherClasses> tc = new List<TeacherClasses>();
            foreach (Cours c in db.Courses.Where(x => x.TeacherId == id).ToList())
            {

                TeacherClasses t = new TeacherClasses();
                t.TeacherId = id;
                t.CourseID = c.CourseId;
                t.CourseName = c.Title;
                t.SectionId = c.SectionId;
                t.SecName = db.Sections.Where(x => x.SectionId == t.SectionId).SingleOrDefault().Name;
                t.ClassId = db.ClassSections.Where(x => x.SectionId == t.SectionId).SingleOrDefault().ClassId;
                t.ClassName = Convert.ToInt32(db.Classes.Where(x => x.ClassId == t.ClassId).SingleOrDefault().Name);
                tc.Add(t);

            }
            return View(tc);
            
        }

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult ViewTimetable(int id)
        {
            List<ViewTimeTable> to = new List<ViewTimeTable>();
            DB35Entities db = new DB35Entities();
            foreach (Ttable t in db.Ttables.Where(x => x.TeacherId == id).ToList())
            {
                foreach (TeacherTimetable tt in db.TeacherTimetables.Where(x => x.TId == t.Id))
                {
                    ViewTimeTable g = new ViewTimeTable();
                    g.day = t.Day;
                    Nullable<int> cid = null;
                    cid = tt.Lecture1;
                    if (cid == null)
                    {
                        g.R8to9 = "";
                    }
                    else
                    {
                        string i = db.Courses.Where(x => x.CourseId == cid).SingleOrDefault().Title;
                        int C = db.ClassSections.Where(x => x.SectionId == tt.Class1).SingleOrDefault().ClassId;
                        int classname = db.Classes.Where(x => x.ClassId == C).SingleOrDefault().Name;
                        string Section = db.Sections.Where(x => x.SectionId == tt.Class1).SingleOrDefault().Name;
                        g.R8to9 = i + "  Class:" + classname + "  Section:" + Section + "  ";
                    }
                    cid = tt.Lecture2;
                    if (cid == null)
                    {
                        g.R9to10 = "";
                    }
                    else
                    {
                        string i = db.Courses.Where(x => x.CourseId == cid).SingleOrDefault().Title;
                        int C = db.ClassSections.Where(x => x.SectionId == tt.Class2).SingleOrDefault().ClassId;
                        int classname = db.Classes.Where(x => x.ClassId == C).SingleOrDefault().Name;
                        string Section = db.Sections.Where(x => x.SectionId == tt.Class2).SingleOrDefault().Name;
                        g.R9to10 = i + "  Class:" + classname + "  Section:" + Section + "  ";
                    }
                    cid = tt.Lecture3;
                    if (cid == null)
                    {
                        g.R10to11 = "";
                    }
                    else
                    {
                        string i = db.Courses.Where(x => x.CourseId == cid).SingleOrDefault().Title;
                        int C = db.ClassSections.Where(x => x.SectionId == tt.Class3).SingleOrDefault().ClassId;
                        int classname = db.Classes.Where(x => x.ClassId == C).SingleOrDefault().Name;
                        string Section = db.Sections.Where(x => x.SectionId == tt.Class3).SingleOrDefault().Name;
                        g.R10to11 = i + "  Class:" + classname + "  Section:" + Section + "  ";
                    }
                    cid = tt.Lecture4;
                    if (cid == null)
                    {
                        g.R11to12 = "";
                    }
                    else
                    {
                        string i = db.Courses.Where(x => x.CourseId == cid).SingleOrDefault().Title;
                        int C = db.ClassSections.Where(x => x.SectionId == tt.Class4).SingleOrDefault().ClassId;
                        int classname = db.Classes.Where(x => x.ClassId == C).SingleOrDefault().Name;
                        string Section = db.Sections.Where(x => x.SectionId == tt.Class4).SingleOrDefault().Name;
                        g.R11to12 = i + Environment.NewLine + "  Class:" + classname + Environment.NewLine + "  Section:" + Section + "  ";
                    }
                    cid = tt.Lecture5;
                    if (cid == null)
                    {
                        g.R1to2 = "";
                    }
                    else
                    {
                        string i = db.Courses.Where(x => x.CourseId == cid).SingleOrDefault().Title;
                        int C = db.ClassSections.Where(x => x.SectionId == tt.Class5).SingleOrDefault().ClassId;
                        int classname = db.Classes.Where(x => x.ClassId == C).SingleOrDefault().Name;
                        string Section = db.Sections.Where(x => x.SectionId == tt.Class5).SingleOrDefault().Name;
                        g.R1to2 = i + "  Class:" + classname + "  Section:" + Section + "  ";
                    }
                    to.Add(g);

                }
            }
            return View(to.OrderBy(x => x.day));
        }




        public ActionResult TeacherRequests(string Id)
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
                            c = db.Suggestions.Where(x => (x.PersonId) == b || Id == null).ToList();
                            //break;
                        }

                        c = db.Suggestions.Where(x => (x.PersonId) == b || Id == null).ToList();

                    }
                }
                return View(c);

            }
        }

        public ActionResult TeacherRequestSubmit()
        {

            return View();
        }

        [HttpPost]
        public ActionResult TeacherRequestSubmit(/* int id,*/ SuggestionsVM svm)
        {
            DB35Entities db = new DB35Entities();
            Person p = new Person();
            Teacher st = new Teacher();
            Suggestion s = new Suggestion();
            int var = AdminController.var2;
            s.PersonId = var;
            s.Subject = svm.Subject;
            s.Description = svm.Description;
            s.Status = db.LookUps.First(l => l.Value == "Pending").Id;

            db.Suggestions.Add(s);

            db.SaveChanges();

            return RedirectToAction("LoggedInView", "Teacher", new { id = s.PersonId });
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
        public JsonResult Students(int Item)
        {
            DB35Entities db = new DB35Entities();
            List<Student> S = db.Students.Where(x => x.SectionId == Item).ToList();
            return Json(S.Select(x => new { Id = x.Id, RegNo = x.RegNo }));
        }
        public ActionResult MarkAttendance()
        {
            return View();
        }
        [HttpPost]
        public ActionResult MarkAttendance(int id,FormCollection C)
        {
            DB35Entities db = new DB35Entities();

            List<int> Indexes = new List<int>();
            for (int i =0; i < C.Count; i++)
            {
                if(C.Keys[i].StartsWith("Check_"))
                {
                    var s = C.Keys[i].Split('_');
                    Indexes.Add(Convert.ToInt32(s[1]));
                }
            }

            var cid = C["ClassId"];
            var sid = C["SectionId"];
            var date = C["date"];
            bool check = true;
            foreach(Attendance a in db.Attendances)
            {
                if(Convert.ToDateTime(date) == a.AttendanceDate)
                {
                    ViewBag.color = "red";
                    ViewBag.Message = "Attandance has already been marked for " + date + " ";
                    ViewBag.Check = false;
                    check = false;
                    break;
                }
                else
                {
                    ViewBag.color = "green";
                    ViewBag.Message = "Marked Successfully";
                    ViewBag.Check = true;
                    
                }
            }
            int d = 0;
            if (check == true)
            {
                Attendance at = new Attendance();
                at.AttendanceDate = Convert.ToDateTime(date);
                at.TeacherId = id;
                at.ClassId = Convert.ToInt32(cid);
                at.SectionId = Convert.ToInt32(sid);

                db.Attendances.Add(at);
                d = at.AttendanceId;
                db.SaveChanges();


                int u = Convert.ToInt32(sid);

                foreach (Student s in db.Students.Where(x => x.SectionId == u).ToList())

                {
                    for (int i = 0; i < Indexes.Count; i++)
                    {
                        StudentAttendance st = new StudentAttendance();
                        if (Indexes[i] == s.Id)
                        {
                            st.Status = db.LookUps.Where(x => x.Value == "Present").Single().Id;
                            st.AttendanceId = db.Attendances.Max(x => x.AttendanceId);
                            st.StudentId = s.Id;
                            db.StudentAttendances.Add(st);
                            db.SaveChanges();
                        }
                        else
                        {
                            st.Status = db.LookUps.Where(x => x.Value == "Absent").Single().Id;
                            st.AttendanceId = db.Attendances.Max(x => x.AttendanceId);
                            st.StudentId = s.Id;
                            db.StudentAttendances.Add(st);
                            db.SaveChanges();
                        }
                    }
                }

            }
            return View();
        }



        public ActionResult LoggedInView(int id)
        {
            DB35Entities db = new DB35Entities();
            using (db)
            {
                return View(db.People.First(f => f.Id == id));
            }
           
        }
        public int Tid(int Tid)
        {
            return Tid;
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
        public ActionResult Result(int id, int Tid, int check, string text)
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
            if (check == 1)
            {
                ViewBag.T = text;

                ViewBag.Err = "Title already exits. Edit that from uploaded or change Title!";
            }
            if (check == 2)
            {
                ViewBag.T = text;

                ViewBag.Err = "Title not in Corrrect Format. Should be like 'Final Term | 2016-17'";

            }
            return View();
        }
        [HttpPost]
        public ActionResult Result(ResultVM r, int Course, int Section)
        {
            bool find = true;
            DB35Entities db = new DB35Entities();
            int check = 0;
            int t = db.Courses.First(c => c.CourseId == Course && c.SectionId == Section).TeacherId;
            Regex T = new Regex("[0-9a-zA-Z_]{1,20} | [0-9]{2,4}-[0-9]{2}");
            foreach (Result R in db.Results)
            {
                if (R.Title == r.Title && R.SectionId == Section)
                {
                    check = 1;
                    find = false;
                    break;
                }
            }
            if (!T.IsMatch(r.Title))
            {
                find = false;
                check = 2;
            }
            if (find)
            {
                Result re = new Models.Result();
                re.CourseId = Course;
                re.SectionId = Section;
                re.Title = r.Title;
                re.TotalMarks = r.TotalMarks;
                db.Results.Add(re);
                db.SaveChanges();
                int Rid = db.Results.Max(e => e.ResultId);
                return RedirectToAction("UploadResult", new { id = Rid });
            }
            else
            {

                return RedirectToAction("Result", new { id = Section, Tid = t, check = check, text = r.Title });
            }
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
            ViewBag.Tid = db.Courses.First(f => f.CourseId == co && f.SectionId == sec).TeacherId;
            foreach (Student s in db.Students)
            {
                bool pre = true;
                foreach (StudentResult sr in db.StudentResults)
                {
                    if (s.Id == sr.StudentId && sr.ResultId == id)
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

        public ActionResult UploadedRes(int id)
        {
            List<Result> res = new List<Result>();
            DB35Entities db = new DB35Entities();
            List<int> ClassNames = new List<int>();
            List<string> Sections = new List<string>();
            List<string> CoNames = new List<string>();
            int cid = 0;
            foreach (Result r in db.Results)
            {
                int Cid = r.CourseId;
                foreach (Cours c in db.Courses)
                {
                    if (c.CourseId == Cid && c.TeacherId == id)
                    {
                        res.Add(r);
                        Sections.Add(db.Sections.First(f => f.SectionId == c.SectionId).Name);
                        cid = db.ClassSections.First(f => f.SectionId == c.SectionId).ClassId;
                        ClassNames.Add(db.Classes.First(f => f.ClassId == cid).Name);
                        CoNames.Add(c.Title);
                    }
                }
            }
            ViewBag.CNames = ClassNames;
            ViewBag.Sec = Sections;
            ViewBag.CoNames = CoNames;
            return View(res);
        }

        public ActionResult ResultSection(int id)
        {
            List<StudentResult> S = new List<StudentResult>();
            DB35Entities db = new DB35Entities();
            List<string> RegNo = new List<string>();
            int secid = db.Results.First(f => f.ResultId == id).SectionId;
            int count = db.Students.Where(s => s.SectionId == secid).Count() - db.StudentResults.Where(r => r.ResultId == id).Count();
            foreach (StudentResult sr in db.StudentResults)
            {
                if (sr.ResultId == id)
                {
                    S.Add(sr);
                    RegNo.Add(db.Students.First(f => f.Id == sr.StudentId).RegNo);

                }
            }
            int sec = db.Results.Find(id).SectionId;
            ViewBag.Section = db.Sections.Find(sec).Name;
            int c = db.ClassSections.First(f => f.SectionId == sec).ClassId;
            ViewBag.Class = db.Classes.Find(c).Name;
            ViewBag.Total = db.Results.First(f => f.ResultId == id).TotalMarks;
            ViewBag.RegNo = RegNo;
            ViewBag.count = count;
            return View(S);
        }
        public ActionResult EditResult(int id)
        {
            DB35Entities db = new DB35Entities();
            StudentResultVM sr = new StudentResultVM();
            foreach (StudentResult s in db.StudentResults)
            {
                // if (s.Id == id)
                {
                    sr.ResultId = s.ResultId;
                    sr.StudentId = s.StudentId;
                    ViewBag.Obt = s.ObtainedMarks;
                    ViewBag.Title = db.Results.Find(s.ResultId).Title;
                    ViewBag.Total = db.Results.Find(s.ResultId).TotalMarks;
                    break;
                }
            }
            return View(sr);
        }

        [HttpPost]
        public ActionResult EditResult(int id, StudentResultVM obj, decimal OMarks)
        {
            DB35Entities db = new DB35Entities();
            db.StudentResults.Find(id).ObtainedMarks = OMarks;
            db.SaveChanges();
            return RedirectToAction("ResultSection", new { id = db.StudentResults.Find(id).ResultId });
        }

        public ActionResult DeleteResult(int id, int Tid)
        {
            DB35Entities db = new DB35Entities();
            foreach (StudentResult sr in db.StudentResults)
            {
                if (sr.ResultId == id)
                {
                    db.StudentResults.Remove(sr);

                }
            }
            db.SaveChanges();

            db.Results.Remove(db.Results.Find(id));
            db.SaveChanges();
            return RedirectToAction("UploadedRes", new { id = Tid });
        }
        public ActionResult TeacherPayroll(int id)
        {
            DB35Entities db = new DB35Entities();
            ViewBag.TName = db.People.First(d => d.Id == id).FirstName + ' ' + db.People.First(d => d.Id == id).LastName;
            List<Payroll> pr = new List<Payroll>();
            foreach (Payroll p in db.Payrolls)
            {
                if (p.TeacherId == id)
                {
                    pr.Add(p);
                }
            }
            return View(pr);
        }

        public ActionResult SectionAssign(int Sid, int Tid)
        {
            DB35Entities db = new DB35Entities();
            List<Assignment> A = new List<Assignment>();
            foreach (Assignment a in db.Assignments)
            {
                if (a.SectionId == Sid)
                {
                    int cid = db.Courses.First(f => f.CourseId == a.CourseId).TeacherId;
                    if(cid == Tid)
                    {
                        A.Add(a);
                    }          
                }
            }
            return View(A);
        }

     public ActionResult SubmittedAssign(int id)
        {
            List<SubmittedAssign> s = new List<Models.SubmittedAssign>();
            DB35Entities db = new DB35Entities();
            foreach (SubmittedAssign a in db.SubmittedAssigns)
            {
                if (a.Assignemnt == id)
                {
                    s.Add(a);
                }
            }
            return View(s);
        }


        public FileResult DownloadFiles(int id, int Sid)
        {
            DB35Entities db = new DB35Entities();
            string RegNo = db.Students.First(f => f.Id == Sid).RegNo;
            string name = db.SubmittedAssigns.First(f => f.SubmittedBy == Sid && f.Assignemnt == id).FileName;
            byte[] fileBytes = System.IO.File.ReadAllBytes(db.SubmittedAssigns.First(f => f.Assignemnt == id).Path);
            string fileName = RegNo+".zip";
            return File(fileBytes, System.Net.Mime.MediaTypeNames.Application.Octet, fileName);
        }
        

        //public ActionResult TeacherProfile(int id)
        //{
        //    DB35Entities db = new DB35Entities();
        //    using (db)
        //    {
        //        return View(db.People.First(f => f.Id == id));
        //    }
        //}

    }
}
