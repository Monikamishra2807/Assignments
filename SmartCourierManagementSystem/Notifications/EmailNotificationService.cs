using System;
using System.Collections.Generic;
using System.Text;

namespace SmartCourierManagementSystem.Notifications
{
    internal class EmailNotificationService : INotificationService
    {
        public void SendNotification(string message)
        {
            Console.WriteLine($"Email notification : {message}");
        }
    }
}
