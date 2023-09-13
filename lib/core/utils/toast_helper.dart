import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

class ShowToastHelper {
  static void showToast({
    Color backgroundColor = const Color.fromARGB(66, 26, 26, 26),
    required String msg,
    required bool isError,
  }) {
    BotToast.showText(
        text: msg,
        contentColor: isError ? const Color(0xffFF2666) : backgroundColor);
  }
}
