import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/doctor/features/home/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class FullScreenImage extends StatelessWidget {
  String pathImage;
  FullScreenImage({super.key, required String this.pathImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, backButton: true),
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          width: context.width,
          height: context.height,
          color: AppColors.blackColor,
          child: Image.asset(
            pathImage,
            width: context.width,
            height: context.height,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomBottomNavigation extends StatefulWidget {
  int selectedIndex;
  CustomBottomNavigation({super.key, required int this.selectedIndex});

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
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
            AppConstants.customNavigation(
                context,
                HomeScreen(
                  selectedIndex: index,
                ),
                1,
                0);
          },
          elevation: 0,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.5),
        ),
      ),
    );
  }
}
