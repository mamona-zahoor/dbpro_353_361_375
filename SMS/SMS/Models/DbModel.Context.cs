﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SMS.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class DB35Entities : DbContext
    {
        public DB35Entities()
            : base("name=DB35Entities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Assignment> Assignments { get; set; }
        public virtual DbSet<Attendance> Attendances { get; set; }
        public virtual DbSet<Class> Classes { get; set; }
        public virtual DbSet<ClassDateSheet> ClassDateSheets { get; set; }
        public virtual DbSet<ClassSection> ClassSections { get; set; }
        public virtual DbSet<Cours> Courses { get; set; }
        public virtual DbSet<DateSheet> DateSheets { get; set; }
        public virtual DbSet<FeeChallan> FeeChallans { get; set; }
        public virtual DbSet<Lecture> Lectures { get; set; }
        public virtual DbSet<LookUp> LookUps { get; set; }
        public virtual DbSet<Payroll> Payrolls { get; set; }
        public virtual DbSet<Person> People { get; set; }
        public virtual DbSet<Result> Results { get; set; }
        public virtual DbSet<Section> Sections { get; set; }
        public virtual DbSet<SectionTimetable> SectionTimetables { get; set; }
        public virtual DbSet<StuAssignmentMark> StuAssignmentMarks { get; set; }
        public virtual DbSet<Student> Students { get; set; }
        public virtual DbSet<StudentAttendance> StudentAttendances { get; set; }
        public virtual DbSet<Suggestion> Suggestions { get; set; }
        public virtual DbSet<Teacher> Teachers { get; set; }
        public virtual DbSet<Timetable> Timetables { get; set; }
        public virtual DbSet<Admin> Admins { get; set; }
        public virtual DbSet<StudentResult> StudentResults { get; set; }
    }
}
