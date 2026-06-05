using SmartCourierManagementSystem.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace SmartCourierManagementSystem.Invoices
{
    internal class ConsoleInvoiceGenerator : IInvoiceGenerator
    {
        public void GenerateInvoice(CourierBooking booking, double charge)
        {
            Console.WriteLine($"Customer Name: {booking.Customer.Name}");
            Console.WriteLine($"Source City: {booking.Parcel.SourceCity}");
            Console.WriteLine($"Destination City: {booking.Parcel.DestinationCity}");
            Console.WriteLine($"Parcel Weight: {booking.Parcel.weight}kg");
            Console.WriteLine($"Delivery Type: {booking.DeliveryType}");
            Console.WriteLine($"Total Charge: Rs{charge}");
        }
    }
}
