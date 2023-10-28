import 'package:dr/Patient/features/auth/presentation/widgets/injury_area_widgets.dart';
import 'package:dr/Patient/features/home/presentation/cubit/home_cubit.dart';
import 'package:dr/Patient/features/home/presentation/pages/date_of_session_screen.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InjuryAreaScreen extends StatefulWidget {
  var Data, status_id, fromOffer;
  InjuryAreaScreen({super.key, this.Data, this.status_id, this.fromOffer});

  @override
  State<InjuryAreaScreen> createState() => _InjuryAreaScreenState();
}

class _InjuryAreaScreenState extends State<InjuryAreaScreen> {
  String titleForCheckBox = "الرأس";
  List<String> CheckBoxShow = ['الوجه'];
  List<String> CheckBoxForRightArm = [
    "الكتف الأيمن",
    "المرفق الأيمن",
    "الرسخ الأيمن",
    "الذراع الأيمن",
    "الساعد الأيمن",
    " الكف الأيمن"
  ];
  List<String> CheckBoxForLiftArm = [
    "الكتف الأيسر ",
    "المرفق الأيسر ",
    "الرسخ الأيسر ",
    "الذراع الأيسر ",
    "الساعد الأيسر ",
    "الكف الأيسر"
  ];
  List<String> CheckBoxForMidlleArea = [
    "أعلى الظهر",
    "أسفل الظهر",
    "الصدر",
    "الرقبة",
    "البطن",
    "الحوض",
    "الورك"
  ];
  List<String> CheckBoxForLeftLeg = [
    "الفخذ الأيسر",
    "الساق الأيسر",
    "الركبة اليسرى",
    "الكاحل الأيسر",
    "القدم الأيسر",
  ];
  List<String> CheckBoxForRightLeg = [
    "الفخذ الأيمن",
    "الساق الأيمن",
    "الركبة اليمنى",
    "الكاحل الأيمن",
    "القدم الأيمن",
  ];
  List<String> CheckBoxForHead = ['الوجه'];
  List<String> ListOfResult = [];
  Map<String, bool> checkedValues = {};
  Map<String, bool> checkedValuesForHead = {};
  Map<String, bool> checkedValuesForLiftLeg = {};
  Map<String, bool> checkedValuesLiftarm = {};
  Map<String, bool> checkedValuesRightLeg = {};
  Map<String, bool> checkedValuesRightArm = {};
  Map<String, bool> checkedValuesMiddlearea = {};

  void showCheckBox(var title) {
    print("asdf");
    print(title);
    setState(() {
      titleForCheckBox = title;
      if (title == "الرأس") {
        CheckBoxShow = CheckBoxForHead;
        checkedValues = checkedValuesForHead;
      } else if (title == "اليد اليمنى") {
        CheckBoxShow = CheckBoxForRightArm;
        checkedValues = checkedValuesRightArm;
      } else if (title == "اليد اليسرى") {
        CheckBoxShow = CheckBoxForLiftArm;
        checkedValues = checkedValuesLiftarm;
      } else if (title == "المنطقة الوسطى") {
        CheckBoxShow = CheckBoxForMidlleArea;
        checkedValues = checkedValuesMiddlearea;
      } else if (title == "الرجل اليسرى") {
        CheckBoxShow = CheckBoxForLeftLeg;
        checkedValues = checkedValuesForLiftLeg;
      } else if (title == "الرجل اليمنى") {
        CheckBoxShow = CheckBoxForRightLeg;
        checkedValues = checkedValuesRightLeg;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.Data);
    print(widget.fromOffer);
    print(widget.status_id);
    return Scaffold(
      appBar: customAppBar(context, title: "injury_area", backButton: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  HumanAnatomy(onChanged: showCheckBox),
                  25.ph,
                  Text(
                    titleForCheckBox,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  10.ph,
                  SizedBox(
                    height: 250,
                    child: GridView.count(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      crossAxisCount: 2,
                      children: CheckBoxShow.map((item) => CheckboxListTile(
                            value: checkedValues[item] ?? false,
                            onChanged: (value) {
                              if (ListOfResult.contains(item)) {
                                ListOfResult.remove(item);
                              } else {
                                ListOfResult.add(item);
                              }
                              print(ListOfResult);

                              setState(() {
                                checkedValues[item] = value!;
                              });
                            },
                            title: Text(item),
                            contentPadding: EdgeInsets.only(
                                left:
                                    30), // Set the contentPadding to a negative value to bring the text closer to the checkbox.
                          )).toList(),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    width: context.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        primary: AppColors.primaryColor,
                      ),
                      onPressed: () {
                        print(ListOfResult.join(","));
                        print("////////////////");
                        if (ListOfResult.length != 0) {
                          context
                              .read<ReservationCubit>()
                              .onChangePainPlace(ListOfResult.join(", "));
                          AppConstants.customNavigation(
                              context,
                              DateOfSessionScreen(
                                  Data: widget.Data,
                                  status_id: widget.status_id,
                                  fromOffer: widget.fromOffer),
                              1,
                              0);
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: const Text(
                          'متابعة',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  10.ph,
                  // SizedBox(
                  //   width: context.width,
                  //   child: ElevatedButton(
                  //     style: ElevatedButton.styleFrom(
                  //       elevation: 0,
                  //       primary: Colors.transparent,
                  //     ),
                  //     onPressed: () {},
                  //     child: const Text(
                  //       'تخطي',
                  //       style: TextStyle(color: AppColors.primaryColor),
                  //     ),
                  //   ),
                  // ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
