import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:flutter/material.dart';

class ColorSectionWidget extends StatefulWidget {
  const ColorSectionWidget({super.key});

  @override
  State<ColorSectionWidget> createState() => _ColorSectionWidgetState();
}

class _ColorSectionWidgetState extends State<ColorSectionWidget> {
  List<Color> colors = [
    Colors.blue,
    Colors.blue,
    Colors.blue,
    Colors.blue,
    Colors.blue,
    Colors.blue,
    Colors.blue,
    Colors.blue
  ];
  int activeIndexForColors = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "اللون : ",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Divider(
                  thickness: 0.5,
                ),
              ),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SizedBox(
              width: context.width,
              height: 50.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: colors.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        activeIndexForColors = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 5.0),
                      width: 45.0,
                      height: 45.0,
                      child: activeIndexForColors == index
                          ? Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : SizedBox(),
                      decoration: BoxDecoration(
                        color: colors[index],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  );
                },
              ),
            )),
      ],
    );
  }
}
