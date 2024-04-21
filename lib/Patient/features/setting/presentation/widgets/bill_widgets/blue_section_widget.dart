// ignore_for_file: must_be_immutable

import 'package:dr/Patient/features/setting/presentation/cubit/setting_cubit/my_order_cubit.dart';
import 'package:dr/Patient/features/setting/presentation/cubit/setting_state/my_order_state.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class BlueSection extends StatefulWidget {
  var oneOrder;
  BlueSection({super.key, this.oneOrder});

  @override
  State<BlueSection> createState() => _BlueSectionState();
}

class _BlueSectionState extends State<BlueSection> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyOrdersCubit, MyOrdersState>(
      builder: (context, state) {
        return Container(
          color: Color.fromARGB(129, 109, 219, 244),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "التاريخ و الوقت : ${widget.oneOrder.createdAt}",
                    ),
                    SvgPicture.asset(
                      "assets/images/mainlogo.svg",
                      width: 45,
                      height: 45,
                    ),
                  ],
                ),
                10.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    state.inVoice == null
                        ? Text("")
                        : Text(
                            "السجل الضريبي :${state.inVoice.data.taxNumber}"),
                    state.inVoice == null
                        ? Text("")
                        : Text("${state.inVoice.data.phone}")
                  ],
                ),
                10.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    state.inVoice == null
                        ? Text("")
                        : Text("${state.inVoice.data.email}")
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
