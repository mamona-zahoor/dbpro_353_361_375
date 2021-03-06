//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class Attendance
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Attendance()
        {
            this.StudentAttendances = new HashSet<StudentAttendance>();
        }
    
        public int AttendanceId { get; set; }
        public int TeacherId { get; set; }
        public System.DateTime AttendanceDate { get; set; }
        public int SectionId { get; set; }
        public int ClassId { get; set; }
    
        public virtual Class Class { get; set; }
        public virtual Section Section { get; set; }
        public virtual Teacher Teacher { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<StudentAttendance> StudentAttendances { get; set; }
    }
}
