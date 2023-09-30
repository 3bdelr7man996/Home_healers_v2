import 'package:dr/doctor/features/chats/presentation/pages/chats_screem.dart';
import 'package:dr/doctor/features/home/presentation/pages/all_requests.dart';
import 'package:dr/doctor/features/notification/presentation/pages/notification_screen.dart';
import 'package:dr/doctor/features/settings/presentation/pages/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    this.selectedIndex = 0,
  });
  final int selectedIndex;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Widget> _widgets;
  int selectedIndex = 0;
  @override
  void initState() {
    selectedIndex = widget.selectedIndex;
    super.initState();
    _widgets = [
      const Allrequests(),
      const ChatsScreen(),
      const NotificationScreen(),
      const SettingsScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgets[selectedIndex],
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
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: SvgPicture.asset(
                    'assets/icons/myRequests_icon.svg',
                    width: 24,
                    height: 24,
                  ),
                ),
                label: 'طلباتي',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: SvgPicture.asset(
                    'assets/icons/messanger_icon.svg',
                    width: 24,
                    height: 24,
                  ),
                ),
                label: 'المحادثات',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: SvgPicture.asset(
                    'assets/icons/notification_icon.svg',
                    width: 24,
                    height: 24,
                  ),
                ),
                label: 'الإشعارات',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: SvgPicture.asset(
                    'assets/icons/setting_icon.svg',
                    width: 24,
                    height: 24,
                  ),
                ),
                label: 'الإعدادت',
              ),
            ],
            currentIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
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
