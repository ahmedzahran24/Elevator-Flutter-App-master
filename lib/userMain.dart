import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class userMain extends StatefulWidget {
  @override
  _userMain createState() => _userMain();
}

class _userMain extends State<userMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(),
      body:Padding (
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
                Text("test11"),



              ],
        ),       
        ),
    );
  }
}
