import '../../domain/entities/payment_method.dart';
import '../../domain/entities/payment_intent.dart';
import '../../domain/repositories/payment_repository.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  @override
  Future<List<PaymentMethod>> getPaymentMethods() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    // Return mock saved payment methods
    return [
      PaymentMethod(
        id: 'pm_1',
        type: 'card',
        last4: '4242',
        brand: 'visa',
        holderName: 'John Doe',
        expiryMonth: '12',
        expiryYear: '2025',
        isDefault: true,
      ),
    ];
  }

  @override
  Future<PaymentMethod> addPaymentMethod({
    required String cardNumber,
    required String expiryMonth,
    required String expiryYear,
    required String cvc,
    required String holderName,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 800));
    
    // Validate card number (basic validation)
    if (cardNumber.length < 13 || cardNumber.length > 19) {
      throw Exception('Invalid card number');
    }
    
    // Extract last 4 digits
    final last4 = cardNumber.substring(cardNumber.length - 4);
    
    // Determine card brand based on first digit
    String brand = 'unknown';
    if (cardNumber.startsWith('4')) {
      brand = 'visa';
    } else if (cardNumber.startsWith('5')) {
      brand = 'mastercard';
    } else if (cardNumber.startsWith('3')) {
      brand = 'amex';
    }
    
    return PaymentMethod(
      id: 'pm_${DateTime.now().millisecondsSinceEpoch}',
      type: 'card',
      last4: last4,
      brand: brand,
      holderName: holderName,
      expiryMonth: expiryMonth,
      expiryYear: expiryYear,
      isDefault: false,
    );
  }

  @override
  Future<PaymentIntent> createPaymentIntent({
    required double amount,
    required String currency,
    required String planId,
    required String planName,
    required String billingPeriod,
    String? paymentMethodId,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 600));
    
    return PaymentIntent(
      id: 'pi_${DateTime.now().millisecondsSinceEpoch}',
      amount: amount,
      currency: currency,
      status: 'pending',
      planId: planId,
      planName: planName,
      billingPeriod: billingPeriod,
      createdAt: DateTime.now(),
      paymentMethodId: paymentMethodId,
    );
  }

  @override
  Future<PaymentIntent> confirmPayment({
    required String paymentIntentId,
    required String paymentMethodId,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 1000));
    
    // Simulate payment processing
    final success = DateTime.now().millisecondsSinceEpoch % 10 != 0; // 90% success rate
    
    if (!success) {
      throw Exception('Payment failed. Please try again.');
    }
    
    return PaymentIntent(
      id: paymentIntentId,
      amount: 29.0, // Mock amount
      currency: 'USD',
      status: 'succeeded',
      planId: '2', // Pro plan
      planName: 'Pro Plan',
      billingPeriod: 'monthly',
      createdAt: DateTime.now(),
      paymentMethodId: paymentMethodId,
    );
  }

  @override
  Future<void> deletePaymentMethod(String paymentMethodId) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));
    print('Deleted payment method: $paymentMethodId');
  }
} 