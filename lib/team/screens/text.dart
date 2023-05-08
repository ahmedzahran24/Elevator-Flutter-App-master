import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../utility/app_colors.dart';

class teext extends StatelessWidget {
  const teext({super.key, required this.vimage, required this.vname});
  final String vimage;
  final String vname;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final containerWidth = constraints.maxWidth;
      final containerHeight = constraints.maxHeight;
      final fontSize =
          containerWidth / 18; // Adjust the multiplier to your preference
      return Container(
        height: 100,
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
                colors: [AppColors.pinkColor, AppColors.lightPurpleColor])),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      vimage,
                      width: fontSize * 2.5,
                      height: fontSize * 2.5,
                      fit: BoxFit.cover,
                    )),
                SizedBox(
                  width: fontSize / 2,
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
                  ],
                ),
                SizedBox(
                  width: fontSize / 2,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            vimage,
                            width: fontSize * 2.5,
                            height: fontSize * 2.5,
                            fit: BoxFit.cover,
                          )),
                    ),
                  ],
                ),
              ],
            ),
            // CircleAvatar(
            //   radius: 40,
            //   backgroundImage: AssetImage('assets/images/unlock2.png'),
            // )
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
