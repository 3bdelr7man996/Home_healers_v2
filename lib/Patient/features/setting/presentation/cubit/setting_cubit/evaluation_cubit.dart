// ignore_for_file: unused_local_variable

import 'package:dr/Patient/features/setting/data/models/evaluations_model.dart';
import 'package:dr/Patient/features/setting/data/repositories/evaluation_repo.dart';
import 'package:dr/Patient/features/setting/presentation/cubit/setting_state/evaluation_state.dart';
import 'package:dr/core/utils/toast_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class evaluationCubit extends Cubit<evaluationsState> {
  final evaluationsRepo eevaluationsRepo;

  evaluationCubit({required this.eevaluationsRepo}) : super(evaluationsState());

  //?==================== formFields change ====================

  onRateChange(var value) => emit(state.copyWith(rate: value));
  onshowEvaluationPopUpChange() =>
      emit(state.copyWith(showEvaluationPopUp: state.showEvaluationPopUp + 1));

  Future<void> sendEvaluation(BuildContext context, var advertiser_id,
      var user_id, Function _onSendCommentPressed) async {
    try {
      Map<String, dynamic> body = {
        "advertiser_id": "${advertiser_id}",
        "user_id": "${user_id}",
        "rate": "${state.rate}",
      };

      evaluationsModel response =
          await eevaluationsRepo.sendEvaluation(body: body);
      emit(state.copyWith(showEvaluationPopUp: state.showEvaluationPopUp + 1));
      _onSendCommentPressed();
      Future.delayed(Duration(milliseconds: 700), () {
        Navigator.pop(context);
        Navigator.pop(context);
      });
    } catch (e) {
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }

  ///validate on fields
  void fieldsValidation() {
    if (state.rate == null) {
      throw ("قم بتقييم الجلسة");
    }
  }
}
