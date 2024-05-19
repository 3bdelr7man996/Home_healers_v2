// ignore_for_file: must_be_immutable

import 'package:dr/Patient/features/setting/presentation/cubit/setting_cubit/my_order_cubit.dart';
import 'package:dr/Patient/features/setting/presentation/pages/my_requests_screen_for_patient.dart';
import 'package:dr/Patient/features/setting/presentation/widgets/request_details_widgets/first_popup_widget.dart';
import 'package:dr/Patient/features/setting/presentation/widgets/request_details_widgets/second_popup_widget.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopUpForRemoveRequest extends StatefulWidget {
  final VoidCallback _toggleVisibility;
  final VoidCallback changePopUp;
  final bool _isVisible;
  final bool firstPopUp;
  var listOfOrders;
  PopUpForRemoveRequest(
      {super.key,
      required VoidCallback toggleVisibility,
      required VoidCallback changePopUp,
      this.listOfOrders,
      required bool firstPopUp,
      required bool isVisible})
      : _isVisible = isVisible,
        firstPopUp = firstPopUp,
        changePopUp = changePopUp,
        _toggleVisibility = toggleVisibility;

  @override
  State<PopUpForRemoveRequest> createState() => _PopUpForRemoveRequestState();
}

class _PopUpForRemoveRequestState extends State<PopUpForRemoveRequest> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget._isVisible,
      child: GestureDetector(
        onTap: widget.firstPopUp
            ? widget._toggleVisibility
            : () async {
                await context.read<MyOrdersCubit>().GetOrders(context);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const MyRequestsForPatient(activeIndex: 0)));
                widget._toggleVisibility;
              },
        child: Container(
          height: context.height,
          color: Colors.black54,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: context.height * 0.3),
                child: Center(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    width: context.width * 0.8,
                    child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: widget.firstPopUp
                            ? FirstPopUp(
                                listOfOrders: widget.listOfOrders,
                                changePopUp: widget.changePopUp,
                                toggleVisibility: widget._toggleVisibility,
                              )
                            : const SecondPopUp()),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
