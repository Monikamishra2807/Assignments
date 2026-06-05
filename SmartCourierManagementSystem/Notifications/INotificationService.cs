using System;
using System.Collections.Generic;
using System.Text;

namespace SmartCourierManagementSystem.Notifications
{
    internal interface INotificationService
    {
        void SendNotification(string message);
    }
}
