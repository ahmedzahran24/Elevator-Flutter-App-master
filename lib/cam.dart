import 'package:flutter/material.dart';
import 'package:flutter_mjpeg/flutter_mjpeg.dart';
import 'package:http/http.dart' as http;

class EspCameraScreen extends StatelessWidget {
  static const String routeName = '/esp-camera';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Camera'),
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FutureBuilder(
                  future: _loadCameraStream(),
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.hasError) {
                      return Container();
                    } else {
                      return Container(
                          height: 100,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Image.asset('assets/images/live.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text('data'),
                              ),
                            ],
                          ));
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: FutureBuilder(
                    future: _loadCameraStream(),
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Container(
                            child: Image.asset('assets/images/offline.png'));
                      } else {
                        return Mjpeg(
                          stream: snapshot.data!,
                          isLive: true,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<String> _loadCameraStream() async {
    try {
      // Make the HTTP request to load the camera stream
      // Replace the URL with your camera stream URL
      final response = await http
          .get(Uri.parse('http://dtu.ddns.net:81/stream'))
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
