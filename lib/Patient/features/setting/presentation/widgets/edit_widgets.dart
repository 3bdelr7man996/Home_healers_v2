import 'dart:convert';
import 'dart:io';

import 'package:dr/Patient/features/home/presentation/widgets/sections_widgets.dart';
import 'package:dr/Patient/features/setting/presentation/cubit/setting_cubit.dart';
import 'package:dr/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImageForPatient extends StatefulWidget {
  const ProfileImageForPatient({
    Key? key,
  }) : super(key: key);
  @override
  State<ProfileImageForPatient> createState() => _ProfileImageForPatientState();
}

class _ProfileImageForPatientState extends State<ProfileImageForPatient> {
  late File _imageFile;
  final picker = ImagePicker();
  var userInfo;
  var jsonData;
  var image;

  @override
  void initState() {
    super.initState();
    _imageFile = File('assets/images/doctor.png');

    getAttributeFromSharedPreferences().then((value) {
      setState(() {
        userInfo = value;
        jsonData = jsonDecode(userInfo);
      });
    });
  }

  Future pickImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _imageFile = File(pickedImage.path);
        context.read<UpdateInfoCubit>().onimageChange(_imageFile);
        print(_imageFile);
      } else {
        _imageFile = File('assets/images/doctor.png');
        print('No image selected.');
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
            jsonData == null && jsonData["image"] == null
                ? CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.grey[300],
                    backgroundImage:
                        _imageFile != null && _imageFile.existsSync()
                            ? Image.file(_imageFile).image
                            : const AssetImage('assets/images/doctor.png'),
                  )
                : Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                          image: NetworkImage(
                            "${AppStrings.divUrl}/upload/${jsonData["image"]}",
                          ),
                          fit: BoxFit.cover,
                          onError: (exception, stackTrace) =>
                              {print(exception)},
                        )),
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
