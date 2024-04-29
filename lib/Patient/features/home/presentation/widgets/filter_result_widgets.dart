// ignore_for_file: must_be_immutable

import 'package:dr/Patient/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:dr/Patient/features/home/presentation/cubit/home_cubit.dart';
import 'package:dr/Patient/features/home/presentation/pages/home_screen_for_patient.dart';
import 'package:dr/Patient/features/home/presentation/pages/specialist_page_screen.dart';
import 'package:dr/Patient/features/home/presentation/widgets/specialist_page_widgets.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class DoctorCard extends StatefulWidget {
  VoidCallback toggleVisibility;
  bool isVisible, fromOfferScreen, fromfavorite;
  String name;
  String address;
  String status;
  String? image;
  var price;
  var statusAdvisor;
  var categories;
  var status_id;
  var Data;
  bool fromOffer;
  bool fromPackages;
  var offer;
  var sessionCountForOffer;
  var isFav;
  var fromFilter;
  DoctorCard(
      {super.key,
      this.sessionCountForOffer,
      required this.isVisible,
      this.fromFilter = false,
      this.isFav = false,
      this.fromPackages = false,
      this.status_id,
      this.Data,
      this.fromOffer = false,
      this.fromfavorite = false,
      this.fromOfferScreen = false,
      this.statusAdvisor,
      this.categories,
      this.offer,
      this.price = 0,
      this.status = "",
      this.address = "",
      required VoidCallback this.toggleVisibility,
      this.image = "",
      this.name = ""});

  @override
  State<DoctorCard> createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {
  List<String> names = [];
  String selectedName = "";
  @override
  void initState() {
    super.initState();

    names.add("الأقسام :");
    for (var item in widget.statusAdvisor) {
      names.add(item['name_ar']);
    }
    selectedName = names.isNotEmpty ? names[0] : 'No names available';
  }

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
                  isFav: widget.isFav,
                  status: widget.status,
                  categories: widget.categories,
                  name: widget.name,
                  image: widget.image,
                  data: widget.Data,
                  fromfavorite: widget.fromfavorite,
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
                  Expanded(
                    child: Text(
                      widget.address,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              10.ph,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/hearing_aids_icon.svg",
                    width: 20,
                    height: 20,
                  ),
                  10.pw,
                  names.isNotEmpty
                      ? DropdownButton<String>(
                          underline: Container(), // Hide the underline
                          // icon: const SizedBox(), // Hide the arrow icon
                          value: selectedName,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedName = newValue!;
                            });
                          },
                          items: names
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        )
                      : Text('لا يوجد بيانات لعرضها')
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
                        Text(
                          "${widget.price} SAR",
                          style: const TextStyle(
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
                        Text(
                          widget.price == null ? " SAR" : "${widget.price} SAR",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: AppColors.secondryColor),
                        ),
                      ],
                    ),
              20.ph,
              ButtonForDoctorCard(
                  offer: widget.offer,
                  fromFilter: widget.fromFilter,
                  sessionCountForOffer: widget.sessionCountForOffer,
                  Data: widget.Data,
                  fromPackages: widget.fromPackages,
                  status_id: widget.status_id,
                  fromOffer: widget.fromOffer)
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderForDoctorCard extends StatefulWidget {
  VoidCallback toggleVisibility;
  bool isVisible, fromfavorite;
  String name;
  String? image;
  String status;
  var data;
  var categories;
  var isFav;
  HeaderForDoctorCard(
      {super.key,
      required this.isVisible,
      this.categories,
      this.isFav = false,
      this.status = "",
      this.fromfavorite = false,
      this.data,
      this.image = "",
      required VoidCallback this.toggleVisibility,
      this.name = ""});

  @override
  State<HeaderForDoctorCard> createState() => _HeaderForDoctorCardState();
}

class _HeaderForDoctorCardState extends State<HeaderForDoctorCard> {
  List<String> names = [];
  String selectedName = "";

  @override
  void initState() {
    super.initState();
    names.add("الاختصاص");
    for (var item in widget.categories) {
      names.add(item['name_ar']);
    }
    selectedName = names.isNotEmpty ? names[0] : 'No names available';
  }

  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            Container(
              width: 100,
              height: 110,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: AppConstants.customNetworkImage(
                  imagePath: "${widget.image}",
                  fit: BoxFit.fill,
                  imageError: "assets/images/doctor.png",
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: InkWell(
                onTap: () async {
                  if (widget.fromfavorite == false && widget.isFav == false) {
                    print(widget.data);

                    await context
                        .read<AddFavoriteCubit>()
                        .AddFavorite(context, widget.data["id"]);

                    setState(() {
                      isFavorite = !isFavorite;
                    });

                    widget.toggleVisibility();
                  }
                },
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white,
                  child: Icon(
                    isFavorite || widget.fromfavorite || widget.isFav
                        ? Icons.favorite
                        : Icons.favorite_border,
                    size: 20,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ],
        ),
        10.pw,
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500),
              ),
              5.ph,
              Stars(rating: widget.data['rating']),
              5.ph,
              names.isNotEmpty
                  ? Container(
                      child: DropdownButton<String>(
                        underline: Container(), // Hide the underline

                        icon: const SizedBox(), // Hide the arrow icon
                        value: selectedName,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedName = newValue!;
                          });
                        },
                        items:
                            names.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    )
                  : Text(''),
              5.ph,
              widget.status == "on"
                  ? Text(
                      "متاح الآن",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.green),
                    )
                  : RichText(
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
          ),
        )
      ],
    );
  }
}

class ButtonForDoctorCard extends StatelessWidget {
  var Data;
  var status_id;
  bool fromOffer;
  bool fromPackages;
  var sessionCountForOffer;
  var fromFilter;
  var offer;
  ButtonForDoctorCard(
      {super.key,
      this.Data,
      this.offer,
      this.fromFilter = false,
      this.fromPackages = false,
      this.sessionCountForOffer,
      this.status_id,
      this.fromOffer = false});

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
          if (offer != null)
            context.read<ReservationCubit>().OnOfferChange(offer);
          AppConstants.customNavigation(
              context,
              specialistpageScreen(
                  fromPackages: fromPackages,
                  Data: Data,
                  status_id: status_id,
                  fromOffer: fromOffer,
                  fromFilter: fromFilter,
                  sessionCountForOffer: sessionCountForOffer),
              -1,
              0);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
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
