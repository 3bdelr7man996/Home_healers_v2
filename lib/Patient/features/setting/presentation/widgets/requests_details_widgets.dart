import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FirstSection extends StatelessWidget {
  int num;
  FirstSection({super.key, required this.num});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
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
    );
  }
}

class TowSection extends StatelessWidget {
  int num;

  TowSection({super.key, required this.num});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
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
        if (num == 3 || num == 4)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/icons/message_icon.svg",
                width: 35,
                height: 35,
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

class Bill extends StatelessWidget {
  const Bill({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "مدة الجلسة :",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Text(
              "30 : 60 دقيقة",
              style: TextStyle(fontWeight: FontWeight.w600),
            )
          ],
        ),
        20.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "عدد الجلسات",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Text(
              "4",
              style: TextStyle(fontWeight: FontWeight.w600),
            )
          ],
        ),
        20.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "سعر الجلسة :",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Text(
              "250 ريال",
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: AppColors.secondryColor),
            )
          ],
        ),
        20.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "كود الخصم :",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Text(
              "لا يوجد",
              style: TextStyle(fontWeight: FontWeight.w600),
            )
          ],
        ),
        20.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "الضريبة :",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Text(
              "0 ريال",
              style: TextStyle(fontWeight: FontWeight.w600),
            )
          ],
        ),
        20.ph,
        Divider(
          thickness: 1,
        ),
        20.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("المجموع : ", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
              "350 ريال",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: AppColors.secondryColor),
            )
          ],
        )
      ],
    );
  }
}

class PopUpForRemoveRequest extends StatefulWidget {
  final VoidCallback _toggleVisibility;
  final VoidCallback changePopUp;
  final bool _isVisible;
  final bool firstPopUp;
  const PopUpForRemoveRequest(
      {super.key,
      required VoidCallback toggleVisibility,
      required VoidCallback changePopUp,
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
      child: Positioned.fill(
        child: GestureDetector(
          onTap: widget._toggleVisibility,
          child: Container(
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
                                  changePopUp: widget.changePopUp,
                                  toggleVisibility: widget._toggleVisibility,
                                )
                              : SecondPopUp()),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FirstPopUp extends StatefulWidget {
  final VoidCallback toggleVisibility;

  final VoidCallback changePopUp;

  FirstPopUp(
      {super.key, required this.toggleVisibility, required this.changePopUp});

  @override
  State<FirstPopUp> createState() => _FirstPopUpState();
}

class _FirstPopUpState extends State<FirstPopUp> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "هل ترغب حقا في \nحذف الطلب ؟",
          style:
              TextStyle(fontSize: 18, fontWeight: FontWeight.bold, height: 1.5),
          textAlign: TextAlign.center,
        ),
        20.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(16),
              ),
              onPressed: () {
                widget.changePopUp();
              },
              child: Text('حذف'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  side: BorderSide(color: AppColors.primaryColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0,
                  padding: EdgeInsets.all(16),
                  backgroundColor: Colors.transparent),
              onPressed: () {
                widget.toggleVisibility();
              },
              child: Text(
                'عودة',
                style: TextStyle(color: AppColors.primaryColor),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class SecondPopUp extends StatelessWidget {
  const SecondPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.close,
            color: AppColors.primaryColor,
          ),
        ],
      ),
      SizedBox(
        height: 50,
        width: 50,
        child: AppConstants.customAssetSvg(
          imagePath: AppImages.correctIcon,
          fit: BoxFit.none,
        ),
      ),
      15.ph,
      Text(
        "تم حذف الطلب بنجاح",
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      10.ph,
    ]);
  }
}

const sessions = [
  {"الأولى", "22-5-2023"},
  {"الثانية", "22-5-2023"},
  {"الرابعة", "15-2-2023"},
  {"الخامسة", "22-5-2023"},
  {"السادسة", "22-5-2023"},
];
const checked = [true, true, false, false, false];

// ignore: must_be_immutable
class SessionInfoForPatient extends StatelessWidget {
  SessionInfoForPatient({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Session_details".tr(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
        ),
        10.ph,
        Container(
          height: context.height * 0.15,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: sessions.length,
            itemBuilder: (context, index) {
              return OneSessionInfoForPatient(
                  title: sessions[index].first,
                  date: sessions[index].last,
                  checked: checked[index]);
            },
          ),
        ),
        30.ph,
      ],
    );
  }
}

class OneSessionInfoForPatient extends StatelessWidget {
  String title, date;
  bool checked;
  OneSessionInfoForPatient({
    super.key,
    required this.title,
    required this.date,
    required this.checked,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8,
      ),
      child: Column(
        children: [
          Container(
            width: context.width * 0.25,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(color: Colors.transparent, width: 1),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        5.ph,
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        5.ph,
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      date,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          10.ph,
        ],
      ),
    );
  }
}
