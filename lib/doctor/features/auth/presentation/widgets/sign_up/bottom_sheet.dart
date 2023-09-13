import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_font.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'option_job_title.dart';
import 'options_cities.dart';
import 'options_sections.dart';

class BottomSheetForSignUP extends StatelessWidget {
  final String title;
  const BottomSheetForSignUP({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.tr(),
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
                    return "job_title".tr().compareTo(title) == 0
                        ? const OptionsForJobTitle()
                        : "section".tr().compareTo(title) == 0
                            ? const OptionsForsection()
                            : const OptionsForCities();
                  },
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title.tr()),
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
