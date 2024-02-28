// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:dr/Patient/features/setting/presentation/widgets/bill_widgets.dart';
import 'package:dr/Patient/features/setting/presentation/widgets/requests_details_widgets.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import '../../../../../core/utils/deep_link_util.dart';
import '../../data/models/my_orders_model.dart';
import '../cubit/setting_cubit.dart';

class BillScreen extends StatefulWidget {
  OrderData oneOrder;
  BillScreen({super.key, required this.oneOrder});

  @override
  State<BillScreen> createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {
  GlobalKey _globalKey = new GlobalKey();
  @override
  void initState() {
    super.initState();
    context.read<MyOrdersCubit>().GetInvoiceDetails(widget.oneOrder.id);
  }

  void _printScreen() {
    Printing.layoutPdf(onLayout: (PdfPageFormat format) async {
      final doc = pw.Document();
      var image = await _capturePng();
      if (image != null) {
        final captureImg = pw.MemoryImage(image);
        // final image = await WidgetWraper.fromKey(
        //   key: _printKey,
        //   pixelRatio: 2.0,
        // );

        doc.addPage(pw.Page(
            pageFormat: format,
            build: (pw.Context context) {
              return pw.Center(
                child: pw.Expanded(
                  child: pw.Image(captureImg),
                ),
              );
            }));
      }
      return doc.save();
    });
  }

  Future<Uint8List?> _capturePng() async {
    try {
      RenderRepaintBoundary boundary = _globalKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List? pngBytes = byteData?.buffer.asUint8List();
      return pngBytes;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    // String randomString() {
    //   const chars =
    //       'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    //   return String.fromCharCodes(List.generate(
    //       10, (index) => chars.codeUnitAt(Random().nextInt(chars.length))));
    // }

    print(widget.oneOrder.runtimeType);
    return Scaffold(
      appBar: customAppBar(context, title: "الفاتورة", backButton: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Column(
            children: [
              RepaintBoundary(
                key: _globalKey,
                child: Column(
                  children: [
                    BlueSection(oneOrder: widget.oneOrder),
                    15.ph,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "رقم الطلب : ${widget.oneOrder.id}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.0),
                        )
                      ],
                    ),
                    15.ph,
                    Container(
                      color: Color.fromARGB(130, 190, 189, 189),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Bill(
                          listOfOrders: widget.oneOrder,
                        ),
                      ),
                    ),
                    20.ph,
                    BarcodeWidget(
                      barcode: Barcode.qrCode(
                        errorCorrectLevel: BarcodeQRCorrectionLevel.high,
                      ),
                      data: DeepLinkHandler.generateDeepLink(
                          page: "receipt",
                          parameters: {
                            'id': '${widget.oneOrder.id}',
                          }),
                      width: context.width * 0.7,
                      height: context.height * 0.2,
                    ),
                  ],
                ),
              ),
              10.ph,
              ElevatedButton(
                onPressed: _printScreen,
                child: Text("تحميل الفاتورة أو طباعتها"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
