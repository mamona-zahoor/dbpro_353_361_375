using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SMS.Models
{
    public class SectionVM
    {
        public int SectionId { get; set; }
        public string Name { get; set; }
        public int NumOfStudents { get; set; }
        public int TeacherId { get; set; }
    }
}