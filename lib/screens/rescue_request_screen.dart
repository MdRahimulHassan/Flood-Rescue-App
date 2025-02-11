// screens/rescue_request_screen.dart
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart'; // Import Geolocator
import '../services/location_service.dart'; // Import LocationService
import '../services/rescue_request_service.dart'; // Import RescueRequestService

class RescueRequestScreen extends StatelessWidget {
  final LocationService _locationService = LocationService();
  final RescueRequestService _rescueRequestService = RescueRequestService();

  Future<void> _requestRescue() async {
    try {
      // Get the user's current location
      Position position = await _locationService.getCurrentLocation();
      double lat = position.latitude;
      double lng = position.longitude;

      // Send the rescue request
      await _rescueRequestService.sendRescueRequest('user123', lat, lng);
      print('Rescue request sent successfully');
    } catch (e) {
      print('Error sending rescue request: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Request Rescue'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _requestRescue,
          child: Text('Send Rescue Request'),
        ),
      ),
    );
  }
}