import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/features/auth/presentation/pages/sign_in_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NextButton extends StatelessWidget {
  int rollSelected;
  NextButton({super.key, required this.rollSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.width * 0.03),
      child: Container(
        width: context.width,
        height: context.height * 0.07,
        alignment: Alignment.centerRight,
        child: (ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 500),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, -1),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  );
                },
                pageBuilder: (context, animation, secondaryAnimation) {
                  return rollSelected != 1
                      ? SignInScreen(
                          rollSelected: rollSelected,
                        )
                      : SignInScreen(rollSelected: rollSelected);
                },
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(15),
            backgroundColor: AppColors.primaryColor,
          ),
          child: const Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                Icons.arrow_back,
                size: 30,
                color: Colors.white,
              ),
            ],
          ),
        )),
      ),
    );
  }
}

class CardIdentification extends StatelessWidget {
  const CardIdentification({
    Key? key,
    required String? imagePath,
    required String? title,
    double opacity = 1.0,
    bool patient = false,
  })  : _imagePath = imagePath,
        _title = title,
        _opacity = opacity,
        patient = patient,
        super(key: key);

  final String? _imagePath;
  final String? _title;
  final double _opacity;
  final bool patient;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _opacity,
      child: Container(
        width: context.width * 0.32,
        height: context.height * 0.21,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.primaryColor,
            width: context.width * 0.008,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            patient
                ? Image.asset(
                    _imagePath!,
                    width: 60.0,
                    height: 60.0,
                  )
                : Image.asset(
                    _imagePath!,
                    width: 60.0,
                    height: 60.0,
                  ),
            SizedBox(height: 10),
            Text(
              _title!.tr(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
