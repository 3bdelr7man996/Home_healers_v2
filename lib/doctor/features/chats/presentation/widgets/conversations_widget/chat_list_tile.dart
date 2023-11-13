import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:dr/doctor/features/chats/presentation/pages/one_chat_screen.dart';
import 'package:dr/features/auth/data/models/user_model.dart';
import 'package:flutter/material.dart';

class ChatListTile extends StatelessWidget {
  const ChatListTile({
    super.key,
    required this.id,
    this.imgPath,
    this.msg,
    this.name,
  });
  final String? name;
  final String? msg;
  final String? imgPath;
  final int id;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppConstants.customNavigation(
            context,
            OneChatScreen(
                fromPatient: false,
                recieverInfo: UserData(id: id, image: imgPath, name: name)),
            0,
            1);
      },
      child: Container(
        width: context.width,
        margin: EdgeInsets.symmetric(vertical: 5.0),
        padding: EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(45, 55, 209, 244),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  Container(
                    width: 60.0,
                    height: 60.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      child: AppConstants.customNetworkImage(
                          imagePath: '${imgPath}',
                          imageError: AppImages.patientImg),
                    ),
                  ),
                  10.pw,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name ?? '',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                      5.ph,
                      Text(
                        msg ?? '',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            // const CircleAvatar(
            //   backgroundColor: AppColors.primaryColor,
            //   radius: 12,
            //   child: Padding(
            //     padding: EdgeInsets.only(top: 3),
            //     child: Center(
            //       child: Text(
            //         "2",
            //         style: TextStyle(color: Colors.white),
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
