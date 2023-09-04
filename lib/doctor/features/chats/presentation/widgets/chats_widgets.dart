import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/doctor/features/chats/presentation/pages/one_chat_screen.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.search),
        hintText: 'ابحث عما تريد هنا',
      ),
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      style: const TextStyle(fontSize: 16.0),
      onChanged: (value) {},
      onFieldSubmitted: (value) {},
    );
  }
}

class CircleForActivePeople extends StatelessWidget {
  const CircleForActivePeople({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Container(
        width: 80,
        height: 80,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage('assets/images/doctor.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: const Stack(
          alignment: Alignment.topRight,
          children: [
            CircleAvatar(
              backgroundColor: Colors.green,
              radius: 14,
            ),
          ],
        ),
      ),
    );
  }
}

class OneChat extends StatelessWidget {
  const OneChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: InkWell(
        onTap: () {
          AppConstants.customNavigation(context, OneChatScreen(), 0, 1);
        },
        child: Container(
          width: context.width,
          height: 100,
          decoration: BoxDecoration(
            color: const Color.fromARGB(45, 55, 209, 244),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/doctor.png'),
                      radius: 40,
                    ),
                    10.pw,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "سيف أحمد",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                        5.ph,
                        Text("Sief@gmail.com")
                      ],
                    )
                  ],
                ),
                const CircleAvatar(
                  backgroundColor: AppColors.primaryColor,
                  radius: 12,
                  child: Padding(
                    padding: EdgeInsets.only(top: 3),
                    child: Center(
                      child: Text(
                        "2",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
