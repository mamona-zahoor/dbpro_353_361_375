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
    
    public partial class StudentResult
    {
        public int Id { get; set; }
        public int ResultId { get; set; }
        public int StudentId { get; set; }
        public decimal ObtainedMarks { get; set; }
    
        public virtual Result Result { get; set; }
        public virtual Student Student { get; set; }
    }
}
