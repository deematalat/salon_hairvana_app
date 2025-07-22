import '../entities/app_settings.dart';
import '../repositories/app_settings_repository.dart';

class SaveAppSettings {
  final AppSettingsRepository repository;

  SaveAppSettings(this.repository);

  Future<void> call(AppSettings appSettings) {
    return repository.saveAppSettings(appSettings);
  }
} 