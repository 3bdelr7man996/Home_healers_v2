import 'dart:developer';

import 'package:dr/Patient/features/home/presentation/cubit/home_cubit/secton_cubit.dart';
import 'package:dr/Patient/features/home/presentation/widgets/filter_result_widgets/button_for_doctor_card_widget.dart';
import 'package:dr/Patient/features/home/presentation/widgets/filter_result_widgets/header_for_doctor_card_widget.dart';
import 'package:dr/Patient/features/offer/data/models/get_offers_model.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:dr/doctor/features/auth/data/model/advertiser_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class DoctorCard extends StatefulWidget {
  bool fromfavorite;
  bool fromSingleOffer;
  int? status_id;
  Advertiser doctorInfo;
  bool fromOffer;
  bool fromFav;
  bool fromPackages;
  Offers? offer;
  var sessionCountForOffer;
  var fromFilter;
  var year;
  DoctorCard({
    super.key,
    this.sessionCountForOffer,
    required this.doctorInfo,
    this.fromFilter = false,
    this.fromPackages = false,
    this.fromFav = false,
    this.status_id,
    this.fromOffer = false,
    this.fromfavorite = false,
    this.offer,
    this.fromSingleOffer = false,
    this.year,
  });

  @override
  State<DoctorCard> createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {
  List<String> names = [];
  String statusName = "";
  
  @override
  void initState() {
    log("Status Advisor name ${widget.doctorInfo.statusAdvisor?.length}");
    super.initState();
    if (widget.status_id != null) {
      statusName = widget.doctorInfo.statusAdvisor
              ?.firstWhere((e) => e.id == widget.status_id)
              .nameAr ??
          '';
    } else {
      statusName = widget.doctorInfo.statusAdvisor?.first.nameAr ?? '';
    }
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
                doctorInfo: widget.doctorInfo,
                fromfavorite: widget.fromfavorite,
              ),
              10.ph,
              if (widget.doctorInfo.addressAr != null)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: AppColors.primaryColor,
                    ),
                    10.pw,
                    FutureBuilder(
                      future: context
                          .read<SectionCubit>()
                          .getAddressFromLocation(
                              lat: widget.doctorInfo.lat,
                              long: widget.doctorInfo.lng,
                              address: widget.doctorInfo.addressAr ?? ''),
                      builder: (context, snapshot) => Expanded(
                        child: Text(
                          "${snapshot.data ?? ''}",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              10.ph,
              if (statusName.isNotEmpty)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/hearing_aids_icon.svg",
                      width: 20,
                      height: 20,
                    ),
                    10.pw,
                    Text(statusName),
                  ],
                ),
              10.ph,
              widget.fromSingleOffer
                  ? Row(
                      children: [
                        SvgPicture.asset(
                          AppImages.infoIcon,
                          width: 20,
                          height: 20,
                        ),
                        10.pw,
                        const Text(
                          "وصف العرض: ",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "${widget.offer?.description ?? ''}",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
              widget.fromSingleOffer ? 10.ph : 0.ph,
              widget.fromSingleOffer
                  ? Row(
                      children: [
                        SvgPicture.asset(
                          AppImages.counterIcon,
                          width: 20,
                          height: 20,
                        ),
                        10.pw,
                        const Text(
                          " عدد الجلسات: ",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "${widget.offer?.sessionCount ?? ''} جلسات",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
              widget.fromSingleOffer ? 10.ph : 0.ph,
              widget.fromSingleOffer
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
                          "${widget.offer?.price} SAR",
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.secondryColor),
                        ),
                        15.pw,
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: '${widget.offer?.oldPrice} SAR',
                                style: const TextStyle(
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: Colors.grey,
                                    decorationThickness: 2.0,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        10.pw,
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
                          widget.doctorInfo.sessionPrice == null
                              ? " SAR"
                              : "${widget.doctorInfo.sessionPrice} SAR",
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
                  year: widget.year,
                  fromPackages: widget.fromPackages,
                  status_id: widget.status_id, //??
                  // widget.doctorInfo.statusAdvisor?.first.id,
                  fromOffer: widget.fromOffer)
            ],
          ),
        ),
      ),
    );
  }
}
