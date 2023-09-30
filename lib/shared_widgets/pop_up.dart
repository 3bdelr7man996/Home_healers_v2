import 'package:dr/Patient/features/auth/presentation/pages/injury_area_screen.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:dr/doctor/features/home/presentation/pages/home_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PopUpForSignUp extends StatelessWidget {
  final VoidCallback _toggleVisibility;
  final bool _isVisible;
  final int rollSelected;
  const PopUpForSignUp(
      {super.key,
      required VoidCallback toggleVisibility,
      required this.rollSelected,
      required bool isVisible})
      : _isVisible = isVisible,
        _toggleVisibility = toggleVisibility;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _isVisible,
      child: Positioned.fill(
        child: GestureDetector(
          onTap: _toggleVisibility,
          child: Container(
            color: Colors.black54,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: context.height * 0.3),
                  child: Center(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      height: context.height * 0.3,
                      width: context.width * 0.8,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.close),
                                ],
                              ),
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: AppConstants.customAssetSvg(
                                  imagePath: AppImages.correctIcon,
                                  fit: BoxFit.none,
                                ),
                              ),
                              10.ph,
                              Text("Congratulations".tr()),
                              10.ph,
                              Text("account_created".tr()),
                              10.ph,
                              ElevatedButton(
                                onPressed: () {
                                  _toggleVisibility();
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration:
                                          const Duration(milliseconds: 500),
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        return SlideTransition(
                                          position: Tween<Offset>(
                                            begin: const Offset(0, 1),
                                            end: Offset.zero,
                                          ).animate(animation),
                                          child: child,
                                        );
                                      },
                                      pageBuilder: (context, animation,
                                          secondaryAnimation) {
                                        return rollSelected == 1
                                            ? HomeScreen(
                                                selectedIndex: 0,
                                              )
                                            : const InjuryAreaScreen();
                                      },
                                    ),
                                  );
                                },
                                style: ButtonStyle(
                                  shape:
                                      MaterialStateProperty.all<OutlinedBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: const BorderSide(
                                          color: AppColors.primaryColor),
                                    ),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.primaryColor),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  fixedSize: MaterialStateProperty.all<Size>(
                                      Size(context.width * 0.6, 50)),
                                ),
                                child: Text('go_to_main_screen'.tr()),
                              ),
                            ]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
