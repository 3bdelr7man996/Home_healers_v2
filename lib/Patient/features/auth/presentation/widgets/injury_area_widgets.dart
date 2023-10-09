library human_anatomy;

import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class RowForCheckbox extends StatefulWidget {
  String title1, title2;
  RowForCheckbox({super.key, required this.title1, required this.title2});

  @override
  State<RowForCheckbox> createState() => _RowForCheckboxState();
}

bool check1 = false, check2 = false;

class _RowForCheckboxState extends State<RowForCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
            value: check1,
            onChanged: (value) {
              setState(() {
                check1 = !check1;
              });
            }),
        Text(
          widget.title1,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
        70.pw,
        Checkbox(
            value: check2,
            onChanged: (value) {
              setState(() {
                check2 = !check2;
              });
            }),
        Text(
          widget.title2,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class HumanAnatomy extends StatefulWidget {
  var onChanged;

  HumanAnatomy({Key? key, this.onChanged}) : super(key: key);
  @override
  _HumanAnatomyState createState() => new _HumanAnatomyState();
}

class _HumanAnatomyState extends State<HumanAnatomy> {
  var _bodyPartList = [];
  void onChanged(var title) {
    widget.onChanged(title);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bodyPartList.add("Head");
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340.0,
      height: 557,
      child: SizedBox(
        child: Stack(
          children: <Widget>[
            bodyPart("assets/icons/head.svg", "Head", 0.0, 0.0, 0.0, 70.0,
                onChanged, "الرأس"),
            bodyPart("assets/icons/left_ear.svg", "Head", 32.0, 50.0, 0.0, 20.0,
                onChanged, "الرأس"),
            bodyPart("assets/icons/right_ear.svg", "Head", 32.0, 0.0, 50.0,
                20.0, onChanged, "الرأس"),
            bodyPart("assets/icons/left_eye.svg", "Head", 22.0, 20.0, 0.0, 10.0,
                onChanged, "الرأس"),
            bodyPart("assets/icons/right_eye.svg", "Head", 22.0, 0.0, 20.0,
                10.0, onChanged, "الرأس"),
            bodyPart("assets/icons/nose.svg", "Head", 25.0, 0.0, 0.0, 20.0,
                onChanged, "الرأس"),
            bodyPart("assets/icons/mouth.svg", "Head", 48.0, 0.0, 0.0, 10.0,
                onChanged, "الرأٍس"),
            bodyPart("assets/icons/neck.svg", "middleArea", 58.0, 0.0, 0.0,
                40.0, onChanged, "المنطقة الوسطى"),
            bodyPart("assets/icons/chest.svg", "middleArea", 93.0, 0.0, 0.0,
                95.0, onChanged, "المنطقة الوسطى"),
            bodyPart("assets/icons/abdomin.svg", "middleArea", 175.0, 0.0, 0.0,
                65.0, onChanged, "المنطقة الوسطى"),
            bodyPart("assets/icons/pelvis.svg", "middleArea", 225.0, 0.0, 0.0,
                50.0, onChanged, "المنطقة الوسطى"),
            bodyPart("assets/icons/publs.svg", "middleArea", 275.0, 0.0, 0.0,
                15.0, onChanged, "المنطقة الوسطى"),
            bodyPart("assets/icons/left_soulder.svg", "LeftArm", 90.0, 105.0,
                0.0, 50.0, onChanged, "اليد اليسرى"),
            bodyPart("assets/icons/right_soulder.svg", "rightArm", 89.0, 0.0,
                110.0, 50.0, onChanged, "اليد اليمنى"),
            bodyPart("assets/icons/left_arm.svg", "LeftArm", 120.0, 145.0, 0.0,
                70.0, onChanged, "اليد اليسرى"),
            bodyPart("assets/icons/right_arm.svg", "rightArm", 118.0, 0.0,
                142.0, 70.0, onChanged, "اليد اليمنى"),
            bodyPart("assets/icons/left_elbow.svg", "LeftArm", 172.0, 172.0,
                0.0, 39.0, onChanged, "اليد اليسرى"),
            bodyPart("assets/icons/right_elbow.svg", "rightArm", 170.0, 0.0,
                170.0, 40.0, onChanged, "اليد اليمنى"),
            bodyPart("assets/icons/left_forearm.svg", "LeftArm", 195.0, 190.0,
                0.0, 54.0, onChanged, "اليد اليسرى"),
            bodyPart("assets/icons/right_forearm.svg", "rightArm", 195.0, 0.0,
                190.0, 54.0, onChanged, "اليد اليمنى"),
            bodyPart("assets/icons/left_wrist.svg", "LeftArm", 238.0, 220.0,
                0.0, 23.0, onChanged, "اليد اليسرى"),
            bodyPart("assets/icons/right_wrist.svg", "rightArm", 238.0, 0.0,
                220.0, 23.0, onChanged, "اليد اليمنى"),
            bodyPart("assets/icons/left_hand.svg", "LeftArm", 250.0, 250.0, 0.0,
                60.0, onChanged, "اليد اليسرى"),
            bodyPart("assets/icons/right_hand.svg", "rightArm", 250.0, 0.0,
                250.0, 60.0, onChanged, "اليد اليمنى"),
            bodyPart("assets/icons/left_thigh.svg", "leftLeg", 242.0, 63.0, 0.0,
                138.0, onChanged, "الرجل اليسرى"),
            bodyPart("assets/icons/right_thigh.svg", "rightLeg", 242.0, 0.0,
                63.0, 138.0, onChanged, "الرجل اليمنى"),
            bodyPart("assets/icons/left_knee.svg", "leftLeg", 360.0, 68.0, 0.0,
                48.0, onChanged, "الرجل اليسرى"),
            bodyPart("assets/icons/right_knee.svg", "rightLeg", 360.0, 0.0,
                68.0, 48.0, onChanged, "الرجل اليمنى"),
            bodyPart("assets/icons/left_leg.svg", "leftLeg", 395.0, 64.0, 0.0,
                105.0, onChanged, "الرجل اليسرى"),
            bodyPart("assets/icons/right_leg.svg", "rightLeg", 393.0, 0.0, 65.0,
                106.0, onChanged, "الرجل اليمنى"),
            bodyPart("assets/icons/left_ankle.svg", "leftLeg", 495.0, 64.0, 0.0,
                25.0, onChanged, "الرجل اليسرى"),
            bodyPart("assets/icons/right_ankle.svg", "rightLeg", 493.0, 0.0,
                68.0, 25.0, onChanged, "الرجل اليمنى"),
            bodyPart("assets/icons/left_foot.svg", "leftLeg", 510.0, 80.0, 0.0,
                60.0, onChanged, "الرجل اليسرى"),
            bodyPart("assets/icons/right_foot.svg", "rightLeg", 508.0, 0.0,
                83.0, 56.0, onChanged, "الرجل اليمنى"),
          ],
        ),
      ),
    );
  }

  Widget bodyPart(
    String svgPath,
    String svgName,
    double marginTop,
    double marginRight,
    double marginLeft,
    double height,
    Function onChanged,
    String title,
  ) {
    Color? _svgColor =
        _bodyPartList.contains(svgName) ? AppColors.primaryColor : null;
    final Widget bodyPartSvg = new SvgPicture.asset(svgPath,
        semanticsLabel: svgName, color: _svgColor);
    return Container(
      margin:
          EdgeInsets.only(top: marginTop, right: marginRight, left: marginLeft),
      height: height,
      alignment: Alignment.topCenter,
      child: GestureDetector(
          onTap: () {
            setState(() {
              if (_bodyPartList.contains(svgName)) {
                _bodyPartList.remove(svgName);
              } else {
                _bodyPartList.add(svgName);
                onChanged(title);

                // _bodyPartList.forEach((e) => print(e));
              }
            });
          },
          child: bodyPartSvg),
    );
  }
}
