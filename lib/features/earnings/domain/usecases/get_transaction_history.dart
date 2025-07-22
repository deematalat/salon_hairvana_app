import '../entities/earning.dart';
import '../repositories/earnings_repository.dart';

class GetTransactionHistory {
  final EarningsRepository repository;

  GetTransactionHistory(this.repository);

  Future<List<Earning>> call() {
    return repository.getTransactionHistory();
  }
} 