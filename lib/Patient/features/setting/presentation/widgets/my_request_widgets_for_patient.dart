import 'package:dr/Patient/features/setting/presentation/pages/requests_details_screen.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class underProcessing extends StatelessWidget {
  const underProcessing({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: context.width,
        height: context.height * 0.75,
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return CardsForRequests(
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
    return SingleChildScrollView(
      child: Container(
        width: context.width,
        height: context.height * 0.75,
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return CardsForRequests(
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
    return SingleChildScrollView(
      child: Container(
        width: context.width,
        height: context.height * 0.75,
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return CardsForRequests(
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
    return SingleChildScrollView(
      child: Container(
        width: context.width,
        height: context.height * 0.75,
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return CardsForRequests(
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
    return SingleChildScrollView(
      child: Container(
        width: context.width,
        height: context.height * 0.75,
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return CardsForRequests(
              num: 5,
            );
          },
        ),
      ),
    );
  }
}

class CardsForRequests extends StatelessWidget {
  int num;

  CardsForRequests({super.key, required this.num});

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
              offset: Offset(0, 1),
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
                      num == 1
                          ? const Text(
                              "قيد المراجعة \nفي انتظار القبول",
                              style: TextStyle(
                                  color: AppColors.yellowColor,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            )
                          : num == 2
                              ? const Text(
                                  "مقبولة \nفي انتظار الدفع",
                                  style: TextStyle(
                                      color: AppColors.greenColor,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                )
                              : num == 3
                                  ? const Text(
                                      "مؤكدة \nتم الدفع",
                                      style: TextStyle(
                                          color: AppColors.greenColor,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    )
                                  : num == 4
                                      ? const Text(
                                          "مكتملة \nتم إنهاء الزيارة",
                                          style: TextStyle(
                                              color: AppColors.greenColor,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        )
                                      : const Text(
                                          "ملغية \nتم الإلغاء",
                                          style: TextStyle(
                                              color: AppColors.redColor,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
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
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                        ),
                        10.ph,
                        Text(
                          "أخصائي علاج طبيعي",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            const Text(
                              "سعر الجلسة",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            5.pw,
                            const Text(
                              "250 SAR",
                              style: TextStyle(
                                  color: AppColors.secondryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      10.ph,
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          "عدد الجلسات : 4",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
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
                          if (num == 1)
                            AppConstants.customNavigation(context,
                                RequestsDetailsScreenForPatient(num: 1), -1, 0);
                          else if (num == 2)
                            AppConstants.customNavigation(context,
                                RequestsDetailsScreenForPatient(num: 2), -1, 0);
                          else if (num == 3)
                            AppConstants.customNavigation(context,
                                RequestsDetailsScreenForPatient(num: 3), -1, 0);
                          else if (num == 4)
                            AppConstants.customNavigation(context,
                                RequestsDetailsScreenForPatient(num: 4), -1, 0);
                          else
                            AppConstants.customNavigation(context,
                                RequestsDetailsScreenForPatient(num: 5), -1, 0);
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
