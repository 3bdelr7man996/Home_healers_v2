import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:flutter/material.dart';

class ImagesBannersWidget extends StatefulWidget {
  const ImagesBannersWidget({super.key});

  @override
  State<ImagesBannersWidget> createState() => _ImagesBannersWidgetState();
}

class _ImagesBannersWidgetState extends State<ImagesBannersWidget> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: AppConstants.customNetworkImage(
                  imagePath: "asd",
                  width: context.width,
                  fit: BoxFit.fill,
                  imageError: "assets/images/placeholder.png",
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Positioned(
              top: 25,
              left: 25,
              child: InkWell(
                onTap: () async {},
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.favorite,
                    size: 20,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          width: context.width,
          height: context.height * 0.2,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    activeIndex = index;
                  });
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  padding: EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: AppConstants.customNetworkImage(
                      imagePath: "asd",
                      width: context.width * 0.5,
                      fit: BoxFit.fill,
                      imageError: "assets/images/placeholder.png",
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: activeIndex == index
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
      ],
    );
  }
}
