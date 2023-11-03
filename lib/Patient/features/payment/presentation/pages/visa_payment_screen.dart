import 'dart:developer';

import 'package:dr/Patient/features/payment/presentation/cubit/payment_cubit.dart';
import 'package:dr/Patient/features/setting/data/models/my_orders_model.dart';
import 'package:dr/core/extensions/media_query_extension.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_strings.dart';
import 'package:dr/core/utils/http_helper.dart';
import 'package:dr/shared_widgets/custom_loader.dart';
import 'package:flutter/cupertino.dart' as ios;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class VisaPaymentScreen extends StatefulWidget {
  const VisaPaymentScreen({
    Key? key,
    required this.myOrder,
  }) : super(key: key);
  final OrderData myOrder;
  @override
  State<VisaPaymentScreen> createState() => _VisaPaymentScreenState();
}

class _VisaPaymentScreenState extends State<VisaPaymentScreen> {
  // final Completer<InAppWebViewController> _controller =
  //     Completer<InAppWebViewController>();

  InAppWebViewController? controllerGlobal;

  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
    crossPlatform: InAppWebViewOptions(
        javaScriptEnabled: true,
        useShouldOverrideUrlLoading: true,
        useOnDownloadStart: true,
        allowFileAccessFromFileURLs: true,
        mediaPlaybackRequiresUserGesture: false,
        preferredContentMode: UserPreferredContentMode.RECOMMENDED),
    android: AndroidInAppWebViewOptions(
      useWideViewPort: false,
      initialScale: 0,
      allowFileAccess: true,
      useShouldInterceptRequest: true,
      useHybridComposition: true,
    ),
    ios: IOSInAppWebViewOptions(
      allowsInlineMediaPlayback: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentCubit, PaymentState>(
      builder: (context, state) => WillPopScope(
        onWillPop: () => context.read<PaymentCubit>().exitApp(
              context,
              controllerGlobal: controllerGlobal,
            ),
        child: Scaffold(
          backgroundColor: AppColors.whiteColor,
          body: Stack(
            children: [
              Visibility(
                visible: state.payState == RequestState.loading,
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: context.width,
                    height: context.height,
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: const CustomLoader(
                      padding: 0,
                    ),
                  ),
                ),
              ),
              state.payState != RequestState.loading
                  ? InAppWebView(
                      initialUrlRequest:
                          URLRequest(url: Uri.parse(state.visaUrl!)),
                      initialOptions: options,
                      onWebViewCreated:
                          (InAppWebViewController webViewController) {
                        controllerGlobal = webViewController;
                        // _controller.future.then((value) =>
                        //     controllerGlobal = value);
                        // _controller
                        //     .complete(webViewController);
                      },
                      onReceivedServerTrustAuthRequest:
                          (controller, challenge) async {
                        controller.android.clearSslPreferences();
                        if (kDebugMode) {
                          print(challenge);
                        }
                        return ServerTrustAuthResponse(
                            action: ServerTrustAuthResponseAction.PROCEED);
                      },
                      shouldOverrideUrlLoading:
                          (controller, navigationAction) async {
                        // Intercept the URL request and fetch the URL

                        if (navigationAction.request.url
                            .toString()
                            .contains(AppStrings.visaBaseUrl)) {
                          log("get payment respoooo ${navigationAction.request.url}");
                          await context.read<PaymentCubit>().getVisaResponse(
                                context,
                                path: navigationAction.request.url.toString(),
                                myOrder: widget.myOrder,
                              );
                          return NavigationActionPolicy.CANCEL;
                        }

                        // Proceed with the URL request
                        return NavigationActionPolicy.ALLOW;
                      },
                      onUpdateVisitedHistory:
                          (controller, url, androidIsReload) async {
                        // url.toString().contains(
                        //     paymentProvider.thwateId)
                        // if (url
                        //     .toString()
                        //     .contains(AppConstants.BASE_URL)) {
                        //   await controllerGlobal.goBack();
                        //   await paymentProvider.getPaymentResponse(
                        //       path: url.toString(),
                        //       callBack: callBack);
                        // }
                      },
                      onLoadStart: (controller, url) async {
                        //print(response);
                      },
                      onLoadStop: (controller, url) {
                        if (url
                            .toString()
                            .contains("sandbox.payments.tap.company")) {
                          //paymentProvider.onChangeLoad(true);
                        }
                      },
                    )
                  : const ios.SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
