// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:dr/Patient/features/setting/presentation/pages/reports_screen.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class ReportsForMe extends StatefulWidget {
  List<File> pdfFiles;
  ReportsForMe({super.key, required this.pdfFiles});

  @override
  State<ReportsForMe> createState() => _ReportsForMeState();
}

class _ReportsForMeState extends State<ReportsForMe> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 30,
        ),
        itemCount: widget.pdfFiles.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.only(bottom: 10.0),
            color: Colors.white,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(AppColors.primaryColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PDFViewer(
                      filePath: widget.pdfFiles[index].path,
                    ),
                  ),
                );
              },
              child: Container(
                width: context.width,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                margin: EdgeInsets.all(10),
                child: PDFView(
                  enableSwipe: false,
                  defaultPage: 0,
                  filePath: widget.pdfFiles[index].path,
                  onRender: (pages) {
                    setState(() {});
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class specialist_reports extends StatefulWidget {
  List<File> pdfFiles;
  specialist_reports({super.key, required this.pdfFiles});

  @override
  State<specialist_reports> createState() => _specialist_reportsState();
}

class _specialist_reportsState extends State<specialist_reports> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 30,
        ),
        itemCount: widget.pdfFiles.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.only(bottom: 10.0),
            color: Colors.white,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(AppColors.primaryColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PDFViewer(
                      filePath: widget.pdfFiles[index].path,
                    ),
                  ),
                );
              },
              child: Container(
                width: context.width,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                margin: EdgeInsets.all(10),
                child: PDFView(
                  enableSwipe: false,
                  defaultPage: 0,
                  filePath: widget.pdfFiles[index].path,
                  onRender: (pages) {
                    setState(() {});
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
