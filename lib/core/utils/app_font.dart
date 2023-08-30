import 'package:flutter/material.dart';

///font size 30
TextStyle titleStyle({fontWeight = FontWeight.w800}) {
  return TextStyle(fontSize: 24, fontWeight: fontWeight);
}

///font size 18
TextStyle bigBlackFont({fontWeight = FontWeight.w600}) {
  return TextStyle(fontSize: 18, fontWeight: fontWeight);
}

///font size 16
TextStyle sBigBlackFont() {
  return const TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
}

///font size 14
TextStyle mediumBlackFont() {
  return const TextStyle(fontSize: 14, fontWeight: FontWeight.w400);
}

///font size 12
TextStyle smallBlackFont() {
  return const TextStyle(fontSize: 12);
}

///font size 10
TextStyle sSmallBlackFont() {
  return const TextStyle(fontSize: 10);
}
