import 'dart:io';

import 'package:dr/Patient/features/setting/presentation/cubit/setting_cubit.dart';
import 'package:dr/Patient/features/setting/presentation/widgets/reports_widgets.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportScreenForSetting extends StatefulWidget {
  @override
  _ReportScreenForSettingState createState() => _ReportScreenForSettingState();
}

class _ReportScreenForSettingState extends State<ReportScreenForSetting> {
  bool ReportForMe = true;

  @override
  Widget build(BuildContext context) {
    pickAndUploadPDF() async {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'jpg', 'png'],
      );

      if (result != null) {
        print(result);
        // List<String> parts = result.files.single.path!.split('/');
        // String photoName = parts.last;
        // List<String> chars = result.files.single.path!.split('');
        // chars.removeAt(0);
        // String newString = chars.join('');
        // print('${photoName}');
        print('${File(result.files.single.name)}');
        File image = File(result.files.single.path!);
        String name = result.files.single.name;
        await context
            .read<AddReportCubit>()
            .sendReport(context, image, '${name}');
      }
    }

    return Scaffold(
      appBar: customAppBar(context, title: "reports", backButton: true),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      ReportForMe = true;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.only(bottom: 10.0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: ReportForMe
                              ? AppColors.primaryColor
                              : Colors.grey,
                          width: 4.0,
                        ),
                      ),
                    ),
                    child: Text(
                      "التقارير الخاصة بي ",
                      style: TextStyle(
                          color: ReportForMe
                              ? AppColors.primaryColor
                              : Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      ReportForMe = false;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.only(bottom: 10.0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: ReportForMe
                              ? Colors.grey
                              : AppColors.primaryColor,
                          width: 4.0,
                        ),
                      ),
                    ),
                    child: Text(
                      "تقارير الأخصائي",
                      style: TextStyle(
                          color: ReportForMe
                              ? Colors.grey
                              : AppColors.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            20.ph,
            ReportForMe ? ReportsForMe() : specialist_reports(),
            ReportForMe
                ? Container(
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            AppColors.primaryColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      onPressed: pickAndUploadPDF,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.upload_file_rounded),
                          Text('تحميل تقرير'),
                        ],
                      ),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}

// class PDFViewer extends StatefulWidget {
//   final String filePath;

//   const PDFViewer({required this.filePath});

//   @override
//   _PDFViewerState createState() => _PDFViewerState();
// }

// class _PDFViewerState extends State<PDFViewer> {
//   late File Pfile;
//   bool isLoading = false;
//   Future<void> loadNetwork() async {
//     setState(() {
//       isLoading = true;
//     });
//     var url = widget.filePath;
//     final response = await http.get(Uri.parse(url));
//     final bytes = response.bodyBytes;
//     final filename = basename(url);
//     final dir = await getApplicationDocumentsDirectory();
//     var file = File('${dir.path}/$filename');
//     await file.writeAsBytes(bytes, flush: true);
//     setState(() {
//       Pfile = file;
//     });

//     print(Pfile);
//     setState(() {
//       isLoading = false;
//     });
//   }

//   @override
//   void initState() {
//     loadNetwork();

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: customAppBar(context, backButton: true, title: "pdf_viewer"),
//       body: isLoading
//           ? Center(child: CircularProgressIndicator())
//           : Container(
//               child: Center(
//                 child: PDFView(
//                   filePath: Pfile.path,
//                 ),
//               ),
//             ),
//     );
//   }
// }
