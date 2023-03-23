import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:test2/addUser.dart';
import 'package:test2/home_screen.dart';

import 'package:test2/rive_utils.dart';

import 'info_card.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 288,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFF17203A),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: DefaultTextStyle(
          style: const TextStyle(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const InfoCard(
                name: "Admin",
                bio: "Malfunctions and monitoring",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                child: Text(
                  "Browse".toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white70),
                ),
              ),
              // 33#####################################

              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        },
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 24),
                              child: Divider(color: Colors.white24, height: 1),
                            ),
                            Stack(
                              children: [
                                AnimatedPositioned(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.fastOutSlowIn,
                                  width: 280,
                                  height: 56,
                                  left: 0,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF6792FF),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                  ),
                                ),
                                ListTile(
                                  leading: SizedBox(
                                    height: 36,
                                    width: 36,
                                    child: RiveAnimation.asset(
                                      "assets/RiveAssets/icons.riv",
                                      artboard: "HOME",
                                    ),
                                  ),
                                  title: Text(
                                    'home',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => addUser()));
                        },
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 24),
                              child: Divider(color: Colors.white24, height: 1),
                            ),
                            Stack(
                              children: [
                                AnimatedPositioned(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.fastOutSlowIn,
                                  width: 280,
                                  height: 56,
                                  left: 0,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF6792FF),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                  ),
                                ),
                                ListTile(
                                  leading: SizedBox(
                                    height: 36,
                                    width: 36,
                                    child: RiveAnimation.asset(
                                      "assets/RiveAssets/12.riv",
                                      artboard: "Create Account",
                                    ),
                                  ),
                                  title: Text(
                                    'Create Account',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // ######################################3#3#
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 40, bottom: 16),
                child: Text(
                  "History".toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white70),
                ),
              ),
              //   ...sidebarMenus2
              //       .map((menu) => SideMenu(
              //             menu: menu,
              //             selectedMenu: selectedSideMenu,
              //             press: () {
              //               RiveUtils.chnageSMIBoolState(menu.rive.status!);
              //               setState(() {
              //                 selectedSideMenu = menu;
              //               });
              //             },
              //             riveOnInit: (artboard) {
              //               menu.rive.status = RiveUtils.getRiveInput(artboard,
              //                   stateMachineName: menu.rive.stateMachineName);
              //             },
              //           ))
              //       .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
