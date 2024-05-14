import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:dr/doctor/features/chats/presentation/cubit/chat_cubit/chats_cubit.dart';
import 'package:dr/doctor/features/home/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

PreferredSizeWidget AppBarForChat(BuildContext context,
    {bool fromPatient = false}) {
  return AppBar(
    centerTitle: true,
    leading: Container(
      margin: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromARGB(255, 199, 244, 253),
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: const Icon(
          Icons.arrow_back,
          color: AppColors.primaryColor,
        ),
        onPressed: () {
          fromPatient
              ? Navigator.pop(context)
              : AppConstants.customNavigation(
                  context, HomeScreen(selectedIndex: 1), 0, -1);
        },
      ),
    ),
    // actions: [
    //   AppConstants.customAssetSvg(
    //     imagePath: AppImages.chatCall,
    //     width: 35,
    //     height: 35,
    //   ),
    //   10.pw,
    //   AppConstants.customAssetSvg(
    //     imagePath: AppImages.chatCall,
    //     width: 35,
    //     height: 35,
    //   ),
    // ],

    backgroundColor: AppColors.backGroundColor,
    shadowColor: Colors.grey.withOpacity(0.5),
    elevation: 8,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //profile avatar
        Container(
          width: 40,
          height: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
            child: AppConstants.customNetworkImage(
              imagePath:
                  "${context.select<ChatsCubit, String>((cubit) => cubit.recieverImg ?? '')}",
              imageError: AppImages.patientImg,
            ),
          ),
        ),
        10.pw,
        //title
        Text(
          context
              .select<ChatsCubit, String>((cubit) => cubit.recieverName ?? ''),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: Colors.black,
          ),
        ),
      ],
    ),
  );
}
