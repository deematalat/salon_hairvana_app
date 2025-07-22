import '../entities/earning.dart';
 
abstract class EarningsRepository {
  Future<List<double>> getMonthlyRevenue();
  Future<List<Earning>> getTransactionHistory();
} 