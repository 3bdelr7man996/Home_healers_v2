import 'dart:developer';
import 'dart:io';

import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_view/photo_view.dart';

import 'package:path/path.dart';

class PhotoViewerRouteWrapper extends StatefulWidget {
  const PhotoViewerRouteWrapper({
    super.key,
    this.loadingBuilder,
    required this.filePath,
    this.typeOfFile,
    this.backgroundDecoration,
    this.minScale,
    this.maxScale,
    this.initialScale,
    this.basePosition = Alignment.center,
    this.filterQuality = FilterQuality.none,
    this.disableGestures,
    this.errorBuilder,
    this.imgBaseUrl = 'http://admin.home-healers.com/upload/',
  });
  final String imgBaseUrl;
  final LoadingBuilder? loadingBuilder;
  final BoxDecoration? backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final dynamic initialScale;
  final String? filePath;
  final String? typeOfFile;
  final Alignment basePosition;
  final FilterQuality filterQuality;
  final bool? disableGestures;
  final ImageErrorWidgetBuilder? errorBuilder;

  @override
  State<PhotoViewerRouteWrapper> createState() =>
      _PhotoViewerRouteWrapperState();
}

class _PhotoViewerRouteWrapperState extends State<PhotoViewerRouteWrapper> {
  get http => null;
  late File Pfile;

  @override
  void initState() {
    log("file path ${widget.filePath}");
    if (widget.filePath!.endsWith("pdf")) {
      log("load network ---------");
      loadNetwork();
    }

    super.initState();
  }

  Future<void> loadNetwork() async {
    var url = '${widget.imgBaseUrl} ${widget.filePath}';
    print(url);
    final response = await http.get(Uri.parse(url));
    print(url);

    final bytes = response.bodyBytes;
    final filename = basename(url);
    final dir = await getApplicationDocumentsDirectory();
    var file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);
    setState(() {
      Pfile = file;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        constraints: BoxConstraints.expand(
          height: context.height,
        ),
        child: widget.typeOfFile == "pdf"
            ? Container(
                child: Center(
                  child: PDFView(
                    filePath: '${widget.imgBaseUrl}${widget.filePath}',
                  ),
                ),
              )
            : PhotoView(
                imageProvider: NetworkImage(
                  '${widget.imgBaseUrl}${widget.filePath}',
                ),
                backgroundDecoration: widget.backgroundDecoration,
                // const BoxDecoration(
                //   color: Colors.white, // Set the background color to white
                // ),
                loadingBuilder: widget.loadingBuilder ??
                    (context, event) {
                      if (event == null) {
                        return const Center(
                          child: Text("Loading"),
                        );
                      }
                      final value = event.cumulativeBytesLoaded /
                          (event.expectedTotalBytes ??
                              event.cumulativeBytesLoaded);

                      final percentage = (100 * value).floor();
                      return Center(
                        child: Text("$percentage%"),
                      );
                    },
                //backgroundDecoration: backgroundDecoration,
                minScale: widget.minScale,
                maxScale: widget.maxScale,
                initialScale: widget.initialScale,
                basePosition: widget.basePosition,
                filterQuality: widget.filterQuality,
                disableGestures: widget.disableGestures,
                errorBuilder: widget.errorBuilder,
              ),
      ),
    );
  }
}
