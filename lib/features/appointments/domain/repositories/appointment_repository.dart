import '../entities/appointment.dart';
 
abstract class AppointmentRepository {
  Future<List<Appointment>> getUpcomingAppointments();
  Future<List<Appointment>> getPastAppointments();
  Future<List<Appointment>> getAppointmentRequests();
} 