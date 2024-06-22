// ignore_for_file: must_be_immutable

import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/shared_widgets/photo_viewer.dart';
import 'package:flutter/material.dart';

class Certificates extends StatefulWidget {
  var Data;
  Certificates({super.key, this.Data});

  @override
  State<Certificates> createState() => _CertificatesState();
}

class _CertificatesState extends State<Certificates> {
  var pdfFiles;
  @override
  void initState() {
    super.initState();

    pdfFiles = widget.Data;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: context.width,
        height: 150,
        child: pdfFiles != null
            ? ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: pdfFiles.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      print(pdfFiles[index]);
                      // AppConstants.customNavigation(
                      //     context, FullScreenImage(pathImage: imageList[index]), -1, 0);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PhotoViewerRouteWrapper(
                              filePath: pdfFiles[index]),
                        ),
                      );
                    },
                    child: Container(
                      width: 100,
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/certificate.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                  // ListTile(
                  //   title: Text(pdfFiles[index]),
                  //   onTap: () {
                  //
                },
              )
            //   },
            // )
            : SizedBox()
        // child: ListView.builder(
        //   scrollDirection: Axis.horizontal,
        //   itemCount: imageList.length,
        //   itemBuilder: (BuildContext context, int index) {
        //     return InkWell(
        //       onTap: () {
        //         AppConstants.customNavigation(
        //             context, FullScreenImage(pathImage: imageList[index]), -1, 0);
        //       },
        //       child: Container(
        //         width: 100,
        //         margin: EdgeInsets.all(8.0),
        //         decoration: BoxDecoration(
        //           image: DecorationImage(
        //             image: AssetImage(imageList[index]),
        //             fit: BoxFit.cover,
        //           ),
        //         ),
        //       ),
        //     );
        //   },
        // ),
        );
  }
}
