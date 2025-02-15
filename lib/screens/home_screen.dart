import 'package:flutter/material.dart';
import 'rescue_request_screen.dart';
import 'emergency_contacts_screen.dart';
import 'flood_alerts_screen.dart';
import 'sign_in_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flood Rescue App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SignInScreen()),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RescueRequestScreen()),
              ),
              child: const Text('Request Rescue'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EmergencyContactsScreen()),
              ),
              child: const Text('Emergency Contacts'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FloodAlertsScreen()),
              ),
              child: const Text('Flood Alerts'),
            ),
          ],
        ),
      ),
    );
  }
}