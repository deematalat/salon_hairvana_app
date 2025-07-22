import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../auth/sign_in_screen.dart';

final onboardingViewModelProvider =
    ChangeNotifierProvider((ref) => OnboardingViewModel());

class OnboardingPageData {
  final IconData icon;
  final String title;
  final String description;

  OnboardingPageData({
    required this.icon,
    required this.title,
    required this.description,
  });
}

class OnboardingViewModel extends ChangeNotifier {
  final pageController = PageController();
  int currentPage = 0;

  final List<OnboardingPageData> pages = [
    OnboardingPageData(
      icon: FontAwesomeIcons.calendar,
      title: 'Effortless Booking Management',
      description:
          'Streamline your appointments, reduce no-shows, and keep your schedule organized with ease.',
    ),
    OnboardingPageData(
      icon: FontAwesomeIcons.user,
      title: 'Empower Your Stylists',
      description:
          'Manage stylist profiles, track performance, and optimize their availability for maximum efficiency.',
    ),
    OnboardingPageData(
      icon: FontAwesomeIcons.dollarSign,
      title: "Boost Your Salon's Revenue",
      description:
          'Gain insights into your earnings, manage services, and grow your business with smart analytics.',
    ),
  ];

  bool get isLastPage => currentPage == pages.length - 1;

  void onPageChanged(int index) {
    currentPage = index;
    notifyListeners();
  }

  void onNext() {
    if (!isLastPage) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void onBack() {
    if (currentPage > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void onGetStarted(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pushReplacement(
      MaterialPageRoute(builder: (_) => const SignInScreen()),
    );
  }

  void onIndicatorTapped(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
} 