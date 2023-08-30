import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

class ShowToastHelper {
  static Future<bool?> showToast({
    Color? backgroundColor = const Color.fromARGB(66, 26, 26, 26),
    required String msg,
    required bool isError,
  }) {
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: isError ? const Color(0xffFF2666) : backgroundColor,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
