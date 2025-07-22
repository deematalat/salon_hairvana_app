import '../../domain/entities/app_settings.dart';
import '../../domain/repositories/app_settings_repository.dart';

class AppSettingsRepositoryImpl implements AppSettingsRepository {
  @override
  Future<AppSettings> getAppSettings() async {
    return const AppSettings(
      pushNotifications: false,
      darkMode: false,
    );
  }

  @override
  Future<void> saveAppSettings(AppSettings appSettings) async {
    // In a real app, this would save to a database or shared preferences.
    print('Saving app settings: dark mode is ${appSettings.darkMode}');
  }
} 