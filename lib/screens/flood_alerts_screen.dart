// screens/flood_alerts_screen.dart
import 'package:flutter/material.dart';
import '../services/notification_service.dart'; // Import NotificationService

class FloodAlertsScreen extends StatelessWidget {
  final NotificationService _notificationService = NotificationService();

  Future<void> _sendFloodAlert() async {
    // Show a flood alert notification
    await _notificationService.showNotification(
      'Flood Alert',
      'A flood warning has been issued in your area.',
    );
    print('Flood alert notification sent');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flood Alerts'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _sendFloodAlert,
          child: Text('Send Flood Alert'),
        ),
      ),
    );
  }
}