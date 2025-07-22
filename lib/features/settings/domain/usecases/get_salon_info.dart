import '../entities/salon_info.dart';
import '../repositories/salon_repository.dart';

class GetSalonInfo {
  final SalonRepository repository;

  GetSalonInfo(this.repository);

  Future<SalonInfo> call() {
    return repository.getSalonInfo();
  }
} 