// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:test2/team/screens/custom_app_bar.dart';
import 'package:test2/team/screens/text.dart';
import 'package:url_launcher/url_launcher.dart';

class teams extends StatelessWidget {
  const teams({
    super.key,
    required this.name,
    required this.image1,
    required this.dep,
    required this.icon2,
  });
  final String name;
  final String image1;
  final String dep;
  final String icon2;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 350,
      child: Stack(
        children: [
          Center(
            child: Container(
              height: 180,
              width: 400,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 3, 141, 151),
                      Color.fromARGB(255, 30, 216, 197),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(40)),
            ),
          ),
          Positioned(
            top: 0,
            left: 40,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 0, 0),
                  shape: BoxShape.circle),
              child: CircleAvatar(
                backgroundImage: AssetImage(image1),
              ),
            ),
          ),
          Positioned(
            top: 60,
            right: 40,
            child: Column(
              children: [
                Text(
                  name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      dep,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      icon2,
                      height: 25,
                      width: 25,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 130,
            left: 0,
            child: Column(
              children: [
                Text(
                  "____________________________________",
                  style: TextStyle(
                      color: Color.fromARGB(223, 47, 32, 185),
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          Positioned(
            top: 160,
            left: 50,
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        _facebook();
                      },
                      child: Container(
                        child: Image.asset(
                          'assets/images/facebook.png',
                        ),
                        width: 40,
                        height: 40,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      child: Image.asset(
                        'assets/images/whatsapp.png',
                      ),
                      width: 40,
                      height: 40,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      child: Image.asset(
                        'assets/images/linkedin.png',
                      ),
                      width: 40,
                      height: 40,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      child: Image.asset(
                        'assets/images/twitter.png',
                      ),
                      width: 40,
                      height: 40,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _facebook() async {
    String _face = 'https://www.facebook.com/MAS10Delta?mibextid=ZbWKwL';

    if (await canLaunch(_face)) {
      await launch(_face);
    } else {
      throw 'Could not launch $_face';
    }
  }

  Future<void> _whatsapp() async {
    String _face = 'https://api.whatsapp.com/send?phone=+201094956568';

    if (await canLaunch(_face)) {
      await launch(_face);
    } else {
      throw 'Could not launch $_face';
    }
  }
}
