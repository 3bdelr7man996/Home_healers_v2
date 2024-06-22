import 'dart:async';
import 'dart:developer';

import 'package:dr/Patient/features/setting/presentation/cubit/setting_cubit/my_order_cubit.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uni_links/uni_links.dart';
import 'package:flutter/material.dart';
import 'package:uri/uri.dart';

class DeepLinkHandler {
  final StreamController<String> _deepLinkController =
      StreamController<String>();

  Stream<String> get deepLinkStream => _deepLinkController.stream;

  void init(BuildContext context) {
    log("Init Deep link class");
    initUniLinks(context);
  }

  Future<void> initUniLinks(BuildContext context) async {
    try  {
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

  void _handleLink(BuildContext context, Uri? link) async {
    log("link--------------$link");

    if (link != null) {
      if (link.host == 'receipt' && link.queryParameters['id'] != null) {
        context
            .read<MyOrdersCubit>()
            .ShowBillScreen(context, link.queryParameters['id']);
      }
      _deepLinkController.add(link.toString());
    }
  }

  void dispose() {
    _deepLinkController.close();
  }

  static String generateDeepLink({
    required String page,
    Map<String, Object?>? parameters,
  }) {
    final uri =
        UriTemplate('homehealerr://$page{?id*}').expand(parameters ?? {});
    log("Generated Link is ${uri.toString()}");

    return uri.toString();
  }
}
