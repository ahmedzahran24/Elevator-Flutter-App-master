import 'package:flutter/material.dart';

class CamTest extends StatefulWidget {
  @override
  _CamTestState createState() => _CamTestState();
}

class _CamTestState extends State<CamTest> {
  // Declare any state variables here
  
  @override
  Widget build(BuildContext context) {
    // Build the widget tree here
    return Scaffold(
      appBar: AppBar(),
      body: Padding  (padding: EdgeInsets.all(20.0),
        child : Column(
          children: [
             Text("test"),
             Text("data2")


          ]
          )
        
      )
      
    );
  }
}
