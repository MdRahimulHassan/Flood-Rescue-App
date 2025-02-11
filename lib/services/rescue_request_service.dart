// services/rescue_request_service.dart
import 'package:http/http.dart' as http;

class RescueRequestService {
  Future<void> sendRescueRequest(String userId, double lat, double lng) async {
    final response = await http.post(
      Uri.parse('https://your-backend.com/rescue'),
      body: {
        'userId': userId,
        'lat': lat.toString(),
        'lng': lng.toString(),
      },
    );

    if (response.statusCode == 200) {
      print('Rescue request sent successfully');
    } else {
      print('Failed to send rescue request');
    }
  }
}