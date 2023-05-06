import 'package:flutter/material.dart';
import 'package:flutter_mjpeg/flutter_mjpeg.dart';
import 'package:http/http.dart' as http;

class EspCameraScreen extends StatelessWidget {
  static const String routeName = '/esp-camera';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ESP Camera'),
      ),
      body: Center(
        child: FutureBuilder(
          future: _loadCameraStream(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Camera is currently offline');
            } else {
              return Mjpeg(
                stream: snapshot.data!,
                isLive: true,
              );
            }
          },
        ),
      ),
    );
  }

  Future<String> _loadCameraStream() async {
    try {
      // Make the HTTP request to load the camera stream
      // Replace the URL with your camera stream URL
      final response = await http.get(Uri.parse('http://dtu.ddns.net:81/stream'))
          .timeout(Duration(seconds: 5)); // Set an appropriate timeout value
    
      if (response.statusCode == 200) {
        // Return the camera stream URL if the response is successful
        return 'http://dtu.ddns.net:81/stream';
      } else {
        // Throw an exception if the response is not successful
        throw Exception('Failed to load camera stream');
      }
    } catch (e) {
      // Catch the timeout exception and return null
      print('Exception: $e');
      return Future.error('Camera is currently offline');
    }
  }
}
