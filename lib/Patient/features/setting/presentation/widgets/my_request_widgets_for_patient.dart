// ignore_for_file: must_be_immutable

import 'package:dr/Patient/features/setting/presentation/cubit/setting_cubit.dart';
import 'package:dr/Patient/features/setting/presentation/pages/requests_details_screen.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart' as intl;

// widget to show all orders in this section
class ListOfOrder extends StatelessWidget {
  int activeIndex;
  ListOfOrder({super.key, required this.activeIndex});

  @override
  Widget build(BuildContext context) {
    var listOfOrders;
    if (activeIndex == 0)
      listOfOrders = context
              .select((MyOrdersCubit cubit) => cubit.state.reviewingOrders) ??
          [];
    else if (activeIndex == 1)
      listOfOrders = context
              .select((MyOrdersCubit cubit) => cubit.state.waitConfirmOrders) ??
          [];
    else if (activeIndex == 2)
      listOfOrders = context
              .select((MyOrdersCubit cubit) => cubit.state.confirmedOrders) ??
          [];
    else if (activeIndex == 3)
      listOfOrders = context
              .select((MyOrdersCubit cubit) => cubit.state.completedOrders) ??
          [];
    else if (activeIndex == 4)
      listOfOrders =
          context.select((MyOrdersCubit cubit) => cubit.state.canceledOrders) ??
              [];
    else if (activeIndex == 5)
      listOfOrders =
          context.select((MyOrdersCubit cubit) => cubit.state.pendingOrders) ??
              [];
    return BlocBuilder<MyOrdersCubit, MyOrdersState>(
      builder: (context, state) {
        return state.loading == true
            ? Container(
                height: context.height / 2,
                child: Center(child: CircularProgressIndicator()),
              )
            : listOfOrders.length == 0
                ? Center(
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          "assets/images/noOrders.svg",
                          width: 200,
                          height: 200,
                        ),
                        10.ph,
                        Text(
                          "لا يوجد طلبات في الوقت الحالي",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                : SingleChildScrollView(
                    child: SizedBox(
                      width: context.width,
                      height: context.height * 0.75,
                      child: listOfOrders.isEmpty
                          ? SizedBox()
                          : ListView.builder(
                              itemCount: listOfOrders.length,
                              itemBuilder: (context, index) {
                                List<String> names = [];
                                String selectedName = "";
                                names.add("الاختصاص :");
                                for (var item in listOfOrders[index]
                                        .advertiser
                                        .categories ??
                                    []) {
                                  names.add(item.nameAr ?? "");
                                }
                                selectedName = names.isNotEmpty
                                    ? names[0]
                                    : 'No names available';
                                return CardsForRequests(
                                  listOfOrders: listOfOrders[index],
                                  categories: names,
                                  selectedName: selectedName,
                                  num: activeIndex,
                                );
                              },
                            ),
                    ),
                  );
      },
    );
  }
}

// widget to show one order in list of requests
class CardsForRequests extends StatefulWidget {
  int num;
  var listOfOrders, categories, selectedName;
  CardsForRequests(
      {super.key,
      required this.num,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(
                  width: context.width,
                  height: context.height * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                              child: Text(
                                "رقم الطلب : ${widget.listOfOrders.id}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            if (widget.listOfOrders.startAt != null)
                              FittedBox(
                                child: Text(
                                  "تاريخ الطلب : ${intl.DateFormat('EEEE dd/M/y').format(DateTime.parse(widget.listOfOrders.startAt))}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                              )
                          ],
                        ),
                      ),
                      10.pw,
                      Expanded(
                        child: FittedBox(
                          child: Text(
                            widget.num == 0
                                ? "قيد المراجعة \nفي انتظار القبول"
                                : widget.num == 1
                                    ? "مقبولة \nفي انتظار الدفع"
                                    : widget.num == 2
                                        ? "مؤكدة \nتم الدفع"
                                        : widget.num == 3
                                            ? "مكتملة \nتم إنهاء الزيارة"
                                            : widget.num == 4
                                                ? "ملغية \nتم الإلغاء"
                                                : "الجلسة \n قيد الانتظار",
                            style: TextStyle(
                                color: widget.num == 0
                                    ? AppColors.yellowColor
                                    : widget.num == 4
                                        ? AppColors.redColor
                                        : AppColors.greenColor,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 1,
                width: context.width,
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      child: AppConstants.customNetworkImage(
                        width: 75,
                        height: 70,
                        imageError: AppImages.doctorPlaceholder,
                        imagePath: "${widget.listOfOrders.advertiser.image}",
                      ),
                    ),
                    5.pw,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${widget.listOfOrders.advertiser.nameAr}",
                            style: const TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                          if (categories != null)
                            categories.isNotEmpty
                                ? DropdownButton<String>(
                                    padding: EdgeInsets.zero,
                                    underline: SizedBox(),
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
                                  )
                                : const Text('No Data available'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (widget.listOfOrders.parentId == 0)
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: FittedBox(
                                    child: const Text(
                                      "سعر الجلسة",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                5.pw,
                                Text(
                                  widget.listOfOrders.sessionsCount == null ||
                                          widget.listOfOrders.advertiser
                                                  .sessionPrice ==
                                              null
                                      ? ""
                                      : "${widget.listOfOrders.sessionsCount * widget.listOfOrders.advertiser.sessionPrice}",
                                  style: const TextStyle(
                                      color: AppColors.secondryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        10.ph,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: FittedBox(
                            child: Text(
                              "عدد الجلسات : ${widget.listOfOrders.sessionsCount}",
                              style:
                                  const TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SizedBox(
                      height: context.height * 0.05,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: AppColors.primaryColor,
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side:
                                const BorderSide(color: AppColors.primaryColor),
                          ),
                        ),
                        onPressed: () {
                          List<String> names = [];
                          String selectedName = "";
                          names.add("الاختصاص");
                          for (var item
                              in widget.listOfOrders.advertiser.categories) {
                            if (item != null) names.add(item.nameAr);
                          }
                          selectedName = names.isNotEmpty
                              ? names[0]
                              : 'No names available';
                          AppConstants.customNavigation(
                              context,
                              RequestsDetailsScreenForPatient(
                                oneOrder: widget.listOfOrders,
                                categories: names,
                                selectedName: selectedName,
                                num: widget.num,
                              ),
                              -1,
                              0);
                        },
                        child: Text('order_details'.tr()),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
