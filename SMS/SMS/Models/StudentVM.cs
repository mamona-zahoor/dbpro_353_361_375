using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SMS.Models
{
    public class StudentVM:PersonVM
    {
        public int ClassId { get; set; }
        public int SectionId { get; set; }
        public string Password { get; set; }
        public string SecretQuestion { get; set; }
        public string SecretAnswer { get; set; }
        public string Name { get; set; }
    }
}