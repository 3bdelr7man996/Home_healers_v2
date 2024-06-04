import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_font.dart';
import 'package:dr/doctor/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'option_job_title.dart';
import 'options_cities.dart';
import 'options_sections.dart';

class BottomSheetForSignUP extends StatefulWidget {
  final String title;
  BottomSheetForSignUP({super.key, required this.title});
  @override
  State<BottomSheetForSignUP> createState() => _BottomSheetForSignUPState();
}

class _BottomSheetForSignUPState extends State<BottomSheetForSignUP> {
  // var jobTitle = "المسمى";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title.tr(),
            style: bigBlackFont(fontWeight: FontWeight.w500),
          ),
          5.ph,
          SizedBox(
            height: context.height * 0.05,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black54,
                side: const BorderSide(color: Colors.black54, width: 0.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return "job_title".tr().compareTo(widget.title) == 0
                        ? OptionsForJobTitle()
                        : "section".tr().compareTo(widget.title) == 0
                            ? OptionsForsection()
                            : OptionsForCities();
                  },
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "job_title".tr().compareTo(widget.title) == 0
                      ? Text(
                          context.select((AuthCubit cubit) => cubit.jobTitle))
                      : "section".tr().compareTo(widget.title) == 0
                          ? Text(context
                              .select((AuthCubit cubit) => cubit.section))
                          : Text(
                              context.select((AuthCubit cubit) => cubit.city)),
                  const Icon(Icons.arrow_forward_ios_outlined),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
