import 'package:dr/config/notifications_config/firebase_messages.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/deep_link_util.dart';
import 'package:dr/doctor/features/auth/data/model/advertiser_model.dart';
import 'package:dr/doctor/features/home/presentation/cubit/resevations_cubit/reservations_cubit.dart';
import 'package:dr/doctor/features/home/presentation/widgets/all_request_widgets/all_request_appbar.dart';
import 'package:dr/doctor/features/home/presentation/widgets/all_request_widgets/all_request_card_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dr/di_container.dart' as di;

class Allrequests extends StatefulWidget {
  const Allrequests({super.key,this.fromSetting=false});
  final bool fromSetting;
  @override
  State<Allrequests> createState() => _AllrequestsState();
}

class _AllrequestsState extends State<Allrequests> {
  Advertiser? advertiseInfo;

  @override
  void initState() {
    DeepLinkHandler().init(context);
    di.sl<FirebaseMessagingService>().onRecieveNotification(context);
    context.read<ReservationsCubit>().getReservationStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         AppBarForHome(fromSetting: widget.fromSetting,),
        30.ph,
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "all_requests".tr(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                //20.ph,
                const RequestsCardList(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
