// ignore_for_file: must_be_immutable

import 'package:dr/Patient/features/favorite/presentation/cubit/favorite_cubit/addFavorite_cubit.dart';
import 'package:dr/Patient/features/home/data/models/section-model.dart';
import 'package:dr/Patient/features/home/presentation/widgets/specialist_page_widgets/stars_widget.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeaderForDoctorCard extends StatefulWidget {
  VoidCallback toggleVisibility;
  bool isVisible, fromfavorite;
  String name;
  String? image;
  String status;
  Data? doctorInfo;
  List<Categories>? categories;
  bool isFav;
  HeaderForDoctorCard(
      {super.key,
      required this.isVisible,
      this.categories,
      this.isFav = false,
      this.status = "",
      this.fromfavorite = false,
      this.doctorInfo,
      this.image = "",
      required VoidCallback this.toggleVisibility,
      this.name = ""});

  @override
  State<HeaderForDoctorCard> createState() => _HeaderForDoctorCardState();
}

class _HeaderForDoctorCardState extends State<HeaderForDoctorCard> {
  List<String> names = [];
  String selectedName = "";

  @override
  void initState() {
    super.initState();
    names.add("الاختصاص");
    for (Categories item in widget.categories!) {
      names.add(item.nameAr!);
    }
    selectedName = names.isNotEmpty ? names[0] : 'No names available';
  }

  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            Container(
              width: 100,
              height: 110,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: AppConstants.customNetworkImage(
                  imagePath: "${widget.image}",
                  fit: BoxFit.fill,
                  imageError: "assets/images/doctor.png",
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: InkWell(
                onTap: () async {
                  if (widget.fromfavorite == false && widget.isFav == false) {
                    await context
                        .read<AddFavoriteCubit>()
                        .AddFavorite(context, widget.doctorInfo!.id!);

                    setState(() {
                      isFavorite = !isFavorite;
                    });

                    widget.toggleVisibility();
                  }
                },
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white,
                  child: Icon(
                    isFavorite || widget.fromfavorite || widget.isFav
                        ? Icons.favorite
                        : Icons.favorite_border,
                    size: 20,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ],
        ),
        10.pw,
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500),
              ),
              5.ph,
              Stars(rating: widget.doctorInfo!.rating!),
              5.ph,
              names.isNotEmpty
                  ? Container(
                      child: DropdownButton<String>(
                        underline: Container(), // Hide the underline

                        icon: const SizedBox(), // Hide the arrow icon
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
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    )
                  : Text(''),
              5.ph,
              widget.status == "on"
                  ? Text(
                      "متاح الآن",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.green),
                    )
                  : RichText(
                      text: const TextSpan(
                        text: '-  ',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'متاح الآن',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              decoration: TextDecoration.lineThrough,
                              decorationColor: Colors.grey,
                              decorationThickness: 2.0,
                            ),
                          ),
                        ],
                      ),
                    )
            ],
          ),
        )
      ],
    );
  }
}
