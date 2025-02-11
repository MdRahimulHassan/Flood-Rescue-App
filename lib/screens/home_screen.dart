// screens/home_screen.dart
import 'package:flutter/material.dart';
import 'rescue_request_screen.dart'; // Import RescueRequestScreen
import 'emergency_contacts_screen.dart'; // Import EmergencyContactsScreen
import 'flood_alerts_screen.dart'; // Import FloodAlertsScreen

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flood Rescue App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to RescueRequestScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RescueRequestScreen()),
                );
              },
              child: Text('Request Rescue'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to EmergencyContactsScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EmergencyContactsScreen()),
                );
              },
              child: Text('Emergency Contacts'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to FloodAlertsScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FloodAlertsScreen()),
                );
              },
              child: Text('Flood Alerts'),
            ),
          ],
        ),
      ),
    );
  }
}