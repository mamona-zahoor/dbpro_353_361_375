using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SMS.Models
{
    public class SuggestionsVM
    {
        public int PersonId { get; set; }
        public int SuggestionId { get; set; }
        public string Subject { get; set; }
        public string Description { get; set; }
        public int Status { get; set; }
    }
}