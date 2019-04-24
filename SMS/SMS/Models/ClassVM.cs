using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SMS.Models
{
    public class ClassVM
    {
        public int ClassId { get; set; }
        public string Name { get; set; }
        public int NumOfStudents { get; set; }
        public System.DateTime CreatedOn { get; set; }
    }
}