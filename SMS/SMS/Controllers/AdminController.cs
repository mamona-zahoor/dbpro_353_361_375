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
using CrystalDecisions.CrystalReports.Engine;
using System.IO;

namespace SMS.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin

        public static int var1;
        public static int var2;


        SqlConnection con = new SqlConnection("Data Source=FARVASARDAR-PC\\FARVASQL;Initial Catalog=DB35;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");


        public ActionResult ExportStudentReport()
        {
            DB35Entities db = new DB35Entities();
            ReportDocument rd = new ReportDocument();
            rd.Load(Path.Combine(Server.MapPath("~/Reports"), "AllStudentsReport.rpt"));
            rd.SetDataSource(db.Students.ToList());
            Response.Buffer = false;
            Response.ClearContent();
            Response.ClearHeaders();
            try
            {
                Stream stream = rd.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat);
                stream.Seek(0, SeekOrigin.Begin);
                return File(stream, "application/pdf", "AllStudentsList.pdf");

            }
            catch
            {
                throw;
            }
        }


        public ActionResult ExportTeacherReport()
        {
            DB35Entities db = new DB35Entities();
            ReportDocument rd = new ReportDocument();
            rd.Load(Path.Combine(Server.MapPath("~/Reports"), "AllTeachersReport.rpt"));
            rd.SetDataSource(db.Teachers.ToList());
            Response.Buffer = false;
            Response.ClearContent();
            Response.ClearHeaders();
            try
            {
                Stream stream = rd.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat);
                stream.Seek(0, SeekOrigin.Begin);
                return File(stream, "application/pdf", "AllTeachersList.pdf");

            }
            catch
            {
                throw;
            }
        }

        public ActionResult ViewDatesheets()
        {
            DB35Entities db = new DB35Entities();
            List<DatesheetVM> VM = new List<DatesheetVM>();
           foreach(DateSheet d in db.DateSheets.ToList())
            {
                DatesheetVM g = new DatesheetVM();
                int id = d.ClassId;
                g.ClassId = id;
                g.ClassName = db.Classes.Where(x => x.ClassId == id).SingleOrDefault().Name.ToString();
                VM.Add(g);

            }
            return View(VM);
        }


        public ActionResult ViewDateSheet(int id)
        {
            DB35Entities db = new DB35Entities();
            List<DatesheetVM> T = new List<DatesheetVM>();
            int cid = id;

            ViewBag.Class = db.Classes.Where(x => x.ClassId == cid).SingleOrDefault().Name;
            int did = db.DateSheets.Where(x => x.ClassId == cid).SingleOrDefault().DateSheetId;
            List<ClassDateSheet> F = db.ClassDateSheets.Where(x => x.DateSheetId == did).ToList();
            if (F.Count == 0)
            {
                ViewBag.Color = "red";
                ViewBag.Message = "Datesheet is not finalized yet";
            }
            else
            {
                foreach (ClassDateSheet f in F)
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
            }
           
            return View(T);
        }

        public ActionResult ViewTimeTable()
        {
            DB35Entities db = new DB35Entities();
            List<ViewTimeTable> Time = new List<ViewTimeTable>();
            List<Timetable> C = db.Timetables.OrderBy(a => a.TimetableId).ToList();

            int i = 0;
            foreach (Timetable t in C)
            {
                int s = db.Timetables.OrderBy(a => a.TimetableId).Skip(i).First().SectionId;
                ViewTimeTable y = new Models.ViewTimeTable();
                y.SectionName = db.Sections.Where(x => x.SectionId == s).SingleOrDefault().Name;
                y.SectionId = s;

                int c = db.ClassSections.Where(x => x.SectionId == s).SingleOrDefault().ClassId;
                y.ClassId = c;
                y.ClassName = db.Classes.Where(x => x.ClassId == c).SingleOrDefault().Name;
                Time.Add(y);
                i++;
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
            ViewBag.Section = db.Sections.Where(x => x.SectionId == id).SingleOrDefault().Name;
            int f = db.ClassSections.Where(x => x.SectionId == id).SingleOrDefault().ClassId;

            ViewBag.Class = db.Classes.Where(x => x.ClassId == f).SingleOrDefault().Name;
           
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

            int o = 0;
            bool check = true;
            DB35Entities dbo = new DB35Entities();
            if (obj.UserName.Contains("-"))
            {

                foreach (Student s in dbo.Students)
                {
                    if (s.RegNo == obj.UserName && s.Password == obj.Password)
                    {
                        check = true;
                        o = s.Id;
                        break;
                    }
                }
                if (check == true)
                {
                    con.Open();
                    string query = "Select Person.Id from Person INNER JOIN Student ON Person.Id=Student.Id where Student.RegNo = '" + obj.UserName + "' AND Student.Password = '" + obj.Password + "' ";
                    SqlCommand cmd = new SqlCommand(query, con);
                    int a = Convert.ToInt32(cmd.ExecuteScalar());
                    var1 = a;
                    con.Close();

                    return RedirectToAction("LoggedInView", "Student", new { id = o });
                }
                else
                {
                    return View();
                }
            }


            else if (obj.UserName.Contains("@"))
            {
                foreach (Teacher t in dbo.Teachers)
                {
                    if (t.Password == obj.Password && t.Email == obj.UserName)
                    {
                        check = true;
                        o = t.Id;

                    }
                }
                if (check == true)
                {
                    con.Open();
                    string query = "Select Person.Id from Person INNER JOIN Teacher ON Person.Id=Teacher.Id where Teacher.Email = '" + obj.UserName + "' AND Teacher.Password = '" + obj.Password + "' ";
                    SqlCommand cmd = new SqlCommand(query, con);
                    int a = Convert.ToInt32(cmd.ExecuteScalar());
                    var2 = a;
                    con.Close();

                    return RedirectToAction("LoggedInView", "Teacher", new { id = o });
                }
                else
                {
                    return View();
                }
            }
            else
            {
                return View();
            }
        }


        public ActionResult SecretQuestionAnswer(int id)
        {
            DB35Entities db = new DB35Entities();
            StudentVM s = new StudentVM();
            foreach (Student st in db.Students)
            {
                if (st.Id == s.Id)
                {
                    st.SecretAnswer = s.SecretAnswer;
                    break;
                }

            }
            return View(s);
        }

        [HttpPost]
        public ActionResult SecretQuestionAnswer(int id, Student obj)
        {
            DB35Entities db = new DB35Entities();
            db.Students.Find(id).SecretAnswer = obj.SecretAnswer;
            db.SaveChanges();
            return RedirectToAction("Student");
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
                    if (c.SectionId == ci.SectionId)
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
                Name = x.Person.FirstName + ' ' + x.Person.LastName
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
            bool k = true;
            DB35Entities db = new DB35Entities();
            ClassDateSheet cd = new ClassDateSheet();
            DateSheet dt = new DateSheet();
            foreach (DateSheet d in db.DateSheets)
            {

                if (d.ClassId == t.ClassId)
                {
                    cd.DateSheetId = d.DateSheetId;
                    check = false;
                    break;
                }
            }
            if (check == true)
            {
                dt.ClassId = t.ClassId;
                db.DateSheets.Add(dt);
                cd.DateSheetId = dt.DateSheetId;
                db.SaveChanges();
                cd.CourseId = t.CourseId;
                cd.EndTime = t.EndTime;
                cd.StartTime = t.StartTime;
                cd.Date = t.Date;
                db.ClassDateSheets.Add(cd);
                db.SaveChanges();
            }
            else if(check == false)
            {
                foreach(ClassDateSheet j in db.ClassDateSheets.ToList())
                {
                    if(cd.DateSheetId == j.DateSheetId && t.CourseId == j.CourseId )
                    {
                        ViewBag.Color = "red";
                        ViewBag.message = "Exam for this subject will be conducted on "+j.Date;
                        k = false;
                        break;
                    }
                    else
                    {
                        ViewBag.Color = "green";
                        ViewBag.message = "Added Successfully";
                        k = true;
                       
                    }
                }
                if( k == true)
                {
                    cd.CourseId = t.CourseId;
                    cd.EndTime = t.EndTime;
                    cd.StartTime = t.StartTime;
                    cd.Date = t.Date;
                    db.ClassDateSheets.Add(cd);
                    db.SaveChanges();
                }
            }
          
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
            Lecture l = new Lecture();
            SectionTimetable u = new SectionTimetable();
            foreach (Timetable y in db.Timetables)
            {
                if (y.SectionId == t.SectionId)
                {
                    u.TimetableId = y.TimetableId;
                    check = false;
                    break;
                }
            }
            bool iss = true;
            if (check == true)
            {
                tt.SectionId = t.SectionId;
                db.Timetables.Add(tt);
                db.SaveChanges();
                u.TimetableId = tt.TimetableId;
            }
            foreach (SectionTimetable c in db.SectionTimetables.ToList())
            {
                if (c.TimetableId == u.TimetableId && c.Day == t.Day)
                {
                    iss = false;
                    if (t.EndTime == DateTime.Parse("9:00 AM").TimeOfDay)
                    {

                        db.Lectures.Where(x => x.Id == c.Id).SingleOrDefault().Lecture1 = t.CourseId;


                    }

                    if (t.EndTime == DateTime.Parse("10:00 AM").TimeOfDay)
                    {
                        db.Lectures.Where(x => x.Id == c.Id).SingleOrDefault().Lecture2 = t.CourseId;
                    }
                    if (t.EndTime == DateTime.Parse("11:00 AM").TimeOfDay)
                    {
                        db.Lectures.Where(x => x.Id == c.Id).SingleOrDefault().Lecture3 = t.CourseId;
                    }
                    if (t.EndTime == DateTime.Parse("12:00 PM").TimeOfDay)
                    {
                        db.Lectures.Where(x => x.Id == c.Id).SingleOrDefault().Lecture4 = t.CourseId;
                    }
                    if (t.EndTime == DateTime.Parse("2:00 PM").TimeOfDay)
                    {
                        var query = from o in db.Lectures where o.Id == c.Id select o;
                        foreach (Lecture o in query)
                        {
                            o.Lecture5 = t.CourseId;
                        }
                        // db.Lectures.Find(c.Id).Lecture5 = t.CourseId;
                        //db.Lectures.Where(x => x.Id == c.Id).SingleOrDefault().Lecture5 = t.CourseId;
                    }

                }
            }
            if (iss == true)
            {
                u.Day = t.Day;
                db.SectionTimetables.Add(u);
                if (t.EndTime == DateTime.Parse("9:00 AM").TimeOfDay)
                {
                    l.Lecture1 = t.CourseId;
                }
                if (t.EndTime == DateTime.Parse("10:00 AM").TimeOfDay)
                {
                    l.Lecture2 = t.CourseId;
                }
                if (t.EndTime == DateTime.Parse("11:00 AM").TimeOfDay)
                {
                    l.Lecture3 = t.CourseId;
                }
                if (t.EndTime == DateTime.Parse("12:00 PM").TimeOfDay)
                {
                    l.Lecture4 = t.CourseId;
                }
                if (t.EndTime == DateTime.Parse("2:00 PM").TimeOfDay)
                {

                    l.Lecture5 = t.CourseId;
                }
                l.Id = u.Id;
                db.Lectures.Add(l);


            }




            Timetable(t);
            db.SaveChanges();
            return View();

        }

        public void Timetable(TimeTableVM V)
        {
            DB35Entities db = new DB35Entities();
            int cid = V.CourseId;
            int tid = db.Courses.Where(x => x.CourseId == cid).SingleOrDefault().TeacherId;
            bool check = true;
            foreach (Ttable t in db.Ttables.ToList())
            {
                if (t.TeacherId == tid && t.Day == V.Day)
                {
                    check = false;
                    break;
                }
            }
            if (check == false)
            {
                TeacherTimetable tt = new TeacherTimetable();
                int z = db.Ttables.Where(x => x.TeacherId == tid && x.Day == V.Day).SingleOrDefault().Id;
                if (V.EndTime == DateTime.Parse("9:00 AM").TimeOfDay)
                {
                    db.TeacherTimetables.Where(x => x.TId == z).SingleOrDefault().Lecture1 = cid;
                    db.TeacherTimetables.Where(x => x.TId == z).SingleOrDefault().Class1 = V.SectionId;

                }
                if (V.EndTime == DateTime.Parse("10:00 AM").TimeOfDay)
                {

                    db.TeacherTimetables.Where(x => x.TId == z).SingleOrDefault().Lecture2 = cid;
                    db.TeacherTimetables.Where(x => x.TId == z).SingleOrDefault().Class2 = V.SectionId;
                }
                if (V.EndTime == DateTime.Parse("11:00 AM").TimeOfDay)
                {
                    db.TeacherTimetables.Where(x => x.TId == z).SingleOrDefault().Lecture3 = cid;
                    db.TeacherTimetables.Where(x => x.TId == z).SingleOrDefault().Class3 = V.SectionId;

                }
                if (V.EndTime == DateTime.Parse("12:00 PM").TimeOfDay)
                {
                    db.TeacherTimetables.Where(x => x.TId == z).SingleOrDefault().Lecture4 = cid;
                    db.TeacherTimetables.Where(x => x.TId == z).SingleOrDefault().Class4 = V.SectionId;
                }

                if (V.EndTime == DateTime.Parse("02:00 PM").TimeOfDay)
                {
                    db.TeacherTimetables.Where(x => x.TId == z).SingleOrDefault().Lecture5 = cid;
                    db.TeacherTimetables.Where(x => x.TId == z).SingleOrDefault().Class5 = V.SectionId;
                }
                db.SaveChanges();
            }
            else
            {
                TeacherTimetable q = new TeacherTimetable();
                Ttable x = new Ttable();
                x.Day = V.Day;
                x.TeacherId = tid;
                db.Ttables.Add(x);


                if (V.EndTime == DateTime.Parse("09:00 AM").TimeOfDay)
                {
                    q.Lecture1 = cid;
                    q.Class1 = V.SectionId;

                }
                if (V.EndTime == DateTime.Parse("10:00 AM").TimeOfDay)
                {
                    q.Lecture2 = cid;
                    q.Class2 = V.SectionId;
                }
                if (V.EndTime == DateTime.Parse("11:00 AM").TimeOfDay)
                {
                    q.Lecture3 = cid;
                    q.Class3 = V.SectionId;
                }
                if (V.EndTime == DateTime.Parse("12:00 pM").TimeOfDay)
                {
                    q.Lecture4 = cid;
                    q.Class4 = V.SectionId;
                }
                if (V.EndTime == DateTime.Parse("2:00 PM").TimeOfDay)
                {
                    q.Lecture5 = cid;
                    q.Class5 = V.SectionId;
                }
                db.TeacherTimetables.Add(q);
                q.TId = x.Id;
                db.SaveChanges();

            }
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
        public ActionResult Deletes(int id)
        {
            DB35Entities db = new DB35Entities();
            int y = db.DateSheets.Where(x => x.ClassId == id).SingleOrDefault().DateSheetId;
            foreach(ClassDateSheet f in db.ClassDateSheets.Where(x => x.DateSheetId == y))
            {
                db.ClassDateSheets.Remove(f);
            }
            foreach(DateSheet v in db.DateSheets.Where(x => x.DateSheetId == y))
            {
                db.DateSheets.Remove(v);
            }
            db.SaveChanges();

            return RedirectToAction("ViewDateSheets", "Admin");
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
            List<Models.Section> slist = new List<Models.Section>();
            DB35Entities db = new DB35Entities();
            int i = 0;
            using (db)
            {
                var cs = (db.ClassSections.Where(m => m.ClassId == id).ToList());
                foreach (Models.Section sec in db.Sections)
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
            Models.Section sec = new Models.Section();
            sec.Name = obj.Name;
            sec.TeacherId = TeacherNames;
            sec.NumOfStudents = 0;
            db.Sections.Add(sec);
            db.SaveChanges();
            ClassSection cs = new ClassSection();
            cs.ClassId = id;
            foreach (Models.Section s in db.Sections)
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
            List<int> cl = new List<int>();
            foreach (Class c in db.Classes)
            {
                cl.Add(c.Name);
            }
            List<int> a = new List<int> { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };

            
            foreach (int cc in cl)
            {
                foreach (int q in a)
                {
                    if (cc == q)
                    {
                        a.Remove(q);
                        break;
                    }
                }
            }
            ViewBag.Classes = a;
            return View();
        }



        public ActionResult EditSection(int id)
        {
            DB35Entities db = new DB35Entities();
            SectionVM s = new SectionVM();
            foreach (Models.Section sec in db.Sections)
            {
                if (sec.SectionId == id)
                {
                    db.Teachers.Find(sec.TeacherId).InchSec = null;

                    break;
                }
            }
            db.SaveChanges();
            foreach (Models.Section sec in db.Sections)
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
            foreach (Models.Section s in db.Sections)
            {
                if (s.SectionId == id)
                {
                    db.Sections.Remove(s);
                }
            }

            foreach (Student s in db.Students)
            {
                if (s.SectionId == id)
                {
                    int a = s.Id;
                    db.Students.Remove(s);

                    foreach (FeeChallan fc in db.FeeChallans)
                    {
                        if (fc.StudentId == a)
                        {
                            db.FeeChallans.Remove(fc);
                        }
                    }

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
            ViewBag.RegNo = db.Students.First(s => s.Id == id).RegNo;
            foreach (FeeChallan f in db.FeeChallans)
            {
                if (f.StudentId == id)
                {
                    fvm.Add(f);
                }
            }
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
                    fvm.DueDate = f.DueDate;
                }
            }
            return View(fvm);
        }


        [HttpPost]
        public ActionResult EditFeeChallans(int id, FeeChallanVM obj)
        {
            
            DB35Entities db = new DB35Entities();
            int StuId = db.FeeChallans.Find(id).StudentId;
            int I = db.FeeChallans.Find(id).FeeChallanId;
            if (ModelState.IsValid)
            {
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
                db.FeeChallans.Find(id).DueDate = obj.DueDate;
                db.SaveChanges();
                return RedirectToAction("FeeChallans", new { id = StuId });

            }
            return RedirectToAction("EditFeeChallans", new { id = I,Studentid = StuId });

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
        public ActionResult EditCourse(int id, Course CS)
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
            foreach (Cours C in db.Courses)
            {
                if (C.CourseId == id)
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

            foreach (Student s in db.Students)
            {
                if (s.ClassId == id)
                {
                    int b = s.ClassId;
                    int a = s.Id;
                    db.Students.Remove(s);

                    foreach (ClassSection cs in db.ClassSections)
                    {
                        if (cs.ClassId == b)
                        {
                            db.ClassSections.Remove(cs);
                        }
                    }

                    foreach (FeeChallan f in db.FeeChallans)
                    {
                        if (f.StudentId == a)
                        {
                            db.FeeChallans.Remove(f);
                        }
                    }

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

               
                return View(c);

            }
        }

        public ActionResult StudentDetails(int id)
        {
            DB35Entities db = new DB35Entities();
            using (db)
            {
                return View(db.People.First(f => f.Id == id));
            }
        }

        public ActionResult EditStudentDetails(int id)
        {
            DB35Entities db = new DB35Entities();
            PersonVM p = new PersonVM();
            foreach (Person pe in db.People)
            {
                if (pe.Id == p.Id)
                {
      
                    p.Contact = pe.Contact;
   
                    p.Address = pe.Address;
     
                    break;
                }
            }
            return View();
        }

        [HttpPost]
        public ActionResult EditStudentDetails(int id, Person obj)
        {
            DB35Entities db = new DB35Entities();
     
            db.People.Find(id).Contact = obj.Contact;
      
            db.People.Find(id).Address = obj.Address;
      

            db.SaveChanges();
            return RedirectToAction("Student");
        }


        public string RandomPasswordString(int size, bool lowerCase)
        {
            StringBuilder builder = new StringBuilder();
            Random random = new Random();
            char ch;
            for (int i = 0; i < size; i++)
            {
                ch = Convert.ToChar(Convert.ToInt32(Math.Floor(26 * random.NextDouble() + 65)));
                builder.Append(ch);
            }
            if (lowerCase)
                return builder.ToString().ToLower();
            return builder.ToString();
        }

      


        public ActionResult AddStudent()
        {
            return View();
        }

        [HttpPost]
        public ActionResult AddStudent(PersonVM p, decimal Fee, string regNum)
        {


            DB35Entities db = new DB35Entities();
            Student st = new Student();
            Class cs = new Class();
            ClassSection csec = new ClassSection();
            Models.Section sec = new Models.Section();
            Person pe = new Person();
            FeeChallan fe = new FeeChallan();
            pe.FirstName = p.FirstName;
            pe.LastName = p.LastName;
            pe.Contact = p.Contact;
            pe.Gender = db.LookUps.First(l => l.Value == "Male").Id;
            pe.DateOfBirth = p.DateOfBirth;
            pe.Address = p.Address;
            db.People.Add(pe);

            p.RegNo = regNum;
            st.Id = p.Id;
            st.RegNo = p.RegNo;

            string clas = st.RegNo.Split('-')[0];
            string sectn = st.RegNo.Split('-')[1];

            int ce = Convert.ToInt32(clas);
            st.ClassId = db.Classes.First(l => l.Name == ce).ClassId;

            int a = st.ClassId;

            SqlConnection con = new SqlConnection("Data Source=FARVASARDAR-PC\\FARVASQL;Initial Catalog=DB35;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
            con.Open();
            string query = "Select sec.SectionId FROM ClassSections csec JOIN Section sec ON csec.SectionId = sec.SectionId AND csec.ClassId = " + a + " AND sec.Name = '" + sectn + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            int b;
            b = (int)cmd.ExecuteScalar();
            con.Close();

            st.SectionId = b;


            var res = RandomPasswordString(8, false);
            st.Password = res;

            st.SecretQuestion = "any";
            st.SecretAnswer = "any";
            st.Fee = Fee;
            db.Students.Add(st);

            db.SaveChanges();
            fe.Fee = Fee;
            fe.StudentId = db.Students.Max(u => u.Id);
            fe.TotalFee = Fee;
            fe.Status = db.LookUps.First(l => l.Value == "Unpaid").Id;
            db.FeeChallans.Add(fe);
            db.SaveChanges();


            foreach (Class c in db.Classes)
            {
                if (c.ClassId == st.ClassId)
                {
                    c.NumOfStudents++;
                }
            }
            db.SaveChanges();


            foreach (Models.Section c in db.Sections)
            {
                if (c.SectionId == st.SectionId)
                {
                    c.NumOfStudents++;
                }
            }
            db.SaveChanges();


            return RedirectToAction("AddStudent");

        }


        public ActionResult AddFeeChallan(int id)
        {
            return View();
        }

        [HttpPost]
       public ActionResult AddFeeChallan(FeeChallanVM obj, int Id)
        {
            if (ModelState.IsValid)
            {
                FeeChallan f = new FeeChallan();
                DB35Entities db = new DB35Entities();
                f.DueDate = obj.DueDate;
                f.Scholarships = obj.Scholarships;
                string s = "Unpaid";
                if (obj.Status == 0)
                {
                    s = "Paid";
                }
                f.Status = db.LookUps.First(l => l.Value == s).Id;
                f.StudentId = Id;
                f.TotalFee = obj.Fee + obj.Scholarships - obj.Fine;
                db.FeeChallans.Add(f);
                db.SaveChanges();
            }
            return View();


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
                    st.ClassId = s.ClassId;
                    st.SectionId = s.SectionId;
                    break;
                }
            }
            return View(st);

        }

      
       [HttpPost]
        public ActionResult EditStudent(int id, Student obj)
        {
            DB35Entities db = new DB35Entities();
            db.Students.Find(id).RegNo = obj.RegNo;

            string clas = obj.RegNo.Split('-')[0];
            string sectn = obj.RegNo.Split('-')[1];
            int ce = Convert.ToInt32(clas);

            var x = db.Students.Find(id).ClassId = db.Classes.First(l => l.Name == ce).ClassId;

            int a = x;

            con.Open();
            string query = "Select sec.SectionId FROM ClassSections csec JOIN Section sec ON csec.SectionId = sec.SectionId AND csec.ClassId = " + a + " AND sec.Name = '" + sectn + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            int b;
            b = (int)cmd.ExecuteScalar();
            con.Close();

            db.Students.Find(id).SectionId = b;


            int z = b;

            Class c = new Class();
            Models.Section s = new Models.Section();

            if (c.ClassId == a && s.SectionId == z)
            {
                c.NumOfStudents++;
                s.NumOfStudents++;
            }

            else if (c.ClassId == a && s.SectionId != b)
            {
                c.NumOfStudents++;
            }
            else if (c.ClassId != a && s.SectionId == b)
            {
                s.NumOfStudents++;
            }

            db.SaveChanges();
            return RedirectToAction("Student");

        }

        public ActionResult DeleteStudent(int id)
        {
            DB35Entities db = new DB35Entities();

            foreach (FeeChallan fc in db.FeeChallans)
            {
                if (fc.StudentId == id)
                {
                    db.FeeChallans.Remove(fc);
                }
            }
            foreach (Student st in db.Students)
            {
                if (st.Id == id)
                {
                    int a = st.ClassId;
                    int b = st.SectionId;
                    db.Students.Remove(st);

                    foreach (Class c in db.Classes)
                    {
                        if (c.ClassId == a)
                        {
                            c.NumOfStudents--;
                        }
                    }
                    db.SaveChanges();


                    foreach (Models.Section c in db.Sections)
                    {
                        if (c.SectionId == b)
                        {
                            c.NumOfStudents--;
                        }
                    }


                }
            }

            foreach (Person p in db.People)
            {
                if (p.Id == id)
                {
                    db.People.Remove(p);
                    break;

                }
            }
            db.SaveChanges();

            return RedirectToAction("Student");


        }




        //---------------------Manage Teachers--------------



        public ActionResult TeacherDetails(int id)
        {
            DB35Entities db = new DB35Entities();
            using (db)
            {
                return View(db.People.First(f => f.Id == id));
            }
        }

        public ActionResult EditTeacherDetails(int id)
        {
            DB35Entities db = new DB35Entities();
            PersonVM p = new PersonVM();
            foreach (Person pe in db.People)
            {
                if (pe.Id == p.Id)
                {
   
                    p.Contact = pe.Contact;
                    p.Address = pe.Address;
      
                    break;
                }
            }
            return View();
        }

        [HttpPost]
        public ActionResult EditTeacherDetails(int id, Person obj)
        {
            DB35Entities db = new DB35Entities();
   
            db.People.Find(id).Contact = obj.Contact;
            db.People.Find(id).Address = obj.Address;
    

            db.SaveChanges();
            return RedirectToAction("Teacher");
        }


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

               
                return View(c);

            }
        }


        public ActionResult AddTeacher()
        {
            return View();
        }

        [HttpPost]
        public ActionResult AddTeacher(PersonVM p, TeacherVM s, string Email)
        {
            DB35Entities db = new DB35Entities();

            Person pe = new Models.Person();

            pe.FirstName = p.FirstName;
            pe.LastName = p.LastName;
            pe.Contact = p.Contact;
            pe.Gender = db.LookUps.First(l => l.Value == "Male").Id;
            pe.DateOfBirth = p.DateOfBirth;
            pe.Address = p.Address;

            db.People.Add(pe);

            p.Email = Email;
            Teacher st = new Models.Teacher();
            st.Id = p.Id;
            st.Email = p.Email;
            st.Salary = s.Salary;
            st.InchSec = s.InchSec;
            st.ResetPassword = null;

            var ps = RandomPasswordString(8, true);

            st.Password = ps;
            db.Teachers.Add(st);
            db.SaveChanges();

            Payroll pr = new Payroll();
            pr.TeacherId = db.Teachers.Max(t => t.Id);
            pr.Salary = s.Salary;
            pr.Status = db.LookUps.First(l => l.Value == "Unpaid").Id;
            pr.Payable = s.Salary;
            pr.Date = DateTime.Now;
            db.Payrolls.Add(pr);
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

        public ActionResult Payrolls(int id)
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

        public ActionResult AddPayroll(int id)
        {
            return View();
        }

        [HttpPost]
        public ActionResult AddPayroll(int Id, PayrollVM obj)
        {
            if (ModelState.IsValid)
            {
                DB35Entities db = new DB35Entities();
                Payroll p = new Payroll();
                p.Salary = obj.Salary;
                p.Bonus = obj.Bonus;
                p.Deductions = obj.Deductions;
                p.TeacherId = Id;
                p.Payable = obj.Salary + obj.Bonus - obj.Deductions;
                p.Date = obj.Date;
                string s = "Unpaid";
                if (obj.Status == 0)
                {
                    s = "Paid";
                }
                p.Status = db.LookUps.First(l => l.Value == s).Id;
                db.Payrolls.Add(p);
                db.SaveChanges();

                return RedirectToAction("AddPayroll", new { id = Id });

            }
            else
            {
                return View(obj);
            }
        }

        public ActionResult EditPay(int id, int TeacherId)
        {
            DB35Entities db = new DB35Entities();
            ViewBag.TName = db.People.First(d => d.Id == TeacherId).FirstName + ' ' + db.People.First(d => d.Id == TeacherId).LastName;

            PayrollVM pvm = new PayrollVM();
            foreach (Payroll p in db.Payrolls)
            {
                if (p.PayrollId == id)
                {
                    pvm.Salary = p.Salary;
                    pvm.Bonus = Convert.ToDecimal(p.Bonus);
                    pvm.Deductions = Convert.ToDecimal(p.Deductions);
                    pvm.Status = p.Status;
                    pvm.Date = p.Date;
                    break;
                }
            }
            return View(pvm);

        }

        [HttpPost]
        public ActionResult EditPay(int id, PayrollVM p)
        {
            DB35Entities db = new DB35Entities();
            db.Payrolls.Find(id).Salary = p.Salary;
            db.Payrolls.Find(id).Bonus = p.Bonus;
            db.Payrolls.Find(id).Deductions = p.Deductions;
            db.Payrolls.Find(id).Payable = p.Salary + p.Bonus - p.Deductions;
            db.Payrolls.Find(id).Date = p.Date;
            int TId = db.Payrolls.Find(id).TeacherId;
            db.Teachers.Find(TId).Salary = p.Salary;
            ViewBag.TName = db.People.First(d => d.Id == id).FirstName + ' ' + db.People.First(d => d.Id == id).LastName;
            string s = "Unpaid";
            if (p.Status == 0)
            {
                s = "Paid";
            }
            db.Payrolls.Find(id).Status = db.LookUps.First(l => l.Value == s).Id;
            db.SaveChanges();
            return RedirectToAction("Payrolls", "Admin", new { id = TId });

        }


        [HttpPost]
        public ActionResult EditTeacher(int id, Teacher obj)
        {
            DB35Entities db = new DB35Entities();
            db.Teachers.Find(id).Email = obj.Email;
           // db.Teachers.Find(id).Salary = obj.Salary;
            db.Teachers.Find(id).InchSec = obj.InchSec;
            db.SaveChanges();
            return RedirectToAction("Teacher");

        }

        public ActionResult DeleteTeacher(int id)
        {
            DB35Entities db = new DB35Entities();
            foreach (Payroll f in db.Payrolls)
            {
                if (f.TeacherId == id)
                {
                    db.Payrolls.Remove(f);
                    break;
                }
            }

            foreach (Models.Section fc in db.Sections)
            {
                if (fc.TeacherId == id)
                {
                    int a = fc.SectionId;
                    db.Sections.Remove(fc);
                    foreach (Timetable t in db.Timetables)
                    {
                        if (t.SectionId == a)
                        {
                            db.Timetables.Remove(t);

                        }
                    }

                    foreach (ClassSection cs in db.ClassSections)
                    {
                        if (cs.SectionId == a)
                        {
                            db.ClassSections.Remove(cs);
                        }
                    }

                    foreach (Cours c in db.Courses)
                    {
                        if (c.SectionId == a)
                        {
                            int b = c.SectionId;
                            db.Courses.Remove(c);
                            foreach (Result r in db.Results)
                            {
                                if (r.SectionId == b)
                                {
                                    db.Results.Remove(r);
                                }
                            }

                        }
                    }

                }
            }

            foreach (Teacher t in db.Teachers)
            {
                if (t.Id == id)
                {
                    db.Teachers.Remove(t);

                }
            }

            foreach (Person s in db.People)
            {
                if (s.Id == id)
                {
                    db.People.Remove(s);
                    break;

                }
            }
            db.SaveChanges();

            return RedirectToAction("Teacher");
        }




        // --------------------------Manage Suggestions----------------------

        public ActionResult Suggestions(string Id)
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
                            c = db.Suggestions.Where(x => (x.SuggestionId) == cl.SuggestionId || Id == null).ToList();
                            break;
                        }

                        c = db.Suggestions.Where(x => (x.SuggestionId) == 0 || Id == null).ToList();

                    }
                }
                return View(c);

            }
        }


        public ActionResult EditSuggestion(int id)
        {
            DB35Entities db = new DB35Entities();
            SuggestionsVM svm = new SuggestionsVM();

            foreach (Suggestion s in db.Suggestions)
            {
                if (s.SuggestionId == id)
                {
                    svm.Status = s.Status;
                    break;
                }
            }
            return View(svm);

        }

        [HttpPost]
        public ActionResult EditSuggestion(int id, SuggestionsVM svm)
        {
            DB35Entities db = new DB35Entities();

            db.Suggestions.Find(id).Status = db.LookUps.First(l => l.Value == "Fullfilled").Id;

            db.SaveChanges();
            return RedirectToAction("Suggestions", "Admin");

        }


    }
}


