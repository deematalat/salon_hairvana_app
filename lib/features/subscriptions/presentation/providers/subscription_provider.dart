import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/subscription_repository_impl.dart';
import '../../domain/entities/salon_subscription.dart';
import '../../domain/repositories/subscription_repository.dart';
import '../../domain/usecases/get_available_subscriptions.dart';
import '../../domain/usecases/subscribe_to_salon.dart';

// Repository provider
final subscriptionRepositoryProvider = Provider<SubscriptionRepository>((ref) {
  return SubscriptionRepositoryImpl();
});

// Use case providers
final getAvailableSubscriptionsProvider = Provider<GetAvailableSubscriptions>((ref) {
  final repository = ref.watch(subscriptionRepositoryProvider);
  return GetAvailableSubscriptions(repository);
});

final subscribeToSalonProvider = Provider<SubscribeToSalon>((ref) {
  final repository = ref.watch(subscriptionRepositoryProvider);
  return SubscribeToSalon(repository);
});

// State notifier for subscriptions
class SubscriptionNotifier extends StateNotifier<AsyncValue<List<SalonSubscription>>> {
  final GetAvailableSubscriptions _getAvailableSubscriptions;
  final SubscribeToSalon _subscribeToSalon;

  SubscriptionNotifier(this._getAvailableSubscriptions, this._subscribeToSalon)
      : super(const AsyncValue.loading());

  Future<void> loadSubscriptions() async {
    state = const AsyncValue.loading();
    try {
      final subscriptions = await _getAvailableSubscriptions();
      state = AsyncValue.data(subscriptions);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> subscribeToSalon(String salonId) async {
    try {
      await _subscribeToSalon(salonId);
      // Optionally reload subscriptions or update state
    } catch (error, stackTrace) {
      // Handle error
      print('Error subscribing to salon: $error');
    }
  }
}

// State notifier provider
final subscriptionNotifierProvider = StateNotifierProvider<SubscriptionNotifier, AsyncValue<List<SalonSubscription>>>((ref) {
  final getAvailableSubscriptions = ref.watch(getAvailableSubscriptionsProvider);
  final subscribeToSalon = ref.watch(subscribeToSalonProvider);
  return SubscriptionNotifier(getAvailableSubscriptions, subscribeToSalon);
}); 