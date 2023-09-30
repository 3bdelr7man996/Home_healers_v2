import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:number_to_character/number_to_character.dart';

String convertIntToText(BuildContext context, int number) {
  var converter = NumberToCharacterConverter(context.locale.languageCode);
  return converter.convertInt(number);
}
