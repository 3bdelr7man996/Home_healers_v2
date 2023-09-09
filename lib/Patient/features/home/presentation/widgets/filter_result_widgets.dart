import 'package:dr/Patient/features/home/presentation/pages/specialist_page_screen.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class DoctorCard extends StatefulWidget {
  VoidCallback toggleVisibility;
  bool isVisible, fromOfferScreen;
  DoctorCard({
    super.key,
    required this.isVisible,
    this.fromOfferScreen = false,
    required VoidCallback this.toggleVisibility,
  });

  @override
  State<DoctorCard> createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 3),
              blurRadius: 5,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              HeaderForDoctorCard(
                  toggleVisibility: widget.toggleVisibility,
                  isVisible: widget.isVisible),
              10.ph,
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Icon(
                    Icons.location_on,
                    color: AppColors.primaryColor,
                  ),
                  10.pw,
                  const Text(
                    "الرياض - الجزيرة",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              10.ph,
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SvgPicture.asset(
                    "assets/icons/hearing_aids_icon.svg",
                    width: 20,
                    height: 20,
                  ),
                  10.pw,
                  const Text(
                    "تخصص إصابات عضلية رياضية",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              10.ph,
              widget.fromOfferScreen
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/offer_outlined_icon.svg",
                          width: 20,
                          height: 20,
                        ),
                        10.pw,
                        const Text(
                          "سعر العرض : ",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        const Text(
                          "250 SAR",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: AppColors.secondryColor),
                        ),
                        10.pw,
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: RichText(
                            text: const TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: '800 SAR',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough,
                                      decorationColor: Colors.grey,
                                      decorationThickness: 2.0,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/money_icon.svg",
                          width: 20,
                          height: 20,
                        ),
                        10.pw,
                        const Text(
                          "سعر الجلسة : ",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        const Text(
                          "250 SAR",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: AppColors.secondryColor),
                        ),
                      ],
                    ),
              20.ph,
              const ButtonForDoctorCard()
            ],
          ),
        ),
      ),
    );
  }
}

class Stars extends StatelessWidget {
  const Stars({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: 20,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: 20,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: 20,
        ),
        Icon(
          Icons.star_half,
          color: Colors.yellow,
          size: 20,
        ),
        Icon(
          Icons.star_border,
          color: Colors.yellow,
          size: 20,
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class HeaderForDoctorCard extends StatefulWidget {
  VoidCallback toggleVisibility;
  bool isVisible;
  HeaderForDoctorCard({
    super.key,
    required this.isVisible,
    required VoidCallback this.toggleVisibility,
  });

  @override
  State<HeaderForDoctorCard> createState() => _HeaderForDoctorCardState();
}

class _HeaderForDoctorCardState extends State<HeaderForDoctorCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            Container(
              width: 150,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage("assets/images/person2.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: InkWell(
                onTap: () {
                  widget.toggleVisibility();
                },
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white,
                  child: Icon(
                    widget.isVisible ? Icons.favorite : Icons.favorite_border,
                    size: 20,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ],
        ),
        10.pw,
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "فارس الأسمري",
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500),
            ),
            5.ph,
            const Stars(),
            5.ph,
            const Text(
              "أخصائي علاج طبيعي",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            5.ph,
            RichText(
              text: const TextSpan(
                text: '-  ',
                style: TextStyle(color: Colors.grey, fontSize: 16),
                children: <TextSpan>[
                  TextSpan(
                    text: 'متاح الآن',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Colors.grey,
                      decorationThickness: 2.0,
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}

class ButtonForDoctorCard extends StatelessWidget {
  const ButtonForDoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.primaryColor,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      width: context.width,
      child: ElevatedButton(
        onPressed: () {
          AppConstants.customNavigation(context, specialistpageScreen(), -1, 0);
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text(
          'الملف الشخصي',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}

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
                                      const Text(
                                        "المفضلة",
                                        style: TextStyle(
                                            color: AppColors.primaryColor),
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
