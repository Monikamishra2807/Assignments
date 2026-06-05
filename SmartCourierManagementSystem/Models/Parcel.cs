using System;
using System.Collections.Generic;
using System.Text;

namespace SmartCourierManagementSystem.Models
{
    internal class Parcel
    {
        public double weight { get; set; }
        public string SourceCity {  get; set; }
        public string DestinationCity { get; set; }
    }
}
