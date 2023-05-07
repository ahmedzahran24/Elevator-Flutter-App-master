// import 'package:flutter/material.dart';
// import 'package:lite_rolling_switch/lite_rolling_switch.dart';

// class unlock extends StatefulWidget {
//   const unlock({Key? key}) : super(key: key);

//   @override
//   _unlockState createState() => _unlockState();
// }

// class _unlockState extends State<unlock> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               color: Color.fromARGB(255, 8, 75, 138),
//               borderRadius: const BorderRadius.only(
//                 bottomRight: Radius.circular(50),
//               ),
//             ),
//             child: Column(
//               children: [
//                 const SizedBox(height: 50),
//                 ListTile(
//                   contentPadding: const EdgeInsets.symmetric(horizontal: 30),
//                   title: Center(
//                     child: Text('Unlock !',
//                         style: Theme.of(context)
//                             .textTheme
//                             .headlineSmall
//                             ?.copyWith(color: Colors.white)),
//                   ),
//                   trailing: const CircleAvatar(
//                     backgroundImage: AssetImage('assets/images/un5.png'),
//                   ),
//                 ),
//                 const SizedBox(height: 30)
//               ],
//             ),
//           ),
//           Container(
//             color: Color.fromARGB(255, 8, 75, 138),
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 30),
//               decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius:
//                       BorderRadius.only(topLeft: Radius.circular(100))),
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top: 50),
//                     child: Column(
//                       children: [
//                         Text(
//                           'Control of locking and',
//                           style: new TextStyle(
//                             fontSize: 20.0,
//                             fontWeight: FontWeight.bold,
//                             foreground: Paint()
//                               ..shader = LinearGradient(
//                                 colors: <Color>[
//                                   Color.fromARGB(255, 177, 212, 21),
//                                   Color.fromARGB(255, 32, 91, 153),
//                                   Color.fromARGB(255, 23, 147, 200)
//                                   //add more color here.
//                                 ],
//                               ).createShader(
//                                 Rect.fromLTWH(0.0, 0.0, 200.0, 100.0),
//                               ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text(
//                           ' unlocking of the elevator',
//                           style: new TextStyle(
//                             fontSize: 20.0,
//                             fontWeight: FontWeight.bold,
//                             foreground: Paint()
//                               ..shader = LinearGradient(
//                                 colors: <Color>[
//                                   Color.fromARGB(255, 177, 212, 21),
//                                   Color.fromARGB(255, 26, 218, 239),
//                                   Color.fromARGB(255, 23, 147, 200)
//                                   //add more color here.
//                                 ],
//                               ).createShader(
//                                 Rect.fromLTWH(0.0, 0.0, 200.0, 100.0),
//                               ),
//                           ),
//                         ),
//                         Container(
//                           height: 300,
//                           child: Image.asset(
//                             'assets/images/key.png',
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   GridView.count(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     crossAxisCount: 1,
//                     crossAxisSpacing: 10,
//                     mainAxisSpacing: 10,
//                     children: [
//                       Center(
//                         child: Column(
//                           children: <Widget>[
//                             //By default

//                             //Customized
//                             Padding(
//                               padding: const EdgeInsets.only(bottom: 50),
//                               child: LiteRollingSwitch(
//                                 value: false,
//                                 width: 200,
//                                 textOn: 'Unlock',
//                                 textOff: 'Lock',
//                                 colorOff: Colors.blueGrey,
//                                 colorOn: Colors.deepOrange,
//                                 iconOff: Icons.lock,
//                                 iconOn: Icons.lock_open,
//                                 animationDuration:
//                                     const Duration(milliseconds: 600),
//                                 onChanged: (bool state) {
//                                   print('turned ${(state) ? 'on' : 'off'}');
//                                 },
//                                 onDoubleTap: () {},
//                                 onSwipe: () {},
//                                 onTap: () {},
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(height: 20)
//         ],
//       ),
//     );
//   }
// }
