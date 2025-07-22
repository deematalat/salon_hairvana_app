import '../entities/appointment.dart';
import '../repositories/appointment_repository.dart';

class GetAppointmentRequests {
  final AppointmentRepository repository;

  GetAppointmentRequests(this.repository);

  Future<List<Appointment>> call() {
    return repository.getAppointmentRequests();
  }
} 