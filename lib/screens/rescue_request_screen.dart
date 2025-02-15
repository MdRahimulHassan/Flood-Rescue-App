import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../services/location_service.dart';
import '../services/rescue_request_service.dart';

class RescueRequestScreen extends StatelessWidget {
  const RescueRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LocationService locationService = LocationService();
    final RescueRequestService rescueService = RescueRequestService();

    Future<void> _requestRescue() async {
      try {
        final position = await locationService.getCurrentLocation();
        await rescueService.sendRescueRequest('user123', position.latitude, position.longitude);
        print('Rescue request sent');
      } catch (e) {
        print('Error: $e');
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Request Rescue')),
      body: Center(
        child: ElevatedButton(
          onPressed: _requestRescue,
          child: const Text('Send Rescue Request'),
        ),
      ),
    );
  }
}