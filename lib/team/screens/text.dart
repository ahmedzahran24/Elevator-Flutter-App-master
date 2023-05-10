import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:test2/team/screens/app_colors.dart';

class teext extends StatelessWidget {
  const teext(
      {super.key,
      required this.vimage,
      required this.vname,
      required this.vimage2,
      required this.vname2,
      required this.hi});
  final String vimage;
  final String vname;
  final String vimage2;
  final String vname2;
  final double hi;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final containerWidth = constraints.maxWidth;
      final containerHeight = constraints.maxHeight;
      final fontSize =
          containerWidth / 18; // Adjust the multiplier to your preference
      return Container(
        height: 150,
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromARGB(255, 27, 224, 198),
              Color.fromARGB(255, 57, 159, 227),
            ],
          ),
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 5),
          ],
        ),
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            vimage,
                            width: fontSize * 3,
                            height: fontSize * 3,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: fontSize * hi,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                vname,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: fontSize,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: fontSize / 6,
                            ),
                            FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                vname2,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: fontSize / 2,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: fontSize * hi,
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Image.asset(
                              vimage2,
                              width: fontSize * 2.5,
                              height: fontSize * 2.5,
                              fit: BoxFit.cover,
                            )),
                      ],
                    ),

                    // CircleAvatar(
                    //   radius: 40,
                    //   backgroundImage: AssetImage('assets/images/unlock2.png'),
                    // )
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                      "******* TO Communicate *******",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: fontSize / 1.6,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                  height: fontSize * 1.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromARGB(255, 27, 224, 155),
                        Color.fromARGB(255, 85, 206, 78),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(color: Colors.black26, blurRadius: 5),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 6,
            ),
            Row(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        child: Image.asset(
                          'assets/images/whatsapp.png',
                        ),
                        width: fontSize * 8,
                        height: fontSize * 1.5,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: fontSize,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Image.asset(
                        'assets/images/facebook.png',
                      ),
                      width: fontSize * 8,
                      height: fontSize * 1.5,
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      );
    });
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('vimage', vimage));
    properties.add(StringProperty('vimage', vimage));
  }
}
