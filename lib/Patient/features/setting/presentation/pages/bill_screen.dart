
import 'package:dr/Patient/features/setting/presentation/widgets/bill_widgets.dart';
import 'package:dr/Patient/features/setting/presentation/widgets/requests_details_widgets.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/doctor/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class BillScreen extends StatefulWidget {
  var oneOrder;
  BillScreen({super.key, this.oneOrder});

  @override
  State<BillScreen> createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {
  @override
  Widget build(BuildContext context) {
    // String randomString() {
    //   const chars =
    //       'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    //   return String.fromCharCodes(List.generate(
    //       10, (index) => chars.codeUnitAt(Random().nextInt(chars.length))));
    // }

    final GlobalKey<State<StatefulWidget>> _printKey = GlobalKey();

    void _printScreen() {
      Printing.layoutPdf(onLayout: (PdfPageFormat format) async {
        final doc = pw.Document();

        final image = await WidgetWraper.fromKey(
          key: _printKey,
          pixelRatio: 2.0,
        );

        doc.addPage(pw.Page(
            pageFormat: format,
            build: (pw.Context context) {
              return pw.Center(
                child: pw.Expanded(
                  child: pw.Image(image),
                ),
              );
            }));

        return doc.save();
      });
    }

    return Scaffold(
      appBar: customAppBar(context, title: "الفاتورة", backButton: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Column(
            children: [
              RepaintBoundary(
                key: _printKey,
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
                      data: '12345',
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
                  primary: AppColors.primaryColor,
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
