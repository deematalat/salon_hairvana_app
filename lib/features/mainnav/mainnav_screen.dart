import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dashboard_card.dart';
import 'large_button.dart';
import 'add_stylist_dialog.dart';
import 'add_service_dialog.dart';
import '../../features/appointments/presentation/screens/appointments_screen.dart';
import '../../features/clients/presentation/screens/clients_screen.dart';
import '../../features/earnings/presentation/screens/earnings_screen.dart';
import '../../features/settings/presentation/screens/settings_screen.dart';

class MainNavScreen extends StatefulWidget {
  const MainNavScreen({Key? key}) : super(key: key);

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {
  int _selectedIndex = 0;

  Widget _buildDashboardPage(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ListView(
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
                Icon(FontAwesomeIcons.wandMagicSparkles, color: Colors.white, size: 36),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Hairvana', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22)),
                      SizedBox(height: 2),
                      Text('Salon Manager', style: TextStyle(color: Colors.white70, fontSize: 15)),
                    ],
                  ),
                ),
                // Switch button removed
              ],
            ),
          ),
          // Welcome
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 8),
            child: Text(
              'Welcome, Hairvana Salon!',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          // Dashboard Cards
          DashboardCard(
            icon: FontAwesomeIcons.calendarCheck,
            title: 'Appointments Today',
            value: '12',
            subtitle: '+3 from yesterday',
            iconColor: Colors.pinkAccent,
            cardColor: Theme.of(context).cardColor,
            textColor: Theme.of(context).textTheme.bodyLarge?.color,
          ),
          DashboardCard(
            icon: FontAwesomeIcons.solidStar,
            title: 'Average Rating',
            value: '4.8 / 5.0',
            subtitle: 'Based on 235 reviews',
            iconColor: Colors.amber,
            cardColor: Theme.of(context).cardColor,
            textColor: Theme.of(context).textTheme.bodyLarge?.color,
          ),
          DashboardCard(
            icon: FontAwesomeIcons.dollarSign,
            title: "Today's Earnings",
            value: ' 250',
            subtitle: '',
            iconColor: Colors.green,
            cardColor: Theme.of(context).cardColor,
            textColor: Theme.of(context).textTheme.bodyLarge?.color,
          ),
          // Add more cards as needed
          const SizedBox(height: 8),
          LargeButton(
            text: 'Add Stylist',
            icon: Icons.add,
            onPressed: () {
              print('Add Stylist button pressed');
              showDialog(
                context: context,
                builder: (context) => const AddStylistDialog(),
              );
            },
          ),
          const SizedBox(height: 16),
          LargeButton(
            text: 'Add Service',
            icon: Icons.add,
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const AddServiceDialog(),
              );
            },
          ),
          const SizedBox(height: 24),
          const SizedBox(height: 80), // For bottom nav bar space
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: [
            _buildDashboardPage(context),
            const AppointmentsScreen(),
            const ClientsScreen(),
            const EarningsScreen(),
            const SettingsScreen(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.pink[200],
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.home),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.calendar),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.userFriends),
            label: 'Clients',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.dollarSign),
            label: 'Earnings',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.gear),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
} 