import 'package:dr/core/extensions/padding_extension.dart';
import 'package:flutter/material.dart';

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
