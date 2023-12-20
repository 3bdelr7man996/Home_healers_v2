import 'dart:async';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:uni_links/uni_links.dart';
import 'package:flutter/material.dart';
import 'package:uri/uri.dart';
import 'package:url_launcher/url_launcher.dart';

class DeepLinkHandler {
  final StreamController<String> _deepLinkController =
      StreamController<String>();

  Stream<String> get deepLinkStream => _deepLinkController.stream;

  void init(BuildContext context) {
    log("Init Deep link class");
    initUniLinks(context);
  }

  Future<void> initUniLinks(BuildContext context) async {
    try {
      Uri? initialLink = await getInitialUri();
      _handleLink(context, initialLink);

      uriLinkStream.listen((Uri? link) {
        _handleLink(context, link);
      }, onError: (dynamic error) {
        print('Error receiving link: $error');
      });
    } on PlatformException {
      print('Error initializing uni_links');
    } on FormatException catch (err) {
      print('malformed initial uri $err');
    }
  }

  void _handleLink(BuildContext context, Uri? link) {
    log("link--------------$link");
    if (link != null) {
      if (link.host == 'receipt' && link.queryParameters['id'] != null) {
        //todo call receipt api of order id =link.queryParameters['id']
        //todo navigate to receipt screen
        //? Cut the next part and paste it where you need to generate a link

        // DeepLinkHandler.generateDeepLink(page: "receipt", parameters: {
        //             'id': "23",
        //           });
      }
      _deepLinkController.add(link.toString());
    }
  }

  void dispose() {
    _deepLinkController.close();
  }

  static Future<String> generateDeepLink({
    required String page,
    Map<String, Object?>? parameters,
  }) async {
    final uri =
        UriTemplate('homehealerr://$page{?id*}').expand(parameters ?? {});
    log("Generated Link is ${uri.toString()}");

    return uri.toString();
  }
}
