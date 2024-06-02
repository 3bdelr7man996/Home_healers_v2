// ignore_for_file: unnecessary_null_comparison

import 'package:dr/Patient/features/setting/presentation/cubit/edit_acc_cubit/edit_user_acc_cubit.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileImageForPatient extends StatelessWidget {
  const ProfileImageForPatient({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 150,
          width: 150,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            //shape: BoxShape.circle,
            borderRadius: BorderRadius.all(Radius.circular(75.0)),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(75.0)),
            child: BlocBuilder<EditUserAccCubit, EditUserAccState>(
              buildWhen: (previous, current) =>
                  previous.img != current.img ||
                  previous.userInfo != current.userInfo,
              builder: (context, state) {
                if (state.img != null && state.img!.path.isNotEmpty) {
                  return AppConstants.customFileImage(
                      file: state.img!,
                      fit: BoxFit.fill,
                      width: 150,
                      height: 150);
                } else {
                  return AppConstants.customNetworkImage(
                    imagePath: "${state.userInfo?.image}",
                    imageError: AppImages.patientImg,
                    width: 150,
                    height: 150,
                    fit: BoxFit.fill,
                  );
                }
              },
            ),
          ),
        ),
        Positioned(
            bottom: 0,
            right: 10,
            child: GestureDetector(
              onTap: () => context.read<EditUserAccCubit>().pickImage(),
              child: Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.primaryColor),
                padding: const EdgeInsets.all(5.0),
                child: AppConstants.customAssetSvg(
                  imagePath: "assets/icons/pick_image_icon.svg",
                ),
              ),
            )),
      ],
    );
  }
}
