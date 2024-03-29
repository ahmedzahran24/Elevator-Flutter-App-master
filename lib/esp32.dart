import 'dart:async';
import 'dart:ui';

import 'package:advanced_splashscreen/advanced_splashscreen.dart';
import 'package:connectivity/connectivity.dart'
    show Connectivity, ConnectivityResult;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:gesture_zoom_box/gesture_zoom_box.dart';
import 'package:intl/intl.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:ping_discover_network/ping_discover_network.dart';
import 'package:progress_dialog/progress_dialog.dart';

import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:wifi_info_flutter/wifi_info_flutter.dart';

import 'blinkingTimer.dart';
import 'videoUtil.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData.dark(),
//         title: "Dash Cam App",
//         home: AdvancedSplashScreen(
//           child: WifiCheck(),
//           seconds: 3,
//           colorList: [Color(0xff0088e2), Color(0xff0075cd), Color(0xff0063b8)],
//           appTitle: "Dash Cam",
//           appIcon: "images/dashcam_white.png",
//         ));
//   }
// }

class WifiCheck extends StatefulWidget {
  @override
  _WifiCheckState createState() => _WifiCheckState();
}

class _WifiCheckState extends State<WifiCheck> {
  final String targetSSID = "ESP32-THAT-PROJECT";
  String _connectionStatus = 'Unknown';
  final Connectivity _connectivity = Connectivity();
  final WifiInfo _wifiInfo = WifiInfo();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  late bool isTargetSSID;
  late bool isDiscovering;

  @override
  void initState() {
    super.initState();
    isTargetSSID = false;
    isDiscovering = false;

    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          LoadingFlipping.square(
            borderColor: Colors.cyan,
            size: 100,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  _connectionStatus.toUpperCase(),
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 26.0),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      side: BorderSide(color: Colors.red),
                    ),
                    primary: Colors.red,
                    onPrimary: Colors.white,
                  ),
                  onPressed: () {
                    isTargetSSID ? _ConnectWebSocket : initConnectivity;
                  },
                  child: Text(
                    isTargetSSID ? "Connect" : "Recheck WIFI",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 30),
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _ConnectWebSocket(BuildContext context) {
    Future.delayed(Duration(milliseconds: 100)).then((_) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            var key2 = null;
            return Home(
              channel: IOWebSocketChannel.connect('ws://192.168.1.9:4747'),
              key: key2,
            );
          },
        ),
      );
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return print('ahmed');
    ;
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        print("WIFI ****");
        String wifiIP;
        try {
          wifiIP = (await _wifiInfo.getWifiIP())!;
        } on PlatformException catch (e) {
          print(e.toString());
          wifiIP = "Failed to get Wifi IP";
        }

        if (wifiIP == null && wifiIP.trim().isEmpty) {
          return;
        }

        setState(() {
          _connectionStatus = '$result\n'
              'Wifi IP: $wifiIP\n';
        });

        var ipString = wifiIP.split('.');
        var subnetString = "${ipString[0]}.${ipString[1]}.${ipString[2]}";

        print("subnetString **** $subnetString");
        pingToCAMServer(subnetString);
        break;
      case ConnectivityResult.mobile:
      case ConnectivityResult.none:
        setState(() => _connectionStatus = result.toString());
        break;
      default:
        setState(() => _connectionStatus = 'Failed to get connectivity.');
        break;
    }
  }

  pingToCAMServer(String subnet) async {
    if (isDiscovering) return;
    print("pingToCAMServer");
    isDiscovering = true;
    final stream = NetworkAnalyzer.discover2(subnet, 8888,
        timeout: Duration(milliseconds: 2000));

    stream.listen((NetworkAddress addr) {
      print('${addr.ip}');
      if (addr.exists) {
        print('Found device: ${addr.ip}');
        setState(() {
          isTargetSSID = true;
        });
      }
    }).onDone(() {
      isDiscovering = false;
    });
  }
}

class Home extends StatefulWidget {
  final WebSocketChannel channel;

  const Home({required Key key, required this.channel}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final double videoWidth = 640;
  final double videoHeight = 480;

  double newVideoSizeWidth = 640;
  double newVideoSizeHeight = 480;

  late bool isLandscape;
  late String _timeString;

  var _globalKey = new GlobalKey();
  // final _imageSaver = ImageSaver();

  late Timer _timer;
  late bool isRecording;
  final FlutterFFmpeg _flutterFFmpeg = new FlutterFFmpeg();

  late int frameNum;
  late ProgressDialog pr;

  @override
  void initState() {
    super.initState();
    isLandscape = false;
    isRecording = false;

    _timeString = _formatDateTime(DateTime.now());
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());

    frameNum = 0;
    VideoUtil.workPath = 'images';
    VideoUtil.getAppTempDirectory();

    pr = ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: false, showLogs: false);
    pr.style(
        message: 'Saving video ...',
        borderRadius: 10,
        backgroundColor: Colors.black,
        progressWidget: CircularProgressIndicator(),
        elevation: 10,
        insetAnimCurve: Curves.easeInOut,
        messageTextStyle: TextStyle(
            color: Colors.white70, fontSize: 17, fontWeight: FontWeight.w300));
  }

  @override
  void dispose() {
    widget.channel.sink.close();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(builder: (context, orientation) {
        var screenWidth = MediaQuery.of(context).size.width;
        var screenHeight = MediaQuery.of(context).size.height;

        if (orientation == Orientation.portrait) {
          //screenWidth < screenHeight

          isLandscape = false;
          newVideoSizeWidth = screenWidth;
          newVideoSizeHeight = videoHeight * newVideoSizeWidth / videoWidth;
        } else {
          isLandscape = true;
          newVideoSizeHeight = screenHeight;
          newVideoSizeWidth = videoWidth * newVideoSizeHeight / videoHeight;
        }

        return Container(
          color: Colors.black,
          child: StreamBuilder(
            stream: widget.channel.stream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                Future.delayed(Duration(milliseconds: 100)).then((_) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => WifiCheck()));
                });
              }

              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                );
              } else {
                if (isRecording) {
                  VideoUtil.saveImageFileToDirectory(
                      snapshot.data, 'image_$frameNum.jpg');
                  frameNum++;
                }
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: isLandscape ? 0 : 30,
                        ),
                        Stack(
                          children: <Widget>[
                            RepaintBoundary(
                              key: _globalKey,
                              child: GestureZoomBox(
                                maxScale: 5.0,
                                doubleTapScale: 2.0,
                                duration: Duration(milliseconds: 200),
                                child: Image.memory(
                                  snapshot.data,
                                  gaplessPlayback: true,
                                  width: newVideoSizeWidth,
                                  height: newVideoSizeHeight,
                                ),
                              ),
                            ),
                            Positioned.fill(
                                child: Align(
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 46,
                                  ),
                                  isRecording ? BlinkingTimer() : Container(),
                                ],
                              ),
                              alignment: Alignment.topCenter,
                            )),
                            Positioned.fill(
                                child: Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                _timeString,
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w300),
                              ),
                            ))
                          ],
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: Colors.black,
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(
                                      isRecording ? Icons.stop : Icons.videocam,
                                      size: 24,
                                    ),
                                    onPressed: videoRecording,
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.photo_camera,
                                      size: 24,
                                    ),
                                    onPressed: takeScreenShot,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                );
              }
            },
          ),
        );
      }),
      floatingActionButton: _getFab(),
    );
  }

  takeScreenShot() async {
    RenderRepaintBoundary? boundary =
        _globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
    if (boundary == null) {
      return;
    }

    var image = await boundary.toImage();
    var byteData = await image.toByteData(format: ImageByteFormat.png);
    var pngBytes = byteData!.buffer.asUint8List();

    // final res = await _imageSaver.saveImage(imageBytes: pngBytes);

    // Fluttertoast.showToast(
    //   msg: res ? "Screenshot saved" : "Screenshot failure!",
    //   toastLength: Toast.LENGTH_SHORT,
    //   gravity: ToastGravity.CENTER,
    //   timeInSecForIosWeb: 1,
    //   backgroundColor: Colors.red,
    //   textColor: Colors.white,
    //   fontSize: 16.0,
    // );
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('yyyy/MM/dd HH:mm:ss').format(dateTime);
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    Future.delayed(
        Duration.zero,
        () => setState(() {
              _timeString = _formatDateTime(now);
            }));
  }

  Widget _getFab() {
    return SpeedDial(
      overlayOpacity: 0.1,
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22),
      visible: isLandscape,
      curve: Curves.bounceIn,
      children: [
        SpeedDialChild(
          child: Icon(Icons.photo_camera),
          onTap: takeScreenShot,
        ),
        SpeedDialChild(
            child: isRecording ? Icon(Icons.stop) : Icon(Icons.videocam),
            onTap: videoRecording)
      ],
    );
  }

  videoRecording() {
    isRecording = !isRecording;

    if (!isRecording && frameNum > 0) {
      frameNum = 0;
      makeVideoWithFFMpeg();
    }
  }

  Future<int> execute(String command) async {
    return await _flutterFFmpeg.execute(command);
  }

  makeVideoWithFFMpeg() {
    pr.show();
    String tempVideofileName = "${DateTime.now().millisecondsSinceEpoch}.mp4";
    execute(VideoUtil.generateEncodeVideoScript("mpeg4", tempVideofileName))
        .then((rc) {
      pr.hide();
      if (rc == 0) {
        print("Video complete");

        String outputPath = VideoUtil.appTempDir + "/$tempVideofileName";
        _saveVideo(outputPath);
      }
    });
  }

  _saveVideo(String path) async {
    await GallerySaver.saveVideo(path);
    print("Video Save result: success");

    Fluttertoast.showToast(
      msg: "Video Saved",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );

    await VideoUtil.deleteTempDirectory();
  }
}
