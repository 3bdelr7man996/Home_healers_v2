import 'package:dr/Patient/features/home/presentation/pages/home_screen_for_patient.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PopUpForAddToFavourite extends StatelessWidget {
  final VoidCallback _toggleVisibility;
  final bool _isVisible;
  const PopUpForAddToFavourite(
      {super.key,
      required VoidCallback toggleVisibility,
      required bool isVisible})
      : this._isVisible = isVisible,
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
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      height: context.height * 0.15,
                      width: context.width * 0.8,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.close),
                                ],
                              ),
                              5.ph,
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/correct_icon.svg',
                                        width: 25,
                                        height: 25,
                                      ),
                                      10.pw,
                                      const Text("تمت الإضافة إلى المفضلة"),
                                      10.pw,
                                      InkWell(
                                        onTap: () {
                                          AppConstants.customNavigation(
                                              context,
                                              HomeScreenForPatient(
                                                  selectedIndex: 3),
                                              -1,
                                              0);
                                        },
                                        child: const Text(
                                          "المفضلة",
                                          style: TextStyle(
                                              color: AppColors.primaryColor),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
