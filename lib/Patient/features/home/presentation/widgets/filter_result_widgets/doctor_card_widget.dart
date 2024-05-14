import 'package:dr/Patient/features/home/data/models/section-model.dart';
import 'package:dr/Patient/features/home/presentation/widgets/filter_result_widgets/button_for_doctor_card_widget.dart';
import 'package:dr/Patient/features/home/presentation/widgets/filter_result_widgets/header_for_doctor_card_widget.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class DoctorCard extends StatefulWidget {
  VoidCallback toggleVisibility;
  bool isVisible, fromOfferScreen, fromfavorite;
  String name;
  String address;
  String status;
  String? image;
  int? price;
  List<StatusAdvisor>? statusAdvisor;
  List<Categories>? categories;
  int? status_id;
  Data? doctorInfo;
  bool fromOffer;
  bool fromFav;
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
      this.fromFav = false,
      this.status_id,
      this.doctorInfo,
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
    for (StatusAdvisor item in widget.statusAdvisor!) {
      names.add(item.nameAr!);
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
                  doctorInfo: widget.doctorInfo,
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
                          underline: Container(),
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
                        // Padding(
                        //   padding: const EdgeInsets.only(bottom: 4),
                        //   child: RichText(
                        //     text: const TextSpan(
                        //       children: <TextSpan>[
                        //         TextSpan(
                        //           text: '800 SAR',
                        //           style: TextStyle(
                        //               color: Colors.grey,
                        //               decoration: TextDecoration.lineThrough,
                        //               decorationColor: Colors.grey,
                        //               decorationThickness: 2.0,
                        //               fontSize: 14),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // )
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
                  fromFav: widget.fromFav,
                  offer: widget.offer,
                  fromFilter: widget.fromFilter,
                  sessionCountForOffer: widget.sessionCountForOffer,
                  doctorInfo: widget.doctorInfo,
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