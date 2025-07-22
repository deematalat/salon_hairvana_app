class Earning {
  final String service;
  final double amount;
  final String date;
  final String? timeAgo;

  const Earning({
    required this.service,
    required this.amount,
    required this.date,
    this.timeAgo,
  });
} 