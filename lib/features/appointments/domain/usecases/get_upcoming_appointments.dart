import '../entities/appointment.dart';
import '../repositories/appointment_repository.dart';

class GetUpcomingAppointments {
  final AppointmentRepository repository;

  GetUpcomingAppointments(this.repository);

  Future<List<Appointment>> call() {
    return repository.getUpcomingAppointments();
  }
} 