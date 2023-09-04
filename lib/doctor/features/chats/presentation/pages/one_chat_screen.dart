import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/doctor/features/chats/presentation/widgets/one_chat_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OneChatScreen extends StatelessWidget {
  const OneChatScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarForChat(context, title: "سيف أحمد"),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: 30, // Replace with your actual message count
              itemBuilder: (BuildContext context, int index) {
                if (index % 2 == 0) {
                  return SenderMeesage();
                } else {
                  return ReciveMessage();
                }
              },
            ),
          ),
          Container(
            color: const Color.fromARGB(14, 55, 209, 244),
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/mike_icon.svg',
                  width: 35,
                  height: 35,
                ),
                5.pw,
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'اكتب رسالة …',
                    ),
                  ),
                ),
                5.pw,
                // IconButton( // icon: Icon(Icons.send), // onPressed: () { // }, // ),
                SvgPicture.asset(
                  'assets/icons/add_icon.svg',
                  width: 35,
                  height: 35,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
