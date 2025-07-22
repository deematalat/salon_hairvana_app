import '../../domain/entities/salon_info.dart';
import '../../domain/repositories/salon_repository.dart';

class SalonRepositoryImpl implements SalonRepository {
  @override
  Future<SalonInfo> getSalonInfo() async {
    return const SalonInfo(
      name: 'Hairvana Salon',
      address: '123 Beauty St, Suite 101, City, Stat',
      logoUrl: '/api/placeholder/80/80',
    );
  }

  @override
  Future<void> saveSalonInfo(SalonInfo salonInfo) async {
    // In a real app, this would save to a database or API.
    print('Saving salon info: ${salonInfo.name}');
  }
} 