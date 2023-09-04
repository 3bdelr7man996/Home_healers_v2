import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/doctor/features/home/presentation/pages/requests_details_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  final List<String> categories;
  final int activeIndex;
  final Function(int) onIndexChanged;

  Categories({
    super.key,
    required this.categories,
    required this.activeIndex,
    required this.onIndexChanged,
  });

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.05,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List<Widget>.generate(widget.categories.length, (index) {
          return GestureDetector(
            onTap: () {
              widget.onIndexChanged(index);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.height * 0.02,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 4.0,
                      color: (widget.activeIndex == index)
                          ? AppColors.primaryColor
                          : AppColors.hintColor,
                    ),
                  ),
                ),
                child: Text(
                  widget.categories[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: (widget.activeIndex == index)
                        ? AppColors.primaryColor
                        : AppColors.hintColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class Review extends StatelessWidget {
  const Review({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: context.width,
        height: context.height * 0.75,
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return Card(
              num: 1,
            );
          },
        ),
      ),
    );
  }
}

class awaitingPayment extends StatelessWidget {
  const awaitingPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: context.width,
        height: context.height * 0.75,
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return Card(
              num: 2,
            );
          },
        ),
      ),
    );
  }
}

class PaymentWasMade extends StatelessWidget {
  const PaymentWasMade({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: context.width,
        height: context.height * 0.75,
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return Card(
              num: 3,
            );
          },
        ),
      ),
    );
  }
}

class Finished extends StatelessWidget {
  const Finished({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: context.width,
        height: context.height * 0.75,
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return Card(
              num: 4,
            );
          },
        ),
      ),
    );
  }
}

class Canceled extends StatelessWidget {
  const Canceled({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: context.width,
        height: context.height * 0.75,
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return Card(
              num: 5,
            );
          },
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Card extends StatelessWidget {
  int num;
  Card({super.key, required this.num});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: context.width * 0.8,
        height: context.height * 0.4,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ],
        ),
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
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "رقم الطلب : 973",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "تاريخ الطلب : 11-06-2023",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    num == 1 || num == 2
                        ? Text(
                            num == 1
                                ? "المراجعة"
                                : num == 2
                                    ? "انتظار الدفع"
                                    : "",
                            style: const TextStyle(
                                color: AppColors.yellowColor,
                                fontWeight: FontWeight.bold),
                          )
                        : num == 3 || num == 4
                            ? Text(
                                num == 3
                                    ? "تم الدفع"
                                    : num == 4
                                        ? "منتهي"
                                        : "",
                                style: const TextStyle(
                                    color: AppColors.greenColor,
                                    fontWeight: FontWeight.bold))
                            : const Text("ملغي",
                                style: TextStyle(
                                    color: AppColors.redColor,
                                    fontWeight: FontWeight.bold))
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
                  Container(
                    width: 115,
                    height: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/person.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  10.pw,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "فارس السيد",
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w500),
                      ),
                      10.ph,
                      const Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: AppColors.primaryColor,
                          ),
                          DecoratedBox(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black,
                                  width: 1.0,
                                ),
                              ),
                            ),
                            child: Text(
                              'موقع المريض',
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "نوع الإصابة : قدم",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            10.ph,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  const Text(
                    " عدد الجلسات :",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  5.pw,
                  const Text(
                    "5",
                    style: TextStyle(
                        color: AppColors.secondryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            10.ph,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                width: context.width * 0.8,
                height: context.height * 0.05,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: AppColors.primaryColor,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: AppColors.primaryColor),
                    ),
                  ),
                  onPressed: () {
                    if (num == 1) {
                      AppConstants.customNavigation(context,
                          RequestsDetailsScreen(mainPage: "Review"), 1, 0);
                    } else if (num == 2) {
                      AppConstants.customNavigation(
                          context,
                          RequestsDetailsScreen(
                              mainPage: "Waiting for payment"),
                          1,
                          0);
                    } else if (num == 3) {
                      AppConstants.customNavigation(
                          context,
                          RequestsDetailsScreen(
                              mainPage: "The payment was made"),
                          1,
                          0);
                    } else if (num == 5) {
                      AppConstants.customNavigation(context,
                          RequestsDetailsScreen(mainPage: "Canceled"), 1, 0);
                    }
                  },
                  child: Text('order_details'.tr()),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
