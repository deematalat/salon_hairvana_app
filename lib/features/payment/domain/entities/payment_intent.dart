class PaymentIntent {
  final String id;
  final double amount;
  final String currency;
  final String status; // 'pending', 'succeeded', 'failed', 'canceled'
  final String planId;
  final String planName;
  final String billingPeriod;
  final DateTime createdAt;
  final String? paymentMethodId;

  const PaymentIntent({
    required this.id,
    required this.amount,
    required this.currency,
    required this.status,
    required this.planId,
    required this.planName,
    required this.billingPeriod,
    required this.createdAt,
    this.paymentMethodId,
  });
} 