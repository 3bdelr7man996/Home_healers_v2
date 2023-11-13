import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:dr/doctor/features/chats/presentation/pages/one_chat_screen.dart';
import 'package:dr/features/auth/data/models/user_model.dart';
import 'package:flutter/material.dart';

class ActiveUsersAvatar extends StatelessWidget {
  const ActiveUsersAvatar({
    super.key,
    required this.imagePath,
    required this.userId,
    required this.userName,
    this.isOnline = false,
  });
  final String? imagePath;
  final int userId;
  final String userName;
  final bool isOnline;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => AppConstants.customNavigation(
          context,
          OneChatScreen(
              fromPatient: false,
              recieverInfo: UserData(
                id: userId,
                image: imagePath,
                name: userName,
              )),
          0,
          1),
      child: SizedBox(
        width: 90,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: const BoxDecoration(),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(40.0)),
                    child: AppConstants.customNetworkImage(
                      imagePath: "${imagePath}",
                      imageError: AppImages.patientImg,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                isOnline
                    ? Positioned(
                        top: 5,
                        right: 10,
                        child: CircleAvatar(
                          backgroundColor: Colors.green,
                          radius: 8,
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
            10.ph,
            Text(
              userName,
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
              style: TextStyle(
                fontSize: 10.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
