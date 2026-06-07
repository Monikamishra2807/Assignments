using ConsoleAppplication.Service;

namespace ConsoleApplication
{
    internal class Program
    {
        static void Main(string[] args)
        {
            OrderBillingService service = new OrderBillingService();

            Console.Write("Enter Product Price : ");
            decimal productPrice = Convert.ToDecimal(Console.ReadLine());

            Console.Write("Enter Quantity : ");
            int quantity = Convert.ToInt32(Console.ReadLine());

            try
            {
                decimal subTotal = service.CalculateSubTotal(productPrice, quantity);

                decimal discount = service.CalculateDiscount(subTotal);

                decimal amountAfterDiscount =subTotal - discount;

                decimal deliveryCharge = service.CalculateDeliveryCharge(amountAfterDiscount);

                decimal finalAmount = service.CalculateFinalAmount(productPrice, quantity);

                Console.WriteLine("\n------ BILL DETAILS ------");

                Console.WriteLine($"Sub Total : {subTotal}");

                Console.WriteLine($"Discount : {discount}");

                Console.WriteLine($"Delivery Charge : {deliveryCharge}");

                Console.WriteLine($"Final Amount : {finalAmount}");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            Console.ReadLine();
        }
    }
}