import '../repositories/earnings_repository.dart';

class GetMonthlyRevenue {
  final EarningsRepository repository;

  GetMonthlyRevenue(this.repository);

  Future<List<double>> call() {
    return repository.getMonthlyRevenue();
  }
} 