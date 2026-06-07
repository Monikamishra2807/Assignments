using NUnit.Framework;
using ConsoleAppplication.Service;
using System;

namespace ConsoleApplication.Tests;

[TestFixture]
public class OrderBillingServiceTests
{
    private OrderBillingService service;

    [SetUp]
    public void Setup()
    {
        service = new OrderBillingService();
    }

    [Test]
    public void CalculateSubTotal_ValidInputs_ReturnsSubtotal()
    {
        decimal result =
            service.CalculateSubTotal(1000, 2);

        Assert.That(result, Is.EqualTo(2000));
    }

    [Test]
    public void CalculateSubTotal_ProductPriceZero_ThrowsException()
    {
        Assert.Throws<ArgumentException>(() =>
            service.CalculateSubTotal(0, 2));
    }

    [Test]
    public void CalculateSubTotal_ProductPriceNegative_ThrowsException()
    {
        Assert.Throws<ArgumentException>(() =>
            service.CalculateSubTotal(-100, 2));
    }

    [Test]
    public void CalculateSubTotal_QuantityZero_ThrowsException()
    {
        Assert.Throws<ArgumentException>(() =>
            service.CalculateSubTotal(100, 0));
    }

    [Test]
    public void CalculateSubTotal_QuantityNegative_ThrowsException()
    {
        Assert.Throws<ArgumentException>(() =>
            service.CalculateSubTotal(100, -1));
    }

    [Test]
    public void CalculateDiscount_Above5000_Returns10Percent()
    {
        decimal result =
            service.CalculateDiscount(6000);

        Assert.That(result, Is.EqualTo(600));
    }

    [Test]
    public void CalculateDiscount_Between2000And4999_Returns5Percent()
    {
        decimal result =
            service.CalculateDiscount(3000);

        Assert.That(result, Is.EqualTo(150));
    }

    [Test]
    public void CalculateDiscount_Below2000_ReturnsZero()
    {
        decimal result =
            service.CalculateDiscount(1500);

        Assert.That(result, Is.EqualTo(0));
    }

    [Test]
    public void CalculateDeliveryCharge_LessThan1000_Returns100()
    {
        decimal result =
            service.CalculateDeliveryCharge(900);

        Assert.That(result, Is.EqualTo(100));
    }

    [Test]
    public void CalculateDeliveryCharge_GreaterThanOrEqual1000_ReturnsZero()
    {
        decimal result =
            service.CalculateDeliveryCharge(1000);

        Assert.That(result, Is.EqualTo(0));
    }

    [Test]
    public void CalculateFinalAmount_With10PercentDiscount()
    {
        decimal result =
            service.CalculateFinalAmount(1000, 6);

        Assert.That(result, Is.EqualTo(5400));
    }

    [Test]
    public void CalculateFinalAmount_With5PercentDiscount()
    {
        decimal result =
            service.CalculateFinalAmount(1000, 3);

        Assert.That(result, Is.EqualTo(2850));
    }

    [Test]
    public void CalculateFinalAmount_NoDiscount_FreeDelivery()
    {
        decimal result =
            service.CalculateFinalAmount(1500, 1);

        Assert.That(result, Is.EqualTo(1500));
    }

    [Test]
    public void CalculateFinalAmount_NoDiscount_WithDeliveryCharge()
    {
        decimal result =
            service.CalculateFinalAmount(500, 1);

        Assert.That(result, Is.EqualTo(600));
    }
}