// ignore_for_file: must_be_immutable

import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class OneSessionInfoForPatient extends StatelessWidget {
  var title, date;
  OneSessionInfoForPatient({
    super.key,
    required this.title,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8,
      ),
      child: Column(
        children: [
          Container(
            width: context.width * 0.3,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(color: Colors.transparent, width: 1),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        5.ph,
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        5.ph,
                      ],
                    ),
                  ),
                ),
                if (date != null)
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        ' ${intl.DateFormat('EEEE dd/M/y').format(DateTime.parse(date))}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          //  10.ph,
        ],
      ),
    );
  }
}
