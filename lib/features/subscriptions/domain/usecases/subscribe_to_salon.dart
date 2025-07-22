import '../repositories/subscription_repository.dart';

class SubscribeToSalon {
  final SubscriptionRepository repository;

  SubscribeToSalon(this.repository);

  Future<void> call(String salonId) async {
    await repository.subscribeToSalon(salonId);
  }
} 