import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/payment_repository_impl.dart';
import '../../domain/entities/payment_method.dart';
import '../../domain/entities/payment_intent.dart';
import '../../domain/repositories/payment_repository.dart';
import '../../domain/usecases/get_payment_methods.dart';
import '../../domain/usecases/add_payment_method.dart';
import '../../domain/usecases/process_payment.dart';

// Repository provider
final paymentRepositoryProvider = Provider<PaymentRepository>((ref) {
  return PaymentRepositoryImpl();
});

// Use case providers
final getPaymentMethodsProvider = Provider<GetPaymentMethods>((ref) {
  final repository = ref.watch(paymentRepositoryProvider);
  return GetPaymentMethods(repository);
});

final addPaymentMethodProvider = Provider<AddPaymentMethod>((ref) {
  final repository = ref.watch(paymentRepositoryProvider);
  return AddPaymentMethod(repository);
});

final processPaymentProvider = Provider<ProcessPayment>((ref) {
  final repository = ref.watch(paymentRepositoryProvider);
  return ProcessPayment(repository);
});

// State notifier for payment methods
class PaymentMethodsNotifier extends StateNotifier<AsyncValue<List<PaymentMethod>>> {
  final GetPaymentMethods _getPaymentMethods;
  final AddPaymentMethod _addPaymentMethod;

  PaymentMethodsNotifier(this._getPaymentMethods, this._addPaymentMethod)
      : super(const AsyncValue.loading());

  Future<void> loadPaymentMethods() async {
    state = const AsyncValue.loading();
    try {
      final paymentMethods = await _getPaymentMethods();
      state = AsyncValue.data(paymentMethods);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> addPaymentMethod({
    required String cardNumber,
    required String expiryMonth,
    required String expiryYear,
    required String cvc,
    required String holderName,
  }) async {
    try {
      final newPaymentMethod = await _addPaymentMethod(
        cardNumber: cardNumber,
        expiryMonth: expiryMonth,
        expiryYear: expiryYear,
        cvc: cvc,
        holderName: holderName,
      );
      
      // Add to current list
      state.whenData((paymentMethods) {
        state = AsyncValue.data([...paymentMethods, newPaymentMethod]);
      });
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

// State notifier provider for payment methods
final paymentMethodsNotifierProvider = StateNotifierProvider<PaymentMethodsNotifier, AsyncValue<List<PaymentMethod>>>((ref) {
  final getPaymentMethods = ref.watch(getPaymentMethodsProvider);
  final addPaymentMethod = ref.watch(addPaymentMethodProvider);
  return PaymentMethodsNotifier(getPaymentMethods, addPaymentMethod);
});

// State notifier for payment processing
class PaymentProcessingNotifier extends StateNotifier<AsyncValue<PaymentIntent?>> {
  final ProcessPayment _processPayment;

  PaymentProcessingNotifier(this._processPayment) : super(const AsyncValue.data(null));

  Future<void> processPayment({
    required double amount,
    required String currency,
    required String planId,
    required String planName,
    required String billingPeriod,
    String? paymentMethodId,
  }) async {
    state = const AsyncValue.loading();
    try {
      final paymentIntent = await _processPayment(
        amount: amount,
        currency: currency,
        planId: planId,
        planName: planName,
        billingPeriod: billingPeriod,
        paymentMethodId: paymentMethodId,
      );
      state = AsyncValue.data(paymentIntent);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  void reset() {
    state = const AsyncValue.data(null);
  }
}

// State notifier provider for payment processing
final paymentProcessingNotifierProvider = StateNotifierProvider<PaymentProcessingNotifier, AsyncValue<PaymentIntent?>>((ref) {
  final processPayment = ref.watch(processPaymentProvider);
  return PaymentProcessingNotifier(processPayment);
}); 