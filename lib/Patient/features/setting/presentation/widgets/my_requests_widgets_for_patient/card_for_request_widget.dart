// ignore_for_file: must_be_immutable

import 'package:dr/Patient/features/setting/data/models/my_orders_model.dart';
import 'package:dr/Patient/features/setting/presentation/widgets/my_requests_widgets_for_patient/details_section_widget.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:flutter/material.dart';
import 'header_for_card_widget.dart';
import 'image_section_widget.dart';

// widget to show one order in list of requests
class CardsForRequests extends StatefulWidget {
  int TabIndexClicked;
  OrderData? listOfOrders;
  List<String>? categories;
  String? selectedName;
  CardsForRequests(
      {super.key,
      required this.TabIndexClicked,
      this.listOfOrders,
      this.selectedName,
      this.categories});

  @override
  State<CardsForRequests> createState() => _CardsForRequestsState();
}

class _CardsForRequestsState extends State<CardsForRequests> {
  var selectedName, categories;
  @override
  void initState() {
    super.initState();
    selectedName = widget.selectedName;
    categories = widget.categories;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: context.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderForCard(
                listOfOrders: widget.listOfOrders,
                TabIndexClicked: widget.TabIndexClicked,
              ),
              Container(
                height: 1,
                width: context.width,
                color: Colors.grey,
              ),
              ImageSectionForCard(
                categories: widget.categories,
                listOfOrders: widget.listOfOrders,
                selectedName: widget.selectedName,
              ),
              DetailsSectionForCard(
                  listOfOrders: widget.listOfOrders,
                  TabIndexClicked: widget.TabIndexClicked)
            ],
          ),
        ),
      ),
    );
  }
}
