// ignore_for_file: must_be_immutable

import 'package:dr/Patient/features/home/presentation/cubit/home_cubit/reservation_cubit.dart';
import 'package:dr/Patient/features/home/presentation/widgets/specialist_page_widgets/appBar_widget.dart';
import 'package:dr/Patient/features/home/presentation/widgets/specialist_page_widgets/certificates_widget.dart';
import 'package:dr/Patient/features/home/presentation/widgets/specialist_page_widgets/custom_button_widget.dart';
import 'package:dr/Patient/features/home/presentation/widgets/specialist_page_widgets/picture_section_widget.dart';
import 'package:dr/Patient/features/home/presentation/widgets/specialist_page_widgets/specialist_info_widget.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/doctor/features/auth/data/model/advertiser_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class specialistpageScreen extends StatefulWidget {
  Advertiser? doctorInfo;
  int? status_id;
  bool fromPackages;
  bool fromFav;
  bool fromOffer;
  var sessionCountForOffer;
  var year;
  bool? fromFilter;
  specialistpageScreen(
      {super.key,
      this.doctorInfo,
      this.fromFilter = false,
      this.fromFav = false,
      this.fromPackages = false,
      this.status_id,
      this.fromOffer = false,
      this.year,
      this.sessionCountForOffer});

  @override
  State<specialistpageScreen> createState() => _specialistpageScreenState();
}

class _specialistpageScreenState extends State<specialistpageScreen> {
  bool click = false;
  late bool IsUserGuest;
  @override
  void initState() {
    super.initState();
    IsUserGuest = false;
    IsGuest();
    context.read<ReservationCubit>().initReservationData();
    context.read<ReservationCubit>().getCurrentPosition();
    if (widget.sessionCountForOffer != null) {
      context
          .read<ReservationCubit>()
          .OnChangeSessionCount(widget.sessionCountForOffer);
    } else {
      context.read<ReservationCubit>().OnChangeSessionCount(1);
    }
  }

  IsGuest() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      IsUserGuest = prefs.containsKey('guest');
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.doctorInfo);

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                ApPBarForspecialistScreen(),
                Container(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 75.0, left: 20.0, right: 20.0),
                      child: Column(
                        children: [
                          specialistInfo(
                            doctorInfo: widget.doctorInfo,
                          ),
                          20.ph,
                          const Divider(
                            thickness: 1,
                          ),
                          5.ph,
                          widget.doctorInfo!.images != null
                              ? const Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "شهادات مهنية :",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                )
                              : SizedBox(),
                          5.ph,
                          widget.doctorInfo?.images != null
                              ? Certificates(Data: widget.doctorInfo!.images)
                              : SizedBox(),
                          5.ph,
                          IsUserGuest == true
                              ? SizedBox()
                              : click
                                  ? ButtonWithCounter(
                                      fromFav: widget.fromFav,
                                      fromPackages: widget.fromPackages,
                                      sessionCountForOffer:
                                          widget.sessionCountForOffer,
                                      doctorInfo: widget.doctorInfo,
                                      fromFilter: widget.fromFilter,
                                      status_id: widget.status_id,
                                      fromOffer: widget.fromOffer)
                                  : widget.doctorInfo!.status == "on"
                                      ? Container(
                                          width: double.infinity,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                click = !click;
                                              });
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  AppColors.primaryColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.all(16.0),
                                              child: Text(
                                                'احجز الآن',
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                          ),
                                        )
                                      : Container(
                                          width: double.infinity,
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.grey,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.all(16.0),
                                              child: Text(
                                                ' غير متاح الحجز الان',
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                          ),
                                        ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 140,
              left: 25,
              right: 25,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                height: 175,
                child: PictureForSpecialist(doctorInfo: widget.doctorInfo),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
