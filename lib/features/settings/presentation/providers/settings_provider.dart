import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/salon_info.dart';
import '../../domain/entities/app_settings.dart';
import '../../domain/usecases/get_salon_info.dart';
import '../../domain/usecases/save_salon_info.dart';
import '../../domain/usecases/get_app_settings.dart';
import '../../domain/usecases/save_app_settings.dart';
import '../../data/repositories/salon_repository_impl.dart';
import '../../data/repositories/app_settings_repository_impl.dart';

// 1. Repository Providers
final salonRepositoryProvider = Provider<SalonRepositoryImpl>((ref) {
  return SalonRepositoryImpl();
});

final appSettingsRepositoryProvider = Provider<AppSettingsRepositoryImpl>((ref) {
  return AppSettingsRepositoryImpl();
});

// 2. Use Case Providers
final getSalonInfoProvider = Provider<GetSalonInfo>((ref) {
  final repository = ref.watch(salonRepositoryProvider);
  return GetSalonInfo(repository);
});

final saveSalonInfoProvider = Provider<SaveSalonInfo>((ref) {
  final repository = ref.watch(salonRepositoryProvider);
  return SaveSalonInfo(repository);
});

final getAppSettingsProvider = Provider<GetAppSettings>((ref) {
  final repository = ref.watch(appSettingsRepositoryProvider);
  return GetAppSettings(repository);
});

final saveAppSettingsProvider = Provider<SaveAppSettings>((ref) {
  final repository = ref.watch(appSettingsRepositoryProvider);
  return SaveAppSettings(repository);
});

// 3. State Notifier Provider for the screen
class SettingsState {
  final SalonInfo salonInfo;
  final AppSettings appSettings;

  SettingsState({
    required this.salonInfo,
    required this.appSettings,
  });

  SettingsState copyWith({
    SalonInfo? salonInfo,
    AppSettings? appSettings,
  }) {
    return SettingsState(
      salonInfo: salonInfo ?? this.salonInfo,
      appSettings: appSettings ?? this.appSettings,
    );
  }
}

final settingsNotifierProvider = StateNotifierProvider<SettingsNotifier, SettingsState>((ref) {
  final getSalonInfo = ref.watch(getSalonInfoProvider);
  final saveSalonInfo = ref.watch(saveSalonInfoProvider);
  final getAppSettings = ref.watch(getAppSettingsProvider);
  final saveAppSettings = ref.watch(saveAppSettingsProvider);
  return SettingsNotifier(getSalonInfo, saveSalonInfo, getAppSettings, saveAppSettings);
});

class SettingsNotifier extends StateNotifier<SettingsState> {
  final GetSalonInfo _getSalonInfo;
  final SaveSalonInfo _saveSalonInfo;
  final GetAppSettings _getAppSettings;
  final SaveAppSettings _saveAppSettings;

  SettingsNotifier(
    this._getSalonInfo,
    this._saveSalonInfo,
    this._getAppSettings,
    this._saveAppSettings,
  ) : super(SettingsState(
          salonInfo: const SalonInfo(name: '', address: '', logoUrl: ''),
          appSettings: const AppSettings(pushNotifications: false, darkMode: false),
        )) {
    loadSettings();
  }

  Future<void> loadSettings() async {
    final salonInfo = await _getSalonInfo();
    final appSettings = await _getAppSettings();
    state = state.copyWith(salonInfo: salonInfo, appSettings: appSettings);
  }

  Future<void> saveSalonInfo(SalonInfo salonInfo) async {
    await _saveSalonInfo(salonInfo);
    state = state.copyWith(salonInfo: salonInfo);
  }

  Future<void> saveAppSettings(AppSettings appSettings) async {
    await _saveAppSettings(appSettings);
    state = state.copyWith(appSettings: appSettings);
  }
} 