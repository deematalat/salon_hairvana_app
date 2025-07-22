import '../entities/payment_intent.dart';
import '../repositories/payment_repository.dart';

class ProcessPayment {
  final PaymentRepository repository;

  ProcessPayment(this.repository);

  Future<PaymentIntent> call({
    required double amount,
    required String currency,
    required String planId,
    required String planName,
    required String billingPeriod,
    String? paymentMethodId,
  }) async {
    // Create payment intent
    final paymentIntent = await repository.createPaymentIntent(
      amount: amount,
      currency: currency,
      planId: planId,
      planName: planName,
      billingPeriod: billingPeriod,
      paymentMethodId: paymentMethodId,
    );

    // Confirm payment if payment method is provided
    if (paymentMethodId != null) {
      return await repository.confirmPayment(
        paymentIntentId: paymentIntent.id,
        paymentMethodId: paymentMethodId,
      );
    }

    return paymentIntent;
  }
} 