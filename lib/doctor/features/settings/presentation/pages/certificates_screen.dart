import 'dart:io';

import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class certificatesScreen extends StatefulWidget {
  const certificatesScreen({super.key});

  @override
  State<certificatesScreen> createState() => _certificatesScreenState();
}

class _certificatesScreenState extends State<certificatesScreen> {
  List<File> photos = []; // List to hold the selected photos

  Future<void> pickAndShowPhotos() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        photos.add(File(pickedFile.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context,
          backButton: true, fromSetting: true, title: "certificates"),
      body: Column(
        children: [
          photos.length == 0
              ? Expanded(
                  child: Center(
                      child: Image.asset("assets/images/noDocument.png")))
              : Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(8.0),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: photos.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.file(
                          photos[index],
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Container(
              width: double.infinity,
              child: Material(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color:
                    AppColors.primaryColor, // Set the background color to red
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    primary: Colors
                        .transparent, // Make the background color transparent
                    shadowColor: Colors.transparent, // Remove the button shadow
                  ),
                  onPressed: () {
                    pickAndShowPhotos();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("إضافة شهادة"),
                      SizedBox(width: 5),
                      SvgPicture.asset(
                        "assets/icons/Certificates_icon.svg",
                        width: 25,
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
