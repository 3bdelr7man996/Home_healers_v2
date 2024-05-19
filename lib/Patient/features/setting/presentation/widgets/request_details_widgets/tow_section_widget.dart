// ignore_for_file: must_be_immutable

import 'package:dr/Patient/features/setting/data/models/my_orders_model.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:dr/doctor/features/chats/presentation/pages/one_chat_screen.dart';
import 'package:dr/features/auth/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TowSection extends StatefulWidget {
  int TabIndexClicked;
  OrderData? listOfOrders;
  var categories, selectedName, notificationOrder;
  bool fromNotification;
  TowSection(
      {super.key,
      required this.TabIndexClicked,
      this.listOfOrders,
      this.notificationOrder,
      this.fromNotification = false,
      this.categories,
      this.selectedName});

  @override
  State<TowSection> createState() => _TowSectionState();
}

class _TowSectionState extends State<TowSection> {
  List<String> categories = [];
  String selectedName = "";
  @override
  void initState() {
    super.initState();
    if (widget.fromNotification == false) {
      categories = widget.categories;
      selectedName = widget.selectedName;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: AppConstants.customNetworkImage(
                  imagePath:
                      "${widget.fromNotification ? widget.notificationOrder[0]['advertiser']['image'] : widget.listOfOrders?.advertiser.image}",
                  imageError: AppImages.doctorPlaceholder,
                  width: context.width * 0.2,
                  height: context.width * 0.2,
                ),
              ),
              10.pw,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.fromNotification ? widget.notificationOrder[0]['advertiser']['name_ar'] : widget.listOfOrders?.advertiser.nameAr}",
                      style: const TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    widget.fromNotification
                        ? SizedBox()
                        : categories.isNotEmpty
                            ? SizedBox(
                                height: 35,
                                child: DropdownButton<String>(
                                  padding: EdgeInsets.zero,
                                  underline: SizedBox(), // Hide the underline
                                  value: selectedName,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedName = newValue!;
                                    });
                                  },
                                  items: categories
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(fontSize: 14.0),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              )
                            : const Text('No Data available'),
                  ],
                ),
              )
            ],
          ),
        ),
        if (widget.TabIndexClicked == 2 || widget.TabIndexClicked == 3)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  AppConstants.customNavigation(
                      context,
                      OneChatScreen(
                          recieverInfo: UserData().copyWith(
                              advertiser: widget.listOfOrders?.advertiser),
                          fromPatient: true),
                      -1,
                      0);
                },
                child: SvgPicture.asset(
                  "assets/icons/message_icon.svg",
                  width: 35,
                  height: 35,
                ),
              ),
              5.pw,
              SvgPicture.asset(
                "assets/icons/call_icon.svg",
                width: 35,
                height: 35,
              ),
            ],
          )
      ],
    );
  }
}
