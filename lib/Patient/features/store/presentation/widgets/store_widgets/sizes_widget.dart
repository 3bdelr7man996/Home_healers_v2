// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class SizesWidget extends StatefulWidget {
  List<String> sizes;
  SizesWidget({super.key, required this.sizes});

  @override
  State<SizesWidget> createState() => _SizesWidgetState();
}

class _SizesWidgetState extends State<SizesWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "مقاس : ",
          style: TextStyle(fontSize: 14.0),
        ),
        SizedBox(
          width: 150,
          height: 30,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.sizes.length,
            itemBuilder: (context, index) {
              return Container(
                  margin: EdgeInsets.symmetric(horizontal: 1),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                  child: Center(child: Text(widget.sizes[index])));
            },
          ),
        )
      ],
    );
  }
}
