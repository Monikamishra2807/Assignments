using SmartCourierManagementSystem.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace SmartCourierManagementSystem.Invoices
{
    internal interface IInvoiceGenerator
    {
        void GenerateInvoice(CourierBooking booking, double charge);
    }
}
