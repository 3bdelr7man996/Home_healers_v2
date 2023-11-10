import 'dart:ffi';

import 'package:dr/Patient/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:dr/Patient/features/home/presentation/cubit/home_cubit.dart';
import 'package:dr/Patient/features/home/presentation/widgets/sections_widgets.dart';
import 'package:dr/Patient/features/setting/presentation/cubit/setting_cubit.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    // TODO: implement initState
    super.initState();

    context.read<GetAllAdsCubit>().GetAllAds(context);
    var isGuestExist = IsGuest();
    print(isGuestExist);
    print("\\\\\\\\\\\\\\\\\\\\\\");
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
