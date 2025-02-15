import 'package:flutter/material.dart';
import '../services/notification_service.dart';

class FloodAlertsScreen extends StatelessWidget {
  const FloodAlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NotificationService notificationService = NotificationService();

    Future<void> _sendAlert() async {
      await notificationService.showNotification(
        'Flood Alert',
        'Warning issued in your area',
      );
      print('Alert sent');
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Flood Alerts')),
      body: Center(
        child: ElevatedButton(
          onPressed: _sendAlert,
          child: const Text('Send Alert'),
        ),
      ),
    );
  }
}