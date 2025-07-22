import '../entities/salon_info.dart';
 
abstract class SalonRepository {
  Future<SalonInfo> getSalonInfo();
  Future<void> saveSalonInfo(SalonInfo salonInfo);
} 