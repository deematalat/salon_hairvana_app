import '../entities/payment_method.dart';
import '../entities/payment_intent.dart';

abstract class PaymentRepository {
  Future<List<PaymentMethod>> getPaymentMethods();
  Future<PaymentMethod> addPaymentMethod({
    required String cardNumber,
    required String expiryMonth,
    required String expiryYear,
    required String cvc,
    required String holderName,
  });
  Future<PaymentIntent> createPaymentIntent({
    required double amount,
    required String currency,
    required String planId,
    required String planName,
    required String billingPeriod,
    String? paymentMethodId,
  });
  Future<PaymentIntent> confirmPayment({
    required String paymentIntentId,
    required String paymentMethodId,
  });
  Future<void> deletePaymentMethod(String paymentMethodId);
} 