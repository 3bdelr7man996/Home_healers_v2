// ignore_for_file: must_be_immutable

import 'package:dr/Patient/features/setting/presentation/cubit/setting_cubit.dart';
import 'package:dr/Patient/features/setting/presentation/pages/requests_details_screen.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as intl;

class underProcessing extends StatelessWidget {
  const underProcessing({super.key});

  @override
  Widget build(BuildContext context) {
    var listOfOrders =
        context.select((MyOrdersCubit cubit) => cubit.state.reviewingOrders) ??
            [];
    print(listOfOrders);
    return SingleChildScrollView(
      child: SizedBox(
        width: context.width,
        height: context.height * 0.75,
        child: listOfOrders.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: listOfOrders.length,
                itemBuilder: (context, index) {
                  List<String> names = [];
                  String selectedName = "";
                  for (var item in listOfOrders[index].advertiser.categories) {
                    names.add(item.nameAr ?? "");
                  }
                  selectedName =
                      names.isNotEmpty ? names[0] : 'No names available';
                  return CardsForRequests(
                    listOfOrders: listOfOrders[index],
                    categories: names,
                    selectedName: selectedName,
                    num: 1,
                  );
                },
              ),
      ),
    );
  }
}

class Accepted extends StatelessWidget {
  const Accepted({super.key});

  @override
  Widget build(BuildContext context) {
    var listOfOrders = context
            .select((MyOrdersCubit cubit) => cubit.state.waitConfirmOrders) ??
        [];
    return SingleChildScrollView(
      child: SizedBox(
        width: context.width,
        height: context.height * 0.75,
        child: ListView.builder(
          itemCount: listOfOrders.length,
          itemBuilder: (context, index) {
            List<String> names = [];
            String selectedName = "";
            for (var item in listOfOrders[index].advertiser.categories) {
              names.add(item.nameAr ?? "");
            }
            selectedName = names.isNotEmpty ? names[0] : 'No names available';
            return CardsForRequests(
              categories: names,
              selectedName: selectedName,
              listOfOrders: listOfOrders[index],
              num: 2,
            );
          },
        ),
      ),
    );
  }
}

class Confirmed extends StatelessWidget {
  const Confirmed({super.key});

  @override
  Widget build(BuildContext context) {
    var listOfOrders =
        context.select((MyOrdersCubit cubit) => cubit.state.confirmedOrders) ??
            [];
    return SingleChildScrollView(
      child: SizedBox(
        width: context.width,
        height: context.height * 0.75,
        child: listOfOrders.isEmpty
            ? const SizedBox()
            : ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  List<String> names = [];
                  String selectedName = "";
                  for (var item in listOfOrders[index].advertiser.categories) {
                    names.add(item.nameAr ?? "");
                  }
                  selectedName =
                      names.isNotEmpty ? names[0] : 'No names available';

                  return CardsForRequests(
                    categories: names,
                    selectedName: selectedName,
                    listOfOrders: listOfOrders[index],
                    num: 3,
                  );
                },
              ),
      ),
    );
  }
}

class completed extends StatelessWidget {
  const completed({super.key});

  @override
  Widget build(BuildContext context) {
    var listOfOrders =
        context.select((MyOrdersCubit cubit) => cubit.state.completedOrders) ??
            [];
    return SingleChildScrollView(
      child: SizedBox(
        width: context.width,
        height: context.height * 0.75,
        child: listOfOrders.isEmpty
            ? const SizedBox()
            : ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  List<String> names = [];
                  String selectedName = "";
                  for (var item in listOfOrders[index].advertiser.categories) {
                    names.add(item.nameAr ?? "");
                  }
                  selectedName =
                      names.isNotEmpty ? names[0] : 'No names available';
                  return CardsForRequests(
                    categories: names,
                    selectedName: selectedName,
                    listOfOrders: listOfOrders[index],
                    num: 4,
                  );
                },
              ),
      ),
    );
  }
}

class canceledRequests extends StatelessWidget {
  const canceledRequests({super.key});

  @override
  Widget build(BuildContext context) {
    var listOfOrders =
        context.select((MyOrdersCubit cubit) => cubit.state.canceledOrders) ??
            [];
    print(listOfOrders);
    return SingleChildScrollView(
      child: SizedBox(
        width: context.width,
        height: context.height * 0.75,
        child: listOfOrders.isEmpty
            ? const SizedBox()
            : ListView.builder(
                itemCount: listOfOrders.length,
                itemBuilder: (context, index) {
                  List<String> names = [];
                  String selectedName = "";
                  for (var item in listOfOrders[index].advertiser.categories) {
                    names.add(item.nameAr ?? "");
                  }
                  selectedName =
                      names.isNotEmpty ? names[0] : 'No names available';
                  return CardsForRequests(
                    categories: names,
                    selectedName: selectedName,
                    listOfOrders: listOfOrders[index],
                    num: 5,
                  );
                },
              ),
      ),
    );
  }
}

class Pending extends StatelessWidget {
  const Pending({super.key});

  @override
  Widget build(BuildContext context) {
    var listOfOrders =
        context.select((MyOrdersCubit cubit) => cubit.state.pendingOrders) ??
            [];
    return SingleChildScrollView(
      child: SizedBox(
        width: context.width,
        height: context.height * 0.75,
        child: listOfOrders.isEmpty
            ? const SizedBox()
            : ListView.builder(
                itemCount: listOfOrders.length,
                itemBuilder: (context, index) {
                  List<String> names = [];
                  String selectedName = "";
                  for (var item in listOfOrders[index].advertiser.categories) {
                    names.add(item.nameAr ?? "");
                  }
                  selectedName =
                      names.isNotEmpty ? names[0] : 'No names available';
                  return CardsForRequests(
                    categories: names,
                    selectedName: selectedName,
                    listOfOrders: listOfOrders[index],
                    num: 6,
                  );
                },
              ),
      ),
    );
  }
}

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
                        flex: 2,
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
                            FittedBox(
                              child: Text(
                                "تاريخ الطلب : ${intl.DateFormat('EEEE dd/M/y').format(DateTime.parse(widget.listOfOrders.startAt))}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 14),
                              ),
                            )
                          ],
                        ),
                      ),
                      10.pw,
                      widget.num == 1
                          ? Expanded(
                              child: FittedBox(
                                child: const Text(
                                  "قيد المراجعة \nفي انتظار القبول",
                                  style: TextStyle(
                                      color: AppColors.yellowColor,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          : widget.num == 2
                              ? Expanded(
                                  child: FittedBox(
                                    child: const Text(
                                      "مقبولة \nفي انتظار الدفع",
                                      style: TextStyle(
                                          color: AppColors.greenColor,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                )
                              : widget.num == 3
                                  ? Expanded(
                                      child: FittedBox(
                                        child: const Text(
                                          "مؤكدة \nتم الدفع",
                                          style: TextStyle(
                                              color: AppColors.greenColor,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    )
                                  : widget.num == 4
                                      ? Expanded(
                                          child: FittedBox(
                                            child: const Text(
                                              "مكتملة \nتم إنهاء الزيارة",
                                              style: TextStyle(
                                                  color: AppColors.greenColor,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        )
                                      : widget.num == 6
                                          ? Expanded(
                                              child: FittedBox(
                                                child: const Text(
                                                  "الجلسة \n قيد الانتظار",
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.greenColor,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            )
                                          : Expanded(
                                              child: FittedBox(
                                                child: const Text(
                                                  "ملغية \nتم الإلغاء",
                                                  style: TextStyle(
                                                      color: AppColors.redColor,
                                                      fontWeight:
                                                          FontWeight.bold),
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
                    // widget.listOfOrders.advertiser.image != null
                    //     ?
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      child: AppConstants.customNetworkImage(
                        width: 75,
                        height: 70,
                        imageError: "assets/images/doctor.png",
                        imagePath:
                            "${AppStrings.imageUrl}${widget.listOfOrders.advertiser.image}",
                      ),
                    ),
                    // : const DecorationImage(
                    //     image: AssetImage("assets/images/doctor.png"),
                    //     fit: BoxFit.cover,
                    //   ),
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
                          //5.ph,
                          if (categories != null)
                            categories.isNotEmpty
                                ? DropdownButton<String>(
                                    padding: EdgeInsets.zero,
                                    underline: SizedBox(), // Hide the underline
                                    // icon: const SizedBox(), // Hide the arrow icon
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
                                  "${widget.listOfOrders.sessionsCount * widget.listOfOrders.advertiser.sessionPrice}",
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
                          for (var item
                              in widget.listOfOrders.advertiser.categories) {
                            if (item != null) names.add(item.nameAr);
                          }
                          selectedName = names.isNotEmpty
                              ? names[0]
                              : 'No names available';
                          if (widget.num == 1) {
                            AppConstants.customNavigation(
                                context,
                                RequestsDetailsScreenForPatient(
                                  oneOrder: widget.listOfOrders,
                                  categories: names,
                                  selectedName: selectedName,
                                  num: 1,
                                ),
                                -1,
                                0);
                          } else if (widget.num == 2) {
                            AppConstants.customNavigation(
                                context,
                                RequestsDetailsScreenForPatient(
                                  num: 2,
                                  oneOrder: widget.listOfOrders,
                                  categories: names,
                                  selectedName: selectedName,
                                ),
                                -1,
                                0);
                          } else if (widget.num == 3) {
                            AppConstants.customNavigation(
                                context,
                                RequestsDetailsScreenForPatient(
                                  num: 3,
                                  oneOrder: widget.listOfOrders,
                                  categories: names,
                                  selectedName: selectedName,
                                ),
                                -1,
                                0);
                          } else if (widget.num == 4) {
                            AppConstants.customNavigation(
                                context,
                                RequestsDetailsScreenForPatient(
                                  num: 4,
                                  oneOrder: widget.listOfOrders,
                                  categories: names,
                                  selectedName: selectedName,
                                ),
                                -1,
                                0);
                          } else if (widget.num == 6) {
                            AppConstants.customNavigation(
                                context,
                                RequestsDetailsScreenForPatient(
                                  num: 6,
                                  oneOrder: widget.listOfOrders,
                                  categories: names,
                                  selectedName: selectedName,
                                ),
                                -1,
                                0);
                          } else {
                            AppConstants.customNavigation(
                                context,
                                RequestsDetailsScreenForPatient(
                                  num: 5,
                                  oneOrder: widget.listOfOrders,
                                  categories: names,
                                  selectedName: selectedName,
                                ),
                                -1,
                                0);
                          }
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
