// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:dr/Patient/features/setting/data/models/add_report_model.dart';
import 'package:dr/Patient/features/setting/data/repositories/add_report_repo.dart';
import 'package:dr/Patient/features/setting/presentation/cubit/setting_cubit/report_cubit.dart';
import 'package:dr/Patient/features/setting/presentation/cubit/setting_state/add_report_state.dart';
import 'package:dr/core/utils/toast_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddReportCubit extends Cubit<AddReportState> {
  final AddReportRepo repositry;

  AddReportCubit({required this.repositry}) : super(AddReportState());

  Future<void> sendReport(BuildContext context, var image, var title) async {
    List<File> images = [];
    images.add(image);

    try {
      Map<String, String> body = {};

      body['rep_title'] = title;

      AddReportModel response =
          await repositry.sendReport(body: body, Files: images);
      await context.read<ReportsCubit>().GetReports();
      ShowToastHelper.showToast(msg: "تمت العملية بنجاح", isError: false);
    } catch (e) {
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }
}
