import '../entities/salon_info.dart';
import '../repositories/salon_repository.dart';

class SaveSalonInfo {
  final SalonRepository repository;

  SaveSalonInfo(this.repository);

  Future<void> call(SalonInfo salonInfo) {
    return repository.saveSalonInfo(salonInfo);
  }
} 