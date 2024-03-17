import 'package:dr/Patient/features/home/presentation/pages/home_screen_for_patient.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class BottomNavigationForPatient extends StatefulWidget {
  int selectedIndex;
  BottomNavigationForPatient({super.key, required this.selectedIndex});

  @override
  State<BottomNavigationForPatient> createState() =>
      _BottomNavigationForPatientState();
}

class _BottomNavigationForPatientState
    extends State<BottomNavigationForPatient> {
  @override
  Widget build(BuildContext context) {
    return Theme(
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

            AppConstants.customNavigation(
                context, HomeScreenForPatient(selectedIndex: index), 0, 0);
          },
          elevation: 0,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.5),
        ),
      ),
    );
  }
}
