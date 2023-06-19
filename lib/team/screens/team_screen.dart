import 'package:flutter/material.dart';
import 'package:test2/team/screens/custom_app_bar.dart';
import 'package:test2/team/screens/text.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ism1 = MediaQuery.of(context).size.width >= 350;
    return Scaffold(
      appBar: CustomAppBar(
        titleText: 'Teams',
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              teext(
                vimage: 'assets/images/Abdallah.png',
                vname: 'Abdallah Zahran',
                vimage2: 'assets/images/It2.png',
                vname2: 'IT - NetWork',
                hi: 1,
                fb: 'www.google.com',
              ),
              teext(
                vimage: 'assets/images/Abdallah.png',
                vname: 'Abdrahman yonias',
                vimage2: 'assets/images/It2.png',
                vname2: 'IT - NetWork',
                hi: .5,
                fb: 'www.facebook.com',
              ),
              teext(
                vimage: 'assets/images/Abdallah.png',
                vname: 'Adel mosen moktar',
                vimage2: 'assets/images/it.png',
                vname2: 'IT - NetWork',
                hi: 0.5,
                fb: 'www.facebook.com',
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
