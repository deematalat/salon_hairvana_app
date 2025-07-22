import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/earning.dart';
import '../../domain/usecases/get_monthly_revenue.dart';
import '../../domain/usecases/get_transaction_history.dart';
import '../../data/repositories/earnings_repository_impl.dart';

// 1. Repository Provider
final earningsRepositoryProvider = Provider<EarningsRepositoryImpl>((ref) {
  return EarningsRepositoryImpl();
});

// 2. Use Case Providers
final getMonthlyRevenueProvider = Provider<GetMonthlyRevenue>((ref) {
  final repository = ref.watch(earningsRepositoryProvider);
  return GetMonthlyRevenue(repository);
});

final getTransactionHistoryProvider = Provider<GetTransactionHistory>((ref) {
  final repository = ref.watch(earningsRepositoryProvider);
  return GetTransactionHistory(repository);
});

// 3. State Notifier Provider for the screen
class EarningsState {
  final List<double> monthlyRevenue;
  final List<Earning> transactionHistory;

  EarningsState({
    this.monthlyRevenue = const [],
    this.transactionHistory = const [],
  });

  EarningsState copyWith({
    List<double>? monthlyRevenue,
    List<Earning>? transactionHistory,
  }) {
    return EarningsState(
      monthlyRevenue: monthlyRevenue ?? this.monthlyRevenue,
      transactionHistory: transactionHistory ?? this.transactionHistory,
    );
  }
}

final earningsNotifierProvider = StateNotifierProvider<EarningsNotifier, EarningsState>((ref) {
  final getMonthlyRevenue = ref.watch(getMonthlyRevenueProvider);
  final getTransactionHistory = ref.watch(getTransactionHistoryProvider);
  return EarningsNotifier(getMonthlyRevenue, getTransactionHistory);
});

class EarningsNotifier extends StateNotifier<EarningsState> {
  final GetMonthlyRevenue _getMonthlyRevenue;
  final GetTransactionHistory _getTransactionHistory;

  EarningsNotifier(this._getMonthlyRevenue, this._getTransactionHistory) : super(EarningsState()) {
    loadEarnings();
  }

  Future<void> loadEarnings() async {
    final revenue = await _getMonthlyRevenue();
    final transactions = await _getTransactionHistory();
    state = state.copyWith(
      monthlyRevenue: revenue,
      transactionHistory: transactions,
    );
  }
} 