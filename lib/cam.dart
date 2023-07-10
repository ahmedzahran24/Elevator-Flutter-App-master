// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mjpeg/flutter_mjpeg.dart';

class EspCameraScreen extends StatelessWidget {
  static const String routeName = '/esp-camera';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ESP Camera'),
      ),
      body: Center(
        child: Mjpeg(
          stream: 'http://192.168.1.111:4747/video',
          isLive: true,
        ),
      ),
    );
  }
}

// import 'package:flutter_mjpeg/flutter_mjpeg.dart';
// import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';
// import 'package:slide_digital_clock/slide_digital_clock.dart';

// class EspCameraScreen extends StatefulWidget {
//   static const String routeName = '/esp-camera';
//   const EspCameraScreen({super.key});

//   @override
//   State<EspCameraScreen> createState() => _EspCameraScreenState();
// }

// class _EspCameraScreenState extends State<EspCameraScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Live Camera'),
//       ),
//       body: ListView(
//         children: [
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 FutureBuilder(
//                   future: _loadCameraStream(),
//                   builder:
//                       (BuildContext context, AsyncSnapshot<String> snapshot) {
//                     if (snapshot.hasError) {
//                       return Container(
//                           height: 100,
//                           child: Row(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 10),
//                                 child: Image.asset('assets/images/live.png'),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 20),
//                                 child: Text(DateFormat('yyyy-MM-dd ')
//                                     .format(DateTime.now())),
//                               ),
//                               Padding(
//                                   padding: const EdgeInsets.only(left: 20),
//                                   child: DigitalClock(
//                                     digitAnimationStyle: Curves.elasticInOut,
//                                     is24HourTimeFormat: false,
//                                     areaDecoration:
//                                         BoxDecoration(color: Colors.black12),
//                                   )),
//                             ],
//                           ));
//                     } else {
//                       return Container(
//                           height: 100,
//                           child: Row(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 10),
//                                 child: Image.asset('assets/images/live.png'),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 20),
//                                 child: Text(DateFormat('yyyy-MM-dd')
//                                     .format(DateTime.now())),
//                               ),
//                             ],
//                           ));
//                     }
//                   },
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 100),
//                   child: FutureBuilder(
//                     future: _loadCameraStream(),
//                     builder:
//                         (BuildContext context, AsyncSnapshot<String> snapshot) {
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return CircularProgressIndicator();
//                       } else if (snapshot.hasError) {
//                         return Container(
//                             child: Image.asset('assets/images/offline.png'));
//                       } else {
//                         return Mjpeg(
//                           stream: 'http://dtu.ddns.net:81/stream',
//                           isLive: true,
//                         );
//                       }
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// Future<String> _loadCameraStream() async {
//   try {
//     // Make the HTTP request to load the camera stream
//     // Replace the URL with your camera stream URL
//     final response = await http
//         .get(Uri.parse('http://dtu.ddns.net:81/stream'))
//         .timeout(Duration(seconds: 5)); // Set an appropriate timeout value

//     if (response.statusCode == 200) {
//       // Return the camera stream URL if the response is successful
//       return 'http://dtu.ddns.net:81/stream';
//     } else {
//       // Throw an exception if the response is not successful
//       throw Exception('Failed to load camera stream');
//     }
//   } catch (e) {
//     // Catch the timeout exception and return null
//     print('Exception: $e');
//     return Future.error('Camera is currently offline');
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_mjpeg/flutter_mjpeg.dart';

// class EspCameraScreen extends StatelessWidget {
//   static const String routeName = '/esp-camera';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('ESP Camera'),
//       ),
//       body: Center(
//         child: _buildMjpegWidget(),
//       ),
//     );
//   }

//   Widget _buildMjpegWidget() {
//     try {
//       return Mjpeg(
//         stream: 'http://dtu.ddns.net:81/stream',
//         isLive: true,
//       );
//     } catch (e) {
//       // Handle the exception here
//       return Text('Error loading MJPEG stream.');
//     }
//   }
// }
