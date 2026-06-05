
using SmartCourierManagementSystem.DeliveryCalculator;
using SmartCourierManagementSystem.Invoices;
using SmartCourierManagementSystem.Models;
using SmartCourierManagementSystem.Notifications;
using SmartCourierManagementSystem.Services;
using System;

namespace SmartCourierManagementSystem
{
    class Program
    {
        static void Main(string[] args)
        {
            Customer customer = new Customer();

            Console.Write("Enter Customer Name: ");
            customer.Name = Console.ReadLine();

            Console.Write("Enter Email: ");
            customer.Email = Console.ReadLine();

            Console.Write("Enter Mobile Number: ");
            customer.Phone = Console.ReadLine();

            Parcel parcel = new Parcel();

            Console.Write("Enter Parcel Weight: ");
            parcel.weight = Convert.ToDouble(Console.ReadLine());

            Console.Write("Enter Source City: ");
            parcel.SourceCity = Console.ReadLine();

            Console.Write("Enter Destination City: ");
            parcel.DestinationCity = Console.ReadLine();

            Console.WriteLine("\nDelivery Types");
            Console.WriteLine("1. Standard");
            Console.WriteLine("2. Express");
            Console.WriteLine("3. International");

            Console.Write("Choose Delivery Type: ");
            int deliveryChoice = Convert.ToInt32(Console.ReadLine());

            IDeliveryChargeCalculator calculator = null;
            string deliveryType = "";

            switch (deliveryChoice)
            {
                case 1:
                    calculator =  new StandardDeliveryCalculator();
                    deliveryType = "Standard";
                    break;

                case 2:
                    calculator = new ExpressDeliveryCalculator();
                    deliveryType = "Express";
                    break;

                case 3:
                    calculator = new InternationalDeliveryCalculator();
                    deliveryType = "International";
                    break;
            }

            Console.WriteLine("\nNotification Types");
            Console.WriteLine("1. Email");
            Console.WriteLine("2. SMS");
            Console.WriteLine("3. WhatsApp");

            Console.Write("Choose Notification Type: ");
            int notificationChoice =
                Convert.ToInt32(Console.ReadLine());

            INotificationService notification = null;

            switch (notificationChoice)
            {
                case 1:
                    notification = new EmailNotificationService();
                    break;

                case 2:
                    notification = new SmsNotificationService();
                    break;

                case 3:
                    notification = new WhatsAppNotificationService();
                    break;
            }

            CourierBooking booking = new CourierBooking
                {
                    Customer = customer,
                    Parcel = parcel,
                    DeliveryType = deliveryType
                };

            IInvoiceGenerator invoice = new ConsoleInvoiceGenerator();

            CourierBookingService service =
                new CourierBookingService(
                    calculator,
                    notification,
                    invoice);

            service.BookCourier(booking);

            Console.ReadKey();
        }
    }
}