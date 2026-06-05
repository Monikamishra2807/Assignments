using System;
using System.Collections.Generic;
using System.Text;

namespace SmartCourierManagementSystem.Notifications
{
    internal class WhatsAppNotificationService : INotificationService
    {
        public void SendNotification(string message)
        {
            Console.WriteLine($"Whatsapp Notification: {message}");
        }
    }
}
