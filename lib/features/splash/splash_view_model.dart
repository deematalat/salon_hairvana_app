import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';

final splashViewModelProvider =
    StateNotifierProvider<SplashViewModel, SplashState>(
  (ref) => SplashViewModel(),
);

class SplashState {
  final bool isCompleted;
  SplashState({required this.isCompleted});
}

class SplashViewModel extends StateNotifier<SplashState> {
  SplashViewModel() : super(SplashState(isCompleted: false)) {
    _startSplash();
  }

  Future<void> _startSplash() async {
    await Future.delayed(const Duration(seconds: 2));
    state = SplashState(isCompleted: true);
  }
} 