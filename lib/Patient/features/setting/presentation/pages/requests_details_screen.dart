// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:dr/Patient/features/setting/data/models/my_orders_model.dart';
import 'package:dr/Patient/features/setting/presentation/widgets/request_details_widgets/bill_widget.dart';
import 'package:dr/Patient/features/setting/presentation/widgets/request_details_widgets/first_section_widget.dart';
import 'package:dr/Patient/features/setting/presentation/widgets/request_details_widgets/popup_for_remove_request_widget.dart';
import 'package:dr/Patient/features/setting/presentation/widgets/request_details_widgets/session_info_for_patient_widget.dart';
import 'package:dr/Patient/features/setting/presentation/widgets/request_details_widgets/special_option_widget.dart';
import 'package:dr/Patient/features/setting/presentation/widgets/request_details_widgets/tow_section_widget.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class RequestsDetailsScreenForPatient extends StatefulWidget {
  int? TabIndexClicked;
  OrderData? oneOrder;
  List<String>? categories;
  String? selectedName;
  bool fromNotification;
  var notificationOrder;
  RequestsDetailsScreenForPatient(
      {super.key,
      required this.TabIndexClicked,
      this.notificationOrder,
      this.oneOrder,
      this.fromNotification = false,
      this.categories,
      this.selectedName});

  @override
  State<RequestsDetailsScreenForPatient> createState() =>
      _RequestsDetailsScreenForPatientState();
}

class _RequestsDetailsScreenForPatientState
    extends State<RequestsDetailsScreenForPatient> {
  bool _isVisible = false;
  bool _firstPopUp = false;

  void toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
      _firstPopUp = !_firstPopUp;
    });
  }

  void changePopUp() {
    setState(() {
      _firstPopUp = !_firstPopUp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, backButton: true, title: "order_details"),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FirstSection(
                    fromNotification: widget.fromNotification,
                    TabIndexClicked: widget.TabIndexClicked!,
                    notificationOrder: widget.notificationOrder,
                    listOfOrders: widget.oneOrder,
                  ),
                  20.ph,
                  const Divider(
                    thickness: 1,
                  ),
                  20.ph,
                  TowSection(
                    TabIndexClicked: widget.TabIndexClicked!,
                    fromNotification: widget.fromNotification,
                    notificationOrder: widget.notificationOrder,
                    listOfOrders: widget.oneOrder,
                    categories: widget.categories,
                    selectedName: widget.selectedName,
                  ),
                  20.ph,
                  const Divider(
                    thickness: 1,
                  ),
                  widget.fromNotification
                      ? SizedBox()
                      : widget.TabIndexClicked == 1 ||
                              widget.TabIndexClicked == 2 ||
                              widget.TabIndexClicked == 3 ||
                              widget.TabIndexClicked == 4
                          ? SessionInfoForPatient(
                              MainOrder: widget.oneOrder,
                            )
                          : const SizedBox(),
                  const Text(
                    "تفاصيل الإجمالي",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  20.ph,
                  Bill(
                    fromNotification: widget.fromNotification,
                    notificationOrder: widget.notificationOrder,
                    listOfOrders: widget.oneOrder,
                  ),
                  30.ph,
                  SpecialOptions(
                    TabIndexClicked: widget.TabIndexClicked!,
                    categories: widget.categories,
                    fromNotification: widget.fromNotification,
                    oneOrder: widget.oneOrder,
                    selectedName: widget.selectedName,
                    toggleVisibility: toggleVisibility,
                  )
                ],
              ),
            ),
          ),
          Container(
            height: context.height,
            child: PopUpForRemoveRequest(
              listOfOrders: widget.oneOrder,
              toggleVisibility: toggleVisibility,
              changePopUp: changePopUp,
              isVisible: _isVisible,
              firstPopUp: _firstPopUp,
            ),
          )
        ],
      ),
    );
  }
}
