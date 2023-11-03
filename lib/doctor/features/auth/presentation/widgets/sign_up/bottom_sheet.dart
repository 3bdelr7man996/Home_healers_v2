import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_font.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

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
  var jobTitle = "المسمى";
  var section = "القسم";
  var city = "المدينة";
  changeTitle(var value, int number) {
    if (number == 1)
      setState(() {
        jobTitle = value;
      });
    else if (number == 2)
      setState(() {
        section = value;
      });
    else
      setState(() {
        city = value;
      });
  }

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
                        ? OptionsForJobTitle(changeTitle: changeTitle)
                        : "section".tr().compareTo(widget.title) == 0
                            ? OptionsForsection(changeTitle: changeTitle)
                            : OptionsForCities(changeTitle: changeTitle);
                  },
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "job_title".tr().compareTo(widget.title) == 0
                      ? Text(jobTitle)
                      : "section".tr().compareTo(widget.title) == 0
                          ? Text(section)
                          : Text(city),
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
