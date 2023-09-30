import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:dr/core/utils/http_helper.dart';
import 'package:dr/core/utils/toast_helper.dart';
import 'package:dr/doctor/features/diagnose_report/data/models/diagonse_form_model.dart';
import 'package:dr/doctor/features/home/data/models/reservation_details_model.dart';
import 'package:dr/doctor/features/diagnose_report/data/repositories/diagnose_report_repo.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

//  import 'package:pdf/widgets/image.dart' as pwImage;

part 'diagnose_form_state.dart';

class DiagnoseFormCubit extends Cubit<DiagnoseFormState> {
  DiagnoseFormCubit({required this.repository})
      : super(const DiagnoseFormState());
  final DiagnoseReportRepo repository;

  void initData() {
    emit(state.copyWith(
      diagnoseValues: {},
      treatments: <String?>[].toList(),
    ));
  }

  void nameChanged(String key, String value) {
    final values = state.diagnoseValues ?? {};
    values[key] = value;
    print(values);
    emit(state.copyWith(diagnoseValues: values));
  }

  void treatmentChanged(int index, String value) {
    log("treatement changed index $index value $value");
    final List<String?>? treatments = state.treatments;
    //List.from(state.treatments);
    treatments?[index] = value;
    emit(state.copyWith(treatments: treatments));
  }

  void addTreatmentChanged() {
    log("addTreatmentChanged");
    final List<String?> treatments =
        List.from(state.treatments?.toList() ?? []);
    treatments.add(null);
    emit(state.copyWith(treatments: treatments));
  }

  Future<void> submitFormReport() async {
    // print('${state.treatments}');
    // print('${state.diagnoseValues}');
    if (state.status == RequestState.loading) return;
// reservation_id
    try {
      final data = state.diagnoseValues ?? {};
      for (var ix = 0; ix < state.treatments!.length; ix++) {
        data.addAll({'treatment[$ix]': state.treatments![ix]!});
      }
      data.addAll({'reservation_id': '${state.reservation?.id}'});
      await repository.submitFormReport(body: data);
      ShowToastHelper.showToast(msg: "upload success", isError: false);
      emit(state.copyWith(status: RequestState.success));
    } catch (e) {
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
      emit(state.copyWith(status: RequestState.failed));
    }
  }

  Future<void> getDiagnoseForm(ReservationData reservation) async {
    if (state.listDiagnoseSection == null ||
        state.listDiagnoseSection!.isEmpty) {
      if (state.status == RequestState.loading) return;
      emit(state.copyWith(status: RequestState.loading));
      try {
        final Map<String, dynamic>? diagnoseForm =
            await repository.getDiagnoseSections();
        print(diagnoseForm);
        emit(state.copyWith(
            status: RequestState.success,
            reservation: reservation,
            listDiagnoseSection: diagnoseForm));
      } catch (e) {
        emit(state.copyWith(status: RequestState.failed));
        ShowToastHelper.showToast(msg: e.toString(), isError: true);
      }
    } else {
      emit(state.copyWith(
        reservation: reservation,
        status: RequestState.success,
      ));
    }
  }

//?=================[  convert ui to img ]================================
  ///Take Screen shoot to screen
  Future<Uint8List> captureScreen({required GlobalKey globalKey}) async {
    RenderRepaintBoundary boundary =
        globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 2.0);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  Future<void> generateReportFile(BuildContext context,
      {required GlobalKey<State<StatefulWidget>> globalKey}) async {
    try {
      emit(state.copyWith(status: RequestState.loading));

      // final pdf = pw.Document();

      // Capture the screen as an image
      final Uint8List screenImage = await captureScreen(globalKey: globalKey);

      // Add the captured image to the PDF
      // pdf.addPage(
      //   pw.Page(
      //     pageFormat: PdfPageFormat.a4,
      //     build: (context) {
      //       return pw.Expanded(
      //         child: pw.Image(
      //           pw.MemoryImage(screenImage),
      //           //PdfImage.file(pdf.document, bytes: screenImage),
      //           fit: pw.BoxFit.contain,
      //         ),
      //       );
      //     },
      //   ),
      // );

      // Save the PDF to a file
      final output = await getTemporaryDirectory();
      final file = File('${output.path}/${state.reservation?.user?.name}.pdf');
      file.writeAsBytesSync(screenImage);
      //file.writeAsBytes(await pdf.save());

      ///upload report img
      repository.addFileReport(
        body: {
          "reservation_id": "${state.reservation?.id}",
        },
        fileKey: "rep_file",
        files: [file],
      );
      ShowToastHelper.showToast(
          msg: "report_uploaded_successfully".tr(), isError: false);
      initData();
      emit(state.copyWith(status: RequestState.success));
      if (context.mounted) {
        Navigator.pop(context);
      }
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(status: RequestState.failed));
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
    // Open the PDF file or share it as needed
    // You can use the 'open_file' or 'share' package to achieve this.
  }
}
