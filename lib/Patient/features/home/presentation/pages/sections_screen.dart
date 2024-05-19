// ignore_for_file: unused_element

import 'package:dr/Patient/features/favorite/presentation/cubit/favorite_cubit/favorite_cubit.dart';
import 'package:dr/Patient/features/home/presentation/cubit/home_cubit/ads_cubit.dart';
import 'package:dr/Patient/features/home/presentation/cubit/home_cubit/reservation_cubit.dart';
import 'package:dr/Patient/features/home/presentation/widgets/sections_widgets/bottomSheet_widget.dart';
import 'package:dr/Patient/features/home/presentation/widgets/sections_widgets/custom_appBar_widget.dart';
import 'package:dr/Patient/features/home/presentation/widgets/sections_widgets/icons_for_sections_widget.dart';
import 'package:dr/Patient/features/home/presentation/widgets/sections_widgets/slider_widget.dart';
import 'package:dr/Patient/features/setting/presentation/cubit/setting_cubit/evaluation_cubit.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/deep_link_util.dart';
import 'package:dr/core/utils/firebase_analytic_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dr/config/notifications_config/firebase_messages.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dr/di_container.dart' as di;

class SectionsScreen extends StatefulWidget {
  final BuildContext context;

  const SectionsScreen({required this.context, Key? key}) : super(key: key);

  @override
  State<SectionsScreen> createState() => _SectionsScreenState();
}

class _SectionsScreenState extends State<SectionsScreen> {
  IsGuest() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('guest');
  }

  @override
  void initState() {
    super.initState();
    di.sl<FirebaseMessagingService>().requestNotificPermission();
    DeepLinkHandler().init(context);
    context.read<ReservationCubit>().onChangestatus_id(-1);
    di.sl<FirebaseMessagingService>().onRecieveNotification(context);
    context.read<GetAllAdsCubit>().GetAllAds(context);

    FirebaseAnalyticUtil.logAppOpen();

    var isGuestExist = IsGuest();
    if (isGuestExist == false)
      context.read<FavoriteCubit>().GetFavorite(context);
  }

  @override
  Widget build(BuildContext context) {
    void didChangeDependencies() {
      super.didChangeDependencies();
      if (context.select(
              (evaluationCubit cubit) => cubit.state.showEvaluationPopUp) ==
          1) {
        Future.delayed(Duration.zero, () {
          showModalBottomSheet(
            context: widget.context,
            builder: (BuildContext context) {
              return const BottomSheetForPatient();
            },
          );
        });
        context.read<evaluationCubit>().onshowEvaluationPopUpChange();
      }
    }

    return Column(
      children: [
        const CustumAppBarForPatient(),
        10.ph,
        const SliderForPatient(),
        10.ph,
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "الأقسام",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
        ),
        10.ph,
        Expanded(child: IconsForSections()),
      ],
    );
  }
}
