import '../../domain/entities/appointment.dart';
import '../../domain/repositories/appointment_repository.dart';

class AppointmentRepositoryImpl implements AppointmentRepository {
  @override
  Future<List<Appointment>> getUpcomingAppointments() async {
    return [
      const Appointment(
        initials: 'AS',
        clientName: 'Alice Smith',
        date: 'Jun 29, 2025',
        time: '10:00 AM',
        service: 'Haircut & Style',
        stylist: 'Emma Rodriguez',
      ),
    ];
  }

  @override
  Future<List<Appointment>> getPastAppointments() async {
    return [
      const Appointment(
        initials: 'BJ',
        clientName: 'Bob Johnson',
        date: 'Jun 15, 2025',
        time: '2:00 PM',
        service: 'Color & Highlights',
        stylist: 'Jessica Chan',
      ),
    ];
  }

  @override
  Future<List<Appointment>> getAppointmentRequests() async {
    return []; // No requests for now
  }
} 