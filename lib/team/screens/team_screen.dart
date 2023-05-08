import 'package:flutter/material.dart';
import 'package:test2/team/screens/text.dart';
import 'package:test2/team/utility/app_colors.dart';

import '../models/team.dart';
import '../utility/data_api.dart';
import '../widgets/background_widget.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/team_widget.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        titleText: 'Teams',
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              teext(
                vimage: 'assets/images/it.png',
                vname: 'Abdallah Zahran',
              ),
              teext(
                vimage: 'assets/images/it.png',
                vname: ' Ahmed Rashad ',
              ),
              teext(
                vimage: 'assets/images/mec.png',
                vname: 'Abdalrahman Youins',
              ),
              teext(
                vimage: 'assets/images/mec.png',
                vname: 'zahran',
              ),
              teext(
                vimage: 'assets/images/unlock2.png',
                vname: 'zahran',
              ),
              teext(
                vimage: 'assets/images/unlock2.png',
                vname: 'zahran',
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
