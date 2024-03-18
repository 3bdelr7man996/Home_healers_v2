// ignore_for_file: must_be_immutable

import 'package:dr/Patient/features/home/presentation/widgets/specialist_page_widgets/stars_widget.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:flutter/material.dart';

import '../../../data/models/section-model.dart';

class PictureForSpecialist extends StatefulWidget {
  Data? doctorInfo;
  PictureForSpecialist({
    this.doctorInfo,
    super.key,
  });

  @override
  State<PictureForSpecialist> createState() => _PictureForSpecialistState();
}

class _PictureForSpecialistState extends State<PictureForSpecialist> {
  List<String> names = [];
  String selectedName = "";

  @override
  void initState() {
    super.initState();
    names.add("الاختصاص");
    for (Categories item in widget.doctorInfo!.categories!) {
      names.add(item.nameAr!);
    }
    selectedName = names.isNotEmpty ? names[0] : 'No names available';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: 145,
              height: 175,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: AppConstants.customNetworkImage(
                  imagePath: "${widget.doctorInfo!.image}",
                  fit: BoxFit.fill,
                  imageError: "assets/images/doctor.png",
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // image: widget.image != null
                //     ? DecorationImage(
                //         image: NetworkImage(
                //           "${AppStrings.imageUrl}${widget.image}",
                //         ),
                //         fit: BoxFit.cover,
                //         onError: (exception, stackTrace) => {print(exception)},
                //       )
                //     : DecorationImage(
                //         image: AssetImage("assets/images/doctor.png"),
                //         fit: BoxFit.cover,
                //       ),
              ),
            ),
            // child: Container(
            //   width: 150,
            //   height: 100,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(10),
            //     image: widget.Data["image"] != null
            //         ? DecorationImage(
            //             image: NetworkImage(
            //               "${AppStrings.imageUrl}${widget.Data["image"]}",
            //             ),
            //             fit: BoxFit.cover,
            //             onError: (exception, stackTrace) => {print(exception)},
            //           )
            //         : DecorationImage(
            //             image: AssetImage("assets/images/doctor.png"),
            //             fit: BoxFit.cover,
            //           ),
            //   ),
            // ),
          ),
          10.pw,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.doctorInfo!.nameAr!,
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500),
                ),
                5.ph,
                if (names.isNotEmpty)
                  Container(
                    height: 20,
                    child: DropdownButton<String>(
                      underline: Container(), // Hide the underline
                      // icon: const SizedBox(), // Hide the arrow icon
                      value: selectedName,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedName = newValue!;
                        });
                      },
                      items:
                          names.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(fontSize: 12.0),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                5.ph,
                Stars(rating: widget.doctorInfo!.rating),
                5.ph,
                widget.doctorInfo!.status == "on"
                    ? const Text(
                        " متاح الان",
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      )
                    : RichText(
                        text: const TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: '- غير متاح الآن ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: Colors.grey,
                                  decorationThickness: 2.0,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
