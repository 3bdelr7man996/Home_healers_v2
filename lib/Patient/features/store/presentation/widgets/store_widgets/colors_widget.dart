// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ColorsWidget extends StatefulWidget {
  List<String> colors;
  ColorsWidget({super.key, required this.colors});

  @override
  State<ColorsWidget> createState() => _ColorsWidgetState();
}

class _ColorsWidgetState extends State<ColorsWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "ألوان : ",
          style: TextStyle(fontSize: 14.0),
        ),
        SizedBox(
          width: 150,
          height: 30,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.colors.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 1),
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
