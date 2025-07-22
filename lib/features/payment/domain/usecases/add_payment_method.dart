import '../entities/payment_method.dart';
import '../repositories/payment_repository.dart';

class AddPaymentMethod {
  final PaymentRepository repository;

  AddPaymentMethod(this.repository);

  Future<PaymentMethod> call({
    required String cardNumber,
    required String expiryMonth,
    required String expiryYear,
    required String cvc,
    required String holderName,
  }) async {
    return await repository.addPaymentMethod(
      cardNumber: cardNumber,
      expiryMonth: expiryMonth,
      expiryYear: expiryYear,
      cvc: cvc,
      holderName: holderName,
    );
  }
} 