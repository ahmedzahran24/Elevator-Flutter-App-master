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
          stream: 'http://dtu.ddns.net:81/stream',
          isLive: true,
        ),
      ),
    );
  }
}
