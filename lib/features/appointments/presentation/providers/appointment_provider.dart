import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/appointment.dart';
import '../../domain/usecases/get_upcoming_appointments.dart';
import '../../domain/usecases/get_past_appointments.dart';
import '../../domain/usecases/get_appointment_requests.dart';
import '../../data/repositories/appointment_repository_impl.dart';

// 1. Repository Provider
final appointmentRepositoryProvider = Provider<AppointmentRepositoryImpl>((ref) {
  return AppointmentRepositoryImpl();
});

// 2. Use Case Providers
final getUpcomingAppointmentsProvider = Provider<GetUpcomingAppointments>((ref) {
  final repository = ref.watch(appointmentRepositoryProvider);
  return GetUpcomingAppointments(repository);
});

final getPastAppointmentsProvider = Provider<GetPastAppointments>((ref) {
  final repository = ref.watch(appointmentRepositoryProvider);
  return GetPastAppointments(repository);
});

final getAppointmentRequestsProvider = Provider<GetAppointmentRequests>((ref) {
  final repository = ref.watch(appointmentRepositoryProvider);
  return GetAppointmentRequests(repository);
});

// 3. State Notifier Provider for the screen
class AppointmentState {
  final List<Appointment> upcomingAppointments;
  final List<Appointment> pastAppointments;
  final List<Appointment> appointmentRequests;

  AppointmentState({
    this.upcomingAppointments = const [],
    this.pastAppointments = const [],
    this.appointmentRequests = const [],
  });

  AppointmentState copyWith({
    List<Appointment>? upcomingAppointments,
    List<Appointment>? pastAppointments,
    List<Appointment>? appointmentRequests,
  }) {
    return AppointmentState(
      upcomingAppointments: upcomingAppointments ?? this.upcomingAppointments,
      pastAppointments: pastAppointments ?? this.pastAppointments,
      appointmentRequests: appointmentRequests ?? this.appointmentRequests,
    );
  }
}

final appointmentNotifierProvider = StateNotifierProvider<AppointmentNotifier, AppointmentState>((ref) {
  final getUpcoming = ref.watch(getUpcomingAppointmentsProvider);
  final getPast = ref.watch(getPastAppointmentsProvider);
  final getRequests = ref.watch(getAppointmentRequestsProvider);
  return AppointmentNotifier(getUpcoming, getPast, getRequests);
});

class AppointmentNotifier extends StateNotifier<AppointmentState> {
  final GetUpcomingAppointments _getUpcomingAppointments;
  final GetPastAppointments _getPastAppointments;
  final GetAppointmentRequests _getAppointmentRequests;

  AppointmentNotifier(
    this._getUpcomingAppointments,
    this._getPastAppointments,
    this._getAppointmentRequests,
  ) : super(AppointmentState()) {
    loadAppointments();
  }

  Future<void> loadAppointments() async {
    final upcoming = await _getUpcomingAppointments();
    final past = await _getPastAppointments();
    final requests = await _getAppointmentRequests();
    state = state.copyWith(
      upcomingAppointments: upcoming,
      pastAppointments: past,
      appointmentRequests: requests,
    );
  }
} 