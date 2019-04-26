using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SMS.Models
{
    public class PersonVM
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Contact { get; set; }
        public int Gender { get; set; }
        public string Address { get; set; }
        public System.DateTime DateOfBirth { get; set; }
        public string RegNo { get; set; }
        public string Email { get; set; }
    }
}