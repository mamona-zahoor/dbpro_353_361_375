using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace SMS.Models
{
    public class AttendanceVM
    {
        public int ClassId { get; set; }
        public int ClassName { get; set; }
        public int SectionId { get; set; }
        public string SectionName { get; set; }
        public int StudentId { get; set; }
        public string RegNo { get; set; }
        public string Status { get; set; }
        [DataType(DataType.DateTime)]
        public DateTime Date { get; set; }
    }
}