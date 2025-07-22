import '../../domain/entities/earning.dart';
import '../../domain/repositories/earnings_repository.dart';

class EarningsRepositoryImpl implements EarningsRepository {
  @override
  Future<List<double>> getMonthlyRevenue() async {
    return [
      1200, 1500, 1100, 1800, 2000, 1700, 2100, 1900, 2200, 2300, 2500, 2400
    ];
  }

  @override
  Future<List<Earning>> getTransactionHistory() async {
    return [
      const Earning(
        service: 'Haircut (Alice Smith)',
        amount: 265.00,
        date: '2024-06-01',
        timeAgo: '2 hours ago',
      ),
      const Earning(
        service: 'Color Treatment (Bob Johnson)',
        amount: 2120.00,
        date: '2024-06-02',
        timeAgo: '1 day ago',
      ),
    ];
  }
} 