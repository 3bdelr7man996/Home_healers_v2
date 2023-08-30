import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:flutter/cupertino.dart';

/// Creates insets where all the offsets are value.
EdgeInsetsGeometry allPading({required double value}) {
  return EdgeInsets.all(value);
}

///Creates insets with symmetrical vertical and horizontal offsets.
EdgeInsetsGeometry symmetricPadding(
    {double vertical = 0, double horizontal = 0}) {
  return EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);
}

/// vertical space with 0.03 height ratio
Widget verticalSmallPadding(BuildContext context) {
  return SizedBox(
    height: context.height * 0.03,
  );
}

/// vertical space with 0.06 height ratio
Widget verticalMediumPadding(BuildContext context) {
  return SizedBox(
    height: context.height * 0.06,
  );
}

/// vertical space with 0.1 height ratio
Widget verticalBigPadding(BuildContext context) {
  return SizedBox(
    height: context.height * 0.1,
  );
}

/// vertical space with custom height sizeRatio e.g 0.03
Widget verticalCustomPadding(BuildContext context,
    {required double sizeRatio}) {
  return SizedBox(
    height: context.height * sizeRatio,
  );
}

///horizontal space with custom width sizeRatio e.g 0.3
Widget horizontalCustomPadding(BuildContext context,
    {required double sizeRatio}) {
  return SizedBox(
    height: context.width * sizeRatio,
  );
}
