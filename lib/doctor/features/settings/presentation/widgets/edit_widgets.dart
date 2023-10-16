import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImage extends StatefulWidget {
  const ProfileImage({
    Key? key,
  }) : super(key: key);
  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  late File _imageFile;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _imageFile = File('assets/images/doctor.png');
  }

  // Function to pick an image from the gallery
  Future pickImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _imageFile = File(pickedImage.path);
      } else {
        _imageFile = File('assets/images/doctor.png');
        if (kDebugMode) {
          print('No image selected.');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: <Widget>[
            CircleAvatar(
              radius: 80,
              backgroundColor: Colors.grey[300],
              backgroundImage: _imageFile.existsSync()
                  ? Image.file(_imageFile).image
                  : const AssetImage('assets/images/doctor.png'),
            ),
            InkWell(
              onTap: () {
                pickImage();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  "assets/icons/pick_image_icon.svg",
                  width: 40,
                  height: 40,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
