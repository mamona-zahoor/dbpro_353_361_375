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
    
    public partial class SubmittedAssign
    {
        public int Id { get; set; }
        public int SubmittedBy { get; set; }
        public int Assignemnt { get; set; }
        public System.DateTime Submited_On { get; set; }
        public string FileName { get; set; }
        public string Path { get; set; }
    
        public virtual Assignment Assignment { get; set; }
        public virtual Student Student { get; set; }
    }
}