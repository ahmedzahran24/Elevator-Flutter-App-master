import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test2/home_screen.dart';
import 'package:test2/team/screens/custom_app_bar.dart';
import 'package:test2/team/screens/text.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ism1 = MediaQuery.of(context).size.width >= 350;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 3, 100, 109),
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 70,
        title: Text("Team"),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 3, 141, 151),
                Color.fromARGB(255, 30, 216, 197),
              ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
        ),
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              teams(
                name: 'Abdallah Zahran',
                image1: 'assets/images/Abdallah.png',
                dep: 'NetWork',
                icon2: 'assets/images/It2.png',
              ),
              teams(
                  name: 'Ammar Yasser',
                  image1: 'assets/images/Amar.jpg',
                  dep: 'NetWork',
                  icon2: 'assets/images/It2.png'),
              teams(
                  name: 'Ahmed Rashad',
                  image1: 'assets/images/sniper.jpg',
                  dep: 'NetWork',
                  icon2: 'assets/images/It2.png'),
              teams(
                  name: 'Adel Mohsen     ',
                  image1: 'assets/images/4.jpg',
                  dep: 'NetWork',
                  icon2: 'assets/images/It2.png'),
              teams(
                  name: 'Hager Reda       ',
                  image1: 'assets/images/5.png',
                  dep: 'NetWork',
                  icon2: 'assets/images/It2.png'),
              teams(
                  name: 'Mohamed Ali      ',
                  image1: 'assets/images/6.jpg',
                  dep: 'Mechatronics',
                  icon2: 'assets/images/mec.png'),
              teams(
                  name: 'Malik Qasim      ',
                  image1: 'assets/images/7.jpg',
                  dep: 'Mechatronics',
                  icon2: 'assets/images/mec.png'),
              teams(
                  name: 'Mohamed Atef     ',
                  image1: 'assets/images/8.jpg',
                  dep: 'Mechatronics',
                  icon2: 'assets/images/mec.png'),
              teams(
                  name: 'Amr Fathy         ',
                  image1: 'assets/images/9.jpg',
                  dep: 'Mechatronics',
                  icon2: 'assets/images/mec.png'),
              // ####################################################################
              Container(
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
                          backgroundImage: AssetImage('assets/images/10.jpg'),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 60,
                      right: 40,
                      child: Column(
                        children: [
                          Text(
                            'Abdulrahman Younis',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Text(
                                'Mechatronics',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Image.asset(
                                'assets/images/mec.png',
                                height: 30,
                                width: 30,
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
                              Container(
                                child: Image.asset(
                                  'assets/images/facebook.png',
                                ),
                                width: 40,
                                height: 40,
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
              ),
              // ####################################################################

              teams(
                  name: 'Mustafa Amin      ',
                  image1: 'assets/images/11.jpg',
                  dep: 'Mechatronics',
                  icon2: 'assets/images/mec.png'),
              teams(
                  name: 'Mohamad Ibrahim',
                  image1: 'assets/images/12.jpg',
                  dep: 'Mechatronics',
                  icon2: 'assets/images/mec.png'),
              teams(
                  name: 'Manar Ayman    ',
                  image1: 'assets/images/5.png',
                  dep: 'Mechatronics',
                  icon2: 'assets/images/mec.png'),
              teams(
                  name: 'Salma Ahmed     ',
                  image1: 'assets/images/5.png',
                  dep: 'Mechatronics',
                  icon2: 'assets/images/mec.png'),
              teams(
                  name: 'Mohamed Khalid',
                  image1: 'assets/images/15.jpg',
                  dep: 'Mechatronics',
                  icon2: 'assets/images/mec.png'),
              teams(
                  name: 'Abdulrahman Hany',
                  image1: 'assets/images/16.jpg',
                  dep: 'Mechatronics',
                  icon2: 'assets/images/mec.png'),
            ],
          ),
        ),
      ]),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 3, 141, 151),
        // this creates a notch in the center of the bottom bar
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              onPressed: () {
                SystemNavigator.pop();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 70,
        width: 70,
        child: Material(
          type: MaterialType.transparency,
          child: Ink(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green, width: 3.0),
              color: Colors.greenAccent,
              shape: BoxShape.circle,
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(500.0),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Icon(
                Icons.home_filled,
                //size: 50,
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
