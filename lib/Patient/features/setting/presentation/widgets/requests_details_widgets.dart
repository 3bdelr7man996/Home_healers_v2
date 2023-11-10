// ignore_for_file: must_be_immutable

import 'package:dr/Patient/features/setting/presentation/cubit/setting_cubit.dart';
import 'package:dr/Patient/features/setting/presentation/pages/my_requests_screen_for_patient.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:dr/core/utils/app_strings.dart';
import 'package:dr/doctor/features/chats/presentation/pages/one_chat_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart' as intl;

class FirstSection extends StatelessWidget {
  int num;
  var listOfOrders;
  FirstSection({super.key, required this.num, this.listOfOrders});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
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
                    "رقم الطلب : ${listOfOrders.id}",
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                FittedBox(
                  child: Text(
                    "تاريخ الطلب : ${intl.DateFormat('EEEE dd/M/y').format(DateTime.parse(listOfOrders.createdAt))}",
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ),
          10.pw,
          num == 1
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
              : num == 2
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
                  : num == 3
                      ? Expanded(
                          child: const Text(
                            "مؤكدة \nتم الدفع",
                            style: TextStyle(
                                color: AppColors.greenColor,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        )
                      : num == 4
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
                          : num == 6
                              ? Expanded(
                                  child: FittedBox(
                                    child: const Text(
                                      "الجلسة \n قيد الانتظار",
                                      style: TextStyle(
                                          color: AppColors.greenColor,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                )
                              : Expanded(
                                  child: const Text(
                                    "ملغية \nتم الإلغاء",
                                    style: TextStyle(
                                        color: AppColors.redColor,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                )
        ],
      ),
    );
  }
}

class TowSection extends StatefulWidget {
  int num;
  var listOfOrders, categories, selectedName;
  TowSection(
      {super.key,
      required this.num,
      this.listOfOrders,
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
    categories = widget.categories;
    selectedName = widget.selectedName;
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
                      "${AppStrings.imageUrl}${widget.listOfOrders.advertiser.image}",
                  imageError: "assets/images/doctor.png",
                  width: context.width * 0.25,
                  height: context.width * 0.25 - 10,
                ),
              ),
              10.pw,
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
                    categories.isNotEmpty
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
                              items: categories.map<DropdownMenuItem<String>>(
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
        if (widget.num == 3 || widget.num == 4)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  AppConstants.customNavigation(
                      context,
                      OneChatScreen(
                          SenderInfo: widget.listOfOrders, fromPatient: true),
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

class Bill extends StatelessWidget {
  var listOfOrders;

  Bill({super.key, this.listOfOrders});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "مدة الجلسة :",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Text(
              "30-60 دقيقة",
              style: const TextStyle(fontWeight: FontWeight.w600),
            )
          ],
        ),
        20.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "عدد الجلسات",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Text(
              "${listOfOrders.sessionsCount}",
              style: const TextStyle(fontWeight: FontWeight.w600),
            )
          ],
        ),
        20.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "سعر الجلسة :",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Text(
              listOfOrders.advertiser.sessionPrice == null
                  ? ""
                  : "${listOfOrders.advertiser.sessionPrice} ريال",
              style: const TextStyle(
                  fontWeight: FontWeight.w600, color: AppColors.secondryColor),
            )
          ],
        ),
        20.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "كود الخصم :",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            listOfOrders.coupon == null
                ? const Text(
                    "لا يوجد",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  )
                : Text(
                    "${listOfOrders.coupon}",
                    style: const TextStyle(fontWeight: FontWeight.w600),
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
        const Divider(
          thickness: 1,
        ),
        20.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text("المجموع : ",
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
              listOfOrders.sessionsCount == null ||
                      listOfOrders.advertiser.sessionPrice == null
                  ? ""
                  : "${listOfOrders.advertiser.sessionPrice * listOfOrders.sessionsCount} ريال",
              style: const TextStyle(
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

class FirstPopUp extends StatefulWidget {
  final VoidCallback toggleVisibility;

  final VoidCallback changePopUp;
  var listOfOrders;

  FirstPopUp(
      {super.key,
      required this.toggleVisibility,
      required this.changePopUp,
      this.listOfOrders});

  @override
  State<FirstPopUp> createState() => _FirstPopUpState();
}

class _FirstPopUpState extends State<FirstPopUp> {
  @override
  Widget build(BuildContext context) {
    bool showPopUp =
        context.select((UpdateReservationCubit cubit) => cubit.state.showPoUp);
    setState(() {
      showPopUp = context
          .select((UpdateReservationCubit cubit) => cubit.state.showPoUp);
    });
    return Column(
      children: [
        const Text(
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
                padding: const EdgeInsets.all(16),
              ),
              onPressed: () async {
                print(widget.listOfOrders.id.toString());
                print(widget.listOfOrders.startAt.toString());
                print(widget.listOfOrders.endAt.toString());
                await context
                    .read<UpdateReservationCubit>()
                    .onIdChange(widget.listOfOrders.id.toString());
                await context
                    .read<UpdateReservationCubit>()
                    .onStartAtChange(widget.listOfOrders.startAt.toString());
                await context
                    .read<UpdateReservationCubit>()
                    .onEndAtChange(widget.listOfOrders.endAt.toString());
                await context
                    .read<UpdateReservationCubit>()
                    .onStatusChange("canceled");
                await context
                    .read<UpdateReservationCubit>()
                    .updateSelectedReservation(context);
                if (showPopUp) widget.changePopUp();
              },
              child: const Text('حذف'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  side: const BorderSide(color: AppColors.primaryColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0,
                  padding: const EdgeInsets.all(16),
                  backgroundColor: Colors.transparent),
              onPressed: () {
                Navigator.pop(context);
                widget.toggleVisibility();
              },
              child: const Text(
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
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () async {
              await context.read<MyOrdersCubit>().GetOrders(context);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const MyRequestsForPatient(activeIndex: 0)));
            },
            child: const Icon(
              Icons.close,
              color: AppColors.primaryColor,
            ),
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
      const Text(
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

class SessionInfoForPatient extends StatelessWidget {
  var MainOrder;
  SessionInfoForPatient({super.key, this.MainOrder});
  var sessionsInfo = [];
  @override
  Widget build(BuildContext context) {
    print("ghaith");
    print(MainOrder.parentId);
    var allOrders =
        context.select((MyOrdersCubit cubit) => cubit.state.allOrders) ?? [];
    if (MainOrder.parentId == 0) {
      for (var order in allOrders) {
        if (order.parentId == MainOrder.id) sessionsInfo.add(order);
      }
      sessionsInfo.add(MainOrder);
    } else {
      for (var order in allOrders) {
        if (order.id == MainOrder.parentId) sessionsInfo.add(order);
        if (order.parentId == MainOrder.parentId) sessionsInfo.add(order);
      }
    }
    sessionsInfo.sort((a, b) {
      return DateTime.parse(a.startAt).compareTo(DateTime.parse(b.startAt));
    });
    print(sessionsInfo.length);
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
            itemCount: sessionsInfo.length,
            itemBuilder: (context, index) {
              var number = index + 1;
              return OneSessionInfoForPatient(
                  title: number.toString(),
                  date: sessionsInfo[index].startAt ?? "",
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
  var title, date;
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
                      ' ${intl.DateFormat('EEEE dd/M/y').format(DateTime.parse(date))}',
                      textAlign: TextAlign.center,
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

class FiveStarRating extends StatefulWidget {
  final int rating;
  final Function(int) onRatingChanged;

  const FiveStarRating({
    Key? key,
    required this.rating,
    required this.onRatingChanged,
  }) : super(key: key);

  @override
  State<FiveStarRating> createState() => _FiveStarRatingState();
}

class _FiveStarRatingState extends State<FiveStarRating> {
  int _rating = 0;

  @override
  void initState() {
    super.initState();
    _rating = widget.rating;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 1; i <= 5; i++)
          InkWell(
            onTap: () {
              setState(() {
                _rating = i;
                widget.onRatingChanged(_rating);
              });
            },
            child: Icon(
              Icons.star,
              size: 40,
              color: i <= _rating ? Colors.yellow : Colors.grey,
            ),
          ),
      ],
    );
  }
}

class BottomSheetForEvalute extends StatelessWidget {
  var oneOrder;
  BottomSheetForEvalute({super.key, this.oneOrder});

  @override
  Widget build(BuildContext context) {
    void _onSendCommentPressed() {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: SvgPicture.asset("assets/icons/correct_icon.svg"),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("تم إرسال تعليقك"),
            ],
          ),
        ),
      );
    }

    return SizedBox(
        height: 350,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: Column(
            children: [
              const Text(
                "اكتب تعليقك",
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              15.ph,
              FiveStarRating(
                rating: 0,
                onRatingChanged: (rating) async {
                  await context.read<evaluationCubit>().onRateChange(rating);
                },
              ),
              15.ph,
              TextFormField(
                maxLines: 5,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(16),
                  hintText: "اكتب تعليقك ...",
                ),
              ),
              15.ph,
              BlocBuilder<evaluationCubit, evaluationsState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      context.read<evaluationCubit>().sendEvaluation(
                          context,
                          oneOrder.advertiserId,
                          oneOrder.userId,
                          _onSendCommentPressed);
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          AppColors.primaryColor),
                      minimumSize: MaterialStateProperty.all<Size>(
                        const Size(double.infinity, 50),
                      ),
                    ),
                    child: const Text(
                      'إرسال التعليق',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ));
  }
}
