import '../entities/appointment.dart';
import '../repositories/appointment_repository.dart';

class GetPastAppointments {
  final AppointmentRepository repository;

  GetPastAppointments(this.repository);

  Future<List<Appointment>> call() {
    return repository.getPastAppointments();
  }
} 