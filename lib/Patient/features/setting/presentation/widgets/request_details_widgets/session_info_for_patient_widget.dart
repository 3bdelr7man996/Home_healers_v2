// ignore_for_file: must_be_immutable

import 'package:dr/Patient/features/setting/presentation/cubit/setting_cubit/my_order_cubit.dart';
import 'package:dr/Patient/features/setting/presentation/widgets/request_details_widgets/one_session_info_for_patient_widget.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SessionInfoForPatient extends StatelessWidget {
  var MainOrder;
  SessionInfoForPatient({super.key, this.MainOrder});
  var sessionsInfo = [];
  @override
  Widget build(BuildContext context) {
    var allOrders =
        context.select((MyOrdersCubit cubit) => cubit.state.allOrders) ?? [];
    if (MainOrder.parentId == 0) {
      for (var order in allOrders) {
        if (order.parentId == MainOrder.id) sessionsInfo.add(order);
      }
      sessionsInfo.add(MainOrder);
    } else {
      for (var order in allOrders) {
        if (order.id == MainOrder.parentId) sessionsInfo.add(order);
        if (order.parentId == MainOrder.parentId) sessionsInfo.add(order);
      }
    }
    sessionsInfo.sort((a, b) {
      return DateTime.parse(a.startAt).compareTo(DateTime.parse(b.startAt));
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Session_details".tr(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
        ),
        10.ph,
        Container(
          height: context.height * 0.12,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: sessionsInfo.length,
            itemBuilder: (context, index) {
              var number = index + 1;
              return OneSessionInfoForPatient(
                title: number.toString(),
                date: sessionsInfo[index].startAt ?? "",
              );
            },
          ),
        ),
        //30.ph,
      ],
    );
  }
}
