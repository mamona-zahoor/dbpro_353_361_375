using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO.Compression;
namespace SMS.Models
{
    public class SubmitFiles
    {
        public int Id { get; set; }
        public int SubmittedBy { get; set; }
        public int Assignemnt { get; set; }
        public System.DateTime Submited_On { get; set; }
        public string FileName { get; set; }
        public byte[] Content { get; set; }
      
    }
}