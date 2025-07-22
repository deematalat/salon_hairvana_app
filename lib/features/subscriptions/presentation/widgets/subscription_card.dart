import 'package:flutter/material.dart';
import '../../domain/entities/salon_subscription.dart';
import '../../../payment/presentation/screens/payment_screen.dart';

class SubscriptionCard extends StatelessWidget {
  final SalonSubscription subscription;
  final VoidCallback onSubscribe;

  const SubscriptionCard({
    Key? key,
    required this.subscription,
    required this.onSubscribe,
  }) : super(key: key);

  Color _hexToColor(String hex) {
    hex = hex.replaceAll('#', '');
    return Color(int.parse('FF${hex}', radix: 16));
  }

  String _formatLimit(int limit) {
    if (limit == -1) return 'Unlimited';
    return limit.toString();
  }

  void _handlePlanSelection(BuildContext context) {
    if (subscription.isFree) {
      // For free plans, directly call the subscription callback
      onSubscribe();
    } else {
      // For paid plans, navigate to payment screen
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PaymentScreen(plan: subscription),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = _hexToColor(subscription.color);
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 8),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with gradient
          Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [primaryColor, primaryColor.withOpacity(0.7)],
              ),
            ),
            child: Stack(
              children: [
                // Popular badge
                if (subscription.isPopular)
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.star, color: primaryColor, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            'Most Popular',
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                // Plan info
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          // Plan icon
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              subscription.isFree ? Icons.free_breakfast : Icons.workspace_premium,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  subscription.planName,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  subscription.isFree ? 'Free Forever' : '\$${subscription.price.toStringAsFixed(0)}/${subscription.billingPeriod}',
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Description
                Text(
                  subscription.description,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.textTheme.bodyMedium?.color?.withOpacity(0.8),
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 20),
                // Features
                _buildFeatureRow('Stylists allowed', _formatLimit(subscription.stylistsAllowed), theme, primaryColor),
                _buildFeatureRow('Services you can list', _formatLimit(subscription.servicesLimit), theme, primaryColor),
                _buildFeatureRow('Hairstyles gallery limit', _formatLimit(subscription.hairstylesGalleryLimit), theme, primaryColor),
                _buildFeatureRow('Booking system', subscription.bookingSystem, theme, primaryColor),
                _buildFeatureRow('Support', subscription.support, theme, primaryColor),
                _buildFeatureRow('Custom branding', subscription.customBranding ? '✅ Included' : '❌ Not included', theme, primaryColor),
                
                if (subscription.marketingTools != null)
                  _buildFeatureRow('Marketing tools', subscription.marketingTools!, theme, primaryColor),
                
                if (subscription.clientManagement != null)
                  _buildFeatureRow('Client management', subscription.clientManagement!, theme, primaryColor),
                
                if (subscription.customDomain != null)
                  _buildFeatureRow('Custom domain', subscription.customDomain!, theme, primaryColor),
                
                const SizedBox(height: 20),
                // Subscribe button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => _handlePlanSelection(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      subscription.isFree ? 'Get Started Free' : 'Choose Plan',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureRow(String label, String value, ThemeData theme, Color primaryColor) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.check_circle,
            color: primaryColor,
            size: 18,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  value,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.textTheme.bodyMedium?.color?.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 