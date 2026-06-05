using SmartCourierManagementSystem.DeliveryCalculator;
using SmartCourierManagementSystem.Invoices;
using SmartCourierManagementSystem.Models;
using SmartCourierManagementSystem.Notifications;
using System;
using System.Collections.Generic;
using System.Text;

namespace SmartCourierManagementSystem.Services
{
    internal class CourierBookingService
    {
        private readonly IDeliveryChargeCalculator _calculator;
        private readonly IInvoiceGenerator _invoice;
        private readonly INotificationService _notification;
        public CourierBookingService(IDeliveryChargeCalculator calculator, INotificationService notification,IInvoiceGenerator invoice)
        {
            _calculator = calculator;
            _invoice = invoice;
            _notification = notification;
        }
        public void BookCourier(CourierBooking booking)
        {
            double charge =
                _calculator.CalculateCharge(booking.Parcel.weight);

            _notification.SendNotification(
                "Your courier booking is confirmed.");

            _invoice.GenerateInvoice(booking, charge);
        }

    }
}
