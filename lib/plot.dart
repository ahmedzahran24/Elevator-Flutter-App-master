import 'package:flutter/material.dart';


class plotter extends StatefulWidget {
  @override
  _plotter createState() => _plotter();
}

class _plotter extends State<plotter> {


  @override
  void initState() {
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DataPlotter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'test',
              style: TextStyle(fontSize: 24),
            ),

            SizedBox(height: 16),

          ],
        ),
      ),
    );
  }









}
