import '../entities/salon_subscription.dart';
import '../repositories/subscription_repository.dart';

class GetAvailableSubscriptions {
  final SubscriptionRepository repository;

  GetAvailableSubscriptions(this.repository);

  Future<List<SalonSubscription>> call() async {
    return await repository.getAvailableSubscriptions();
  }
} 