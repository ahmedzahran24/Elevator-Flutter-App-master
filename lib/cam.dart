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
          stream:
              'http://https://cph-p2p-msl.akamaized.net/hls/live/2000341/test/master.m3u8',
          isLive: true,
        ),
      ),
    );
  }
}
