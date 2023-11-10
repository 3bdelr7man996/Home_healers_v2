import 'package:dr/Patient/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:dr/Patient/features/favorite/presentation/pages/favorite_screen.dart';
import 'package:dr/Patient/features/home/presentation/pages/sections_screen.dart';
import 'package:dr/Patient/features/offer/presentation/pages/offer_and_packages_screen.dart';
import 'package:dr/Patient/features/setting/presentation/pages/settings_screen.dart';
import 'package:dr/doctor/features/notification/presentation/pages/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class HomeScreenForPatient extends StatefulWidget {
  int selectedIndex;
  HomeScreenForPatient({super.key, required int this.selectedIndex});

  @override
  _HomeScreenForPatientState createState() => _HomeScreenForPatientState();
}

class _HomeScreenForPatientState extends State<HomeScreenForPatient> {
  late List<Widget> _widgets;
  IsGuest() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('guest') == false)
      context.read<FavoriteCubit>().GetFavorite(context);
    ;
  }

  @override
  void initState() {
    super.initState();
    _widgets = [
      OfferAndPackagesScreen(),
      NotificationScreen(fromPatient: true),
      SectionsScreen(context: context),
      FavoriteScreen(),
      SettingsScreenForPatient(),
    ];
    IsGuest();
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
                Color.fromARGB(255, 108, 210, 233),
                Color.fromARGB(173, 116, 10, 154)
              ],
            ),
          ),
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/offer_icon.svg',
                  width: 24,
                  height: 24,
                ),
                label: 'العروض',
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
                  'assets/icons/home_icon.svg',
                  width: 24,
                  height: 24,
                ),
                label: 'الرئيسية',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/favorite_icon.svg',
                  width: 24,
                  height: 24,
                ),
                label: 'المفضلة',
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
