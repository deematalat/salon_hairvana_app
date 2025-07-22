import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/appointment_card.dart';
import '../providers/appointment_provider.dart';

class AppointmentsScreen extends ConsumerWidget {
  const AppointmentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appointmentState = ref.watch(appointmentNotifierProvider);

    return Scaffold(
      backgroundColor:Theme.of(context).scaffoldBackgroundColor,
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                children: [
                  // Gradient Header
                  Container(
                    margin: const EdgeInsets.only(top: 16, bottom: 16),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      gradient: const LinearGradient(
                        colors: [Color(0xFFB16CEA), Color(0xFFFF6FB5)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).colorScheme.primary.withOpacity(0.08),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.auto_awesome, color: Colors.white, size: 36),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Hairvana', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22)),
                              const SizedBox(height: 2),
                              Text('Salon Manager', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white70, fontSize: 15)),
                            ],
                          ),
                        ),
                        // Switch button removed
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4, bottom: 8),
                    child: Text(
                      'Appointments',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                  ),
                  // Custom TabBar
                  _CustomTabBar(),
                  // TabBarView content
                  SizedBox(
                    height: 420, // Adjust as needed for your content
                    child: TabBarView(
                      children: [
                        // Upcoming
                        ListView(
                          padding: EdgeInsets.zero,
                          children: appointmentState.upcomingAppointments
                              .map((app) => AppointmentCard(
                                    appointment: app,
                                    onReschedule: () => _showRescheduleDialog(context),
                                    onCancel: () => _showCancelDialog(context),
                                  ))
                              .toList(),
                        ),
                        // Past
                        ListView(
                          padding: EdgeInsets.zero,
                          children: appointmentState.pastAppointments
                              .map((app) => AppointmentCard(
                                    appointment: app,
                                    onReschedule: () => _showRescheduleDialog(context),
                                    onCancel: () => _showCancelDialog(context),
                                  ))
                              .toList(),
                        ),
                        // Requests
                        Center(
                          child: Text(
                            appointmentState.appointmentRequests.isEmpty
                                ? 'No requests'
                                : '${appointmentState.appointmentRequests.length} requests',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void _showRescheduleDialog(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (selectedDate != null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Reschedule Appointment'),
          content: Text('Selected date: ${selectedDate.toLocal()}'.split(' ')[0]),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
            ElevatedButton(
              onPressed: () {
                // TODO: Save new date logic
                Navigator.of(context).pop();
              },
              child: const Text('Confirm'),
            ),
          ],
        ),
      );
    }
  }

  static void _showCancelDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cancel Appointment'),
        content: const Text('Are you sure you want to cancel this appointment?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('No'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              // TODO: Cancel logic here
              Navigator.of(context).pop();
            },
            child: const Text('Yes, Cancel'),
          ),
        ],
      ),
    );
  }
}

class _CustomTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tabController = DefaultTabController.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TabBar(
        controller: tabController,
        indicator: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.purple, Colors.pinkAccent],
          ),
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.pinkAccent.withOpacity(0.15),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        indicatorColor: Colors.transparent,
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: Colors.white,
        unselectedLabelColor: theme.textTheme.bodyLarge?.color,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        tabs: const [
          Tab(text: 'Upcoming'),
          Tab(text: 'Past'),
          Tab(text: 'Requests'),
        ],
      ),
    );
  }
} 