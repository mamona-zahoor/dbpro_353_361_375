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
    
    public partial class SectionTimetable
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SectionTimetable()
        {
            this.Lectures = new HashSet<Lecture>();
        }
    
        public int TimetableId { get; set; }
        public string Day { get; set; }
        public int Id { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Lecture> Lectures { get; set; }
        public virtual Timetable Timetable { get; set; }
    }
}
