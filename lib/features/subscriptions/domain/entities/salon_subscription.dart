class SalonSubscription {
  final String id;
  final String planName;
  final String description;
  final double price;
  final String currency;
  final String billingPeriod;
  final String color;
  final bool isPopular;
  final bool isFree;
  
  // Plan features
  final int stylistsAllowed;
  final int servicesLimit;
  final int hairstylesGalleryLimit;
  final String bookingSystem;
  final String support;
  final bool customBranding;
  final String? marketingTools;
  final String? clientManagement;
  final String? customDomain;

  const SalonSubscription({
    required this.id,
    required this.planName,
    required this.description,
    required this.price,
    required this.currency,
    required this.billingPeriod,
    required this.color,
    required this.isPopular,
    required this.isFree,
    required this.stylistsAllowed,
    required this.servicesLimit,
    required this.hairstylesGalleryLimit,
    required this.bookingSystem,
    required this.support,
    required this.customBranding,
    this.marketingTools,
    this.clientManagement,
    this.customDomain,
  });
} 