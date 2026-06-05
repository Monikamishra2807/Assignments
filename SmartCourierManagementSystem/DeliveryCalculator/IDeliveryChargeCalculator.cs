using System;
using System.Collections.Generic;
using System.Text;

namespace SmartCourierManagementSystem.DeliveryCalculator
{
    internal interface IDeliveryChargeCalculator
    {
        double CalculateCharge(double weight);
    }
}
