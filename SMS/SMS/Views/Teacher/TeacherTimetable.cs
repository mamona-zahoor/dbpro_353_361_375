//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SMS.Views.Teacher
{
    using System;
    using System.Collections.Generic;
    
    public partial class TeacherTimetable
    {
        public int TId { get; set; }
        public Nullable<int> Lecture1 { get; set; }
        public Nullable<int> Lecture2 { get; set; }
        public Nullable<int> Lecture3 { get; set; }
        public Nullable<int> Lecture4 { get; set; }
        public Nullable<int> Lecture5 { get; set; }
        public int ID { get; set; }
        public Nullable<int> Class1 { get; set; }
        public Nullable<int> Class2 { get; set; }
        public Nullable<int> Class3 { get; set; }
        public Nullable<int> Class4 { get; set; }
        public Nullable<int> Class5 { get; set; }
    
        public virtual Cours Cours { get; set; }
        public virtual Cours Cours1 { get; set; }
        public virtual Cours Cours2 { get; set; }
        public virtual Cours Cours3 { get; set; }
        public virtual Cours Cours4 { get; set; }
        public virtual Ttable Ttable { get; set; }
    }
}
