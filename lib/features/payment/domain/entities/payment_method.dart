class PaymentMethod {
  final String id;
  final String type; // 'card', 'bank_account', etc.
  final String last4;
  final String brand; // 'visa', 'mastercard', 'amex', etc.
  final String holderName;
  final String expiryMonth;
  final String expiryYear;
  final bool isDefault;

  const PaymentMethod({
    required this.id,
    required this.type,
    required this.last4,
    required this.brand,
    required this.holderName,
    required this.expiryMonth,
    required this.expiryYear,
    required this.isDefault,
  });
} 