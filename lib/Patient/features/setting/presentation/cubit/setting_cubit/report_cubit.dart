import 'package:dr/Patient/features/setting/data/models/reports_model.dart';
import 'package:dr/Patient/features/setting/data/repositories/reports_repo.dart';
import 'package:dr/Patient/features/setting/presentation/cubit/setting_state/report_state.dart';
import 'package:dr/core/utils/toast_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportsCubit extends Cubit<ReportsState> {
  final ReportsRepo repositry;

  ReportsCubit({required this.repositry}) : super(ReportsState());

  Future<void> GetReports() async {
    try {
      Map<String, dynamic> body = {};

      ReportsModel response = await repositry.getReports(body: body);
      emit(state.copyWith(
          reportsForDoctors: response.success.doctorReports,
          reportsForPatient: response.success.reports));
    } catch (e) {
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }
}
