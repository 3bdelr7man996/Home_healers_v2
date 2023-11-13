import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:dr/doctor/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileImg extends StatelessWidget {
  const ProfileImg({super.key});

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
            child: BlocBuilder<AuthCubit, AuthState>(
              buildWhen: (previous, current) =>
                  previous.imgProfile != current.imgProfile ||
                  previous.advertiser != current.advertiser,
              builder: (context, state) {
                if (state.imgProfile != null &&
                    state.imgProfile!.path.isNotEmpty) {
                  return AppConstants.customFileImage(
                      file: state.imgProfile!,
                      fit: BoxFit.fill,
                      width: 150,
                      height: 150);
                } else {
                  return AppConstants.customNetworkImage(
                    imagePath: "${state.advertiser?.image}",
                    imageError: AppImages.avatar,
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
              onTap: () => context.read<AuthCubit>().pickImage(),
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
