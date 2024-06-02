// ignore_for_file: must_be_immutable

import 'package:dr/Patient/features/setting/presentation/cubit/setting_cubit/evaluation_cubit.dart';
import 'package:dr/Patient/features/setting/presentation/cubit/setting_state/evaluation_state.dart';
import 'package:dr/Patient/features/setting/presentation/widgets/request_details_widgets/five_star_widget.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class BottomSheetForEvalute extends StatelessWidget {
  var oneOrder;
  BottomSheetForEvalute({super.key, this.oneOrder});

  @override
  Widget build(BuildContext context) {
    void _onSendCommentPressed() {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: SvgPicture.asset("assets/icons/correct_icon.svg"),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("تم إرسال تعليقك"),
            ],
          ),
        ),
      );
    }

    return SizedBox(
        height: 380,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: Column(
            children: [
              const Text(
                "اكتب تعليقك",
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              15.ph,
              FiveStarRating(
                rating: 0,
                onRatingChanged: (rating) async {
                  await context.read<evaluationCubit>().onRateChange(rating);
                },
              ),
              15.ph,
              TextFormField(
                maxLines: 5,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(16),
                  hintText: "اكتب تعليقك ...",
                ),
              ),
              15.ph,
              BlocBuilder<evaluationCubit, evaluationsState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      context.read<evaluationCubit>().sendEvaluation(
                          context,
                          oneOrder.advertiserId,
                          oneOrder.userId,
                          _onSendCommentPressed);
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          AppColors.primaryColor),
                      minimumSize: MaterialStateProperty.all<Size>(
                        const Size(double.infinity, 50),
                      ),
                    ),
                    child: const Text(
                      'إرسال التعليق',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ));
  }
}
