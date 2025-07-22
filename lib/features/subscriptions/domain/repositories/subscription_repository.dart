import '../entities/salon_subscription.dart';

abstract class SubscriptionRepository {
  Future<List<SalonSubscription>> getAvailableSubscriptions();
  Future<void> subscribeToSalon(String salonId);
  Future<List<SalonSubscription>> getSubscribedSalons();
} 