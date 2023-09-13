import 'package:dr/doctor/features/chats/presentation/pages/chats_screem.dart';
import 'package:dr/doctor/features/home/presentation/pages/all_requests.dart';
import 'package:dr/doctor/features/notification/presentation/pages/notification_screen.dart';
import 'package:dr/doctor/features/settings/presentation/pages/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  int selectedIndex;
  HomeScreen({super.key, required int this.selectedIndex});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Widget> _widgets;

  @override
  void initState() {
    super.initState();
    _widgets = [
      Allrequests(),
      ChatsScreen(),
      NotificationScreen(),
      SettingsScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgets[widget.selectedIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 103, 157, 252),
                Color.fromARGB(255, 155, 60, 172),
              ],
            ),
          ),
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/myRequests_icon.svg',
                  width: 24,
                  height: 24,
                ),
                label: 'طلباتي',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/messanger_icon.svg',
                  width: 24,
                  height: 24,
                ),
                label: 'المحادثات',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/notification_icon.svg',
                  width: 24,
                  height: 24,
                ),
                label: 'الإشعارات',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/setting_icon.svg',
                  width: 24,
                  height: 24,
                ),
                label: 'الإعدادت',
              ),
            ],
            currentIndex: widget.selectedIndex,
            onTap: (index) {
              setState(() {
                widget.selectedIndex = index;
              });
            },
            elevation: 0,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
