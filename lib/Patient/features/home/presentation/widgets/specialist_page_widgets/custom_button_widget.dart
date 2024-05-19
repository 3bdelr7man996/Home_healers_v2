// ignore_for_file: must_be_immutable

import 'package:dr/Patient/features/auth/presentation/pages/injury_area_screen.dart';
import 'package:dr/Patient/features/home/presentation/cubit/home_cubit/reservation_cubit.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/doctor/features/auth/data/model/advertiser_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonWithCounter extends StatefulWidget {
  Advertiser? doctorInfo;
  int? status_id;
  bool fromOffer;
  bool fromFav;
  bool fromPackages;
  var sessionCountForOffer;
  var fromFilter;
  ButtonWithCounter(
      {super.key,
      this.doctorInfo,
      this.fromFilter,
      this.status_id,
      this.sessionCountForOffer,
      this.fromPackages = false,
      this.fromFav = false,
      this.fromOffer = false});

  @override
  State<ButtonWithCounter> createState() => _ButtonWithCounterState();
}

class _ButtonWithCounterState extends State<ButtonWithCounter> {
  int number = 1;
  @override
  void initState() {
    super.initState();
    // context.read<ReservationCubit>().initReservationData();
    // context.read<ReservationCubit>().getCurrentPosition();
    // if (widget.sessionCountForOffer != null) {
    //   context
    //       .read<ReservationCubit>()
    //       .OnChangeSessionCount(widget.sessionCountForOffer);
    // } else {
    //   context.read<ReservationCubit>().OnChangeSessionCount(1);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              widget.sessionCountForOffer != null
                  ? SizedBox()
                  : InkWell(
                      onTap: () {
                        setState(() {
                          number++;
                          context
                              .read<ReservationCubit>()
                              .increaseSessionsCount();
                        });
                      },
                      child: const Icon(
                        Icons.add_circle,
                        size: 35,
                        color: AppColors.primaryColor,
                      ),
                    ),
              5.pw,
              Text(
                widget.sessionCountForOffer != null
                    ? '${widget.sessionCountForOffer}'
                    : '${number}',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
              5.pw,
              widget.sessionCountForOffer != null
                  ? SizedBox()
                  : InkWell(
                      onTap: () {
                        setState(() {
                          if (number > 1) {
                            number--;
                            context
                                .read<ReservationCubit>()
                                .decraseSessionsCount();
                          }
                        });
                      },
                      child: const Icon(
                        Icons.remove_circle,
                        size: 35,
                        color: AppColors.primaryColor,
                      ),
                    ),
            ],
          ),
          Container(
            width: 250,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InjuryAreaScreen(
                      fromFav: widget.fromFav,
                      status_id: widget.status_id,
                      sessionCountForOffer: widget.sessionCountForOffer,
                      doctorInfo: widget.doctorInfo,
                      fromFilter: widget.fromFilter,
                      fromOffer: widget.fromOffer,
                      fromPackage: widget.fromPackages,
                    ),
                  ),
                );
                // AppConstants.customNavigation(
                //     context,
                //     InjuryAreaScreen(
                //       sessionCountForOffer: widget.sessionCountForOffer,
                //       Data: widget.Data,
                //       fromFilter: false,
                //       fromOffer: false,
                //       fromPackage: false,
                //     ),

                // DateOfSessionScreen(
                //     Data: widget.Data,
                //     fromFilter: widget.fromFilter,
                //     status_id: widget.status_id,
                //     fromOffer: widget.fromOffer),
                // -1,
                // 0);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
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
          ),
        ],
      ),
    );
  }
}
