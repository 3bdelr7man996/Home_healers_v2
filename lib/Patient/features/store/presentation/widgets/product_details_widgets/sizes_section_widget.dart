import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SizesSectionWidget extends StatefulWidget {
  const SizesSectionWidget({super.key});

  @override
  State<SizesSectionWidget> createState() => _SizesSectionWidgetState();
}

class _SizesSectionWidgetState extends State<SizesSectionWidget> {
  List<String> Sizes = ["x", "2x", "3x", "4x"];
  int activeIndexForSizes = 0;
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
                "المقاس : ",
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
              itemCount: Sizes.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      activeIndexForSizes = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 5.0),
                    width: 45.0,
                    height: 45.0,
                    child: Center(
                        child: Text(
                      Sizes[index],
                      style: TextStyle(fontSize: 24),
                    )),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: activeIndexForSizes == index
                            ? AppColors.primaryColor
                            : Colors.transparent,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
