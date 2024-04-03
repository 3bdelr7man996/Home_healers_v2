import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/doctor/features/chats/presentation/cubit/audio_cubit/audio_cubit.dart';
import 'package:dr/doctor/features/chats/presentation/cubit/chat_cubit/chats_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliderView extends StatelessWidget {
  const SliderView({super.key, required this.fromMe, required this.path});
  final String path;
  final bool fromMe;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: fromMe ? TextDirection.rtl : TextDirection.ltr,
      child: Container(
        padding: EdgeInsets.all(10.0),
        margin:
            fromMe ? EdgeInsets.only(left: 30.0) : EdgeInsets.only(right: 30.0),
        decoration: BoxDecoration(
          // color: Color.fromARGB(77, 255, 255, 255),
          borderRadius: BorderRadius.circular(15.0),
          gradient: LinearGradient(
            colors: fromMe
                ? [
                    AppColors.darkPrimaryColor,
                    Color.fromARGB(255, 190, 99, 223),
                  ]
                : [
                    Color.fromARGB(255, 217, 230, 255),
                    Color.fromARGB(255, 132, 169, 232),
                  ],
            tileMode: TileMode.repeated,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          children: [
            PlayButtonView(
              onTap: () {
                context
                    .read<ChatsCubit>()
                    .onChangePlayedName(path.split('/').last);
                context.read<AudioCubit>().loadAudio(path);

                // context.read<ChatsCubit>().initLoadAudio(path);
              },
            ),
            Expanded(
              child: Slider(
                value: 0,
                min: 0,
                max: 0,
                onChanged: (value) {},
                activeColor: AppColors.primaryColor,
              ),
            ),
            // Text(
            //   "00:00",
            //   style: TextStyle(
            //     fontSize: 14,
            //     color: Colors.white,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class PlayButtonView extends StatelessWidget {
  const PlayButtonView({super.key, required this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      color: AppColors.primaryColor,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 54,
          height: 54,
          padding: EdgeInsets.only(
            left: 4,
          ),
          child: Icon(
            Icons.play_arrow,
            color: Colors.white,
            size: 35,
          ),
        ),
      ),
    );
  }
}
