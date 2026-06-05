using System;
using System.Collections.Generic;
using System.Text;

namespace SmartCourierManagementSystem.Notifications
{
    internal class SmsNotificationService : INotificationService
    {
        public void SendNotification(string message)
        {
            Console.WriteLine($"Sms Notification {message}");
        }

    }
}
