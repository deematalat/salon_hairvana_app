import '../../domain/entities/salon_subscription.dart';
import '../../domain/repositories/subscription_repository.dart';

class SubscriptionRepositoryImpl implements SubscriptionRepository {
  @override
  Future<List<SalonSubscription>> getAvailableSubscriptions() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    return [
      SalonSubscription(
        id: '1',
        planName: 'Free Plan',
        description: 'Perfect for small salons just getting started',
        price: 0.0,
        currency: 'USD',
        billingPeriod: 'monthly',
        color: '#4CAF50',
        isPopular: false,
        isFree: true,
        stylistsAllowed: 3,
        servicesLimit: 10,
        hairstylesGalleryLimit: 10,
        bookingSystem: 'Basic',
        support: 'Community-based',
        customBranding: false,
      ),
      SalonSubscription(
        id: '2',
        planName: 'Pro Plan',
        description: 'Ideal for growing salons with multiple stylists',
        price: 29.0,
        currency: 'USD',
        billingPeriod: 'monthly',
        color: '#2196F3',
        isPopular: true,
        isFree: false,
        stylistsAllowed: 10,
        servicesLimit: 50,
        hairstylesGalleryLimit: 100,
        bookingSystem: 'Advanced with calendar sync',
        support: 'Email support',
        customBranding: true,
        marketingTools: 'Basic promotions & coupons',
      ),
      SalonSubscription(
        id: '3',
        planName: 'Elite Plan',
        description: 'Complete solution for established salons',
        price: 69.0,
        currency: 'USD',
        billingPeriod: 'monthly',
        color: '#9C27B0',
        isPopular: false,
        isFree: false,
        stylistsAllowed: -1, // Unlimited
        servicesLimit: -1, // Unlimited
        hairstylesGalleryLimit: -1, // Unlimited
        bookingSystem: 'Premium with automated reminders',
        support: 'Priority chat & email',
        customBranding: true,
        marketingTools: 'Advanced campaigns, social media tools',
        clientManagement: 'CRM integration, analytics dashboard',
        customDomain: 'Custom domain included',
      ),
    ];
  }

  @override
  Future<void> subscribeToSalon(String salonId) async {
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 300));
    print('Subscribed to plan: $salonId');
  }

  @override
  Future<List<SalonSubscription>> getSubscribedSalons() async {
    // For now, return empty list - this would be implemented based on user's subscriptions
    return [];
  }
} 