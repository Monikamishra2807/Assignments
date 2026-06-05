using System;
using System.Collections.Generic;
using System.Text;

namespace SmartCourierManagementSystem.Models
{
    internal class CourierBooking
    {
        public Customer Customer { get; set; }
        public Parcel Parcel { get; set; }
        public String DeliveryType {  get; set; }
    }
}
