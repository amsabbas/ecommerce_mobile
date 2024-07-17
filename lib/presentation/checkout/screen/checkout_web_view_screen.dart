import 'package:ecommerce_mobile/data/base/utils/app_logger.dart';
import 'package:ecommerce_mobile/presentation/base/controller/user_controller.dart';
import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/widget/app_topbar_widget_without_cart.dart';
import 'package:ecommerce_mobile/presentation/checkout/screen/checkout_success_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CheckoutWebViewScreen extends StatefulWidget {
  final String transactionUrl;
  final String successRedirectUrl;

  const CheckoutWebViewScreen(
      {super.key,
      required this.transactionUrl,
      required this.successRedirectUrl});

  @override
  State<StatefulWidget> createState() => _CheckoutWebViewScreenState();
}

class _CheckoutWebViewScreenState extends State<CheckoutWebViewScreen> {
  late final WebViewController _webViewController;
  late final UserController _userController;

  @override
  void initState() {
    super.initState();
    _userController = Get.find();
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith(widget.successRedirectUrl)) {
              AppLogger.error(error: request.url);
              _userController.refreshProductQuantity();
              Get.offAll(const CheckoutSuccessScreen());
              return NavigationDecision.navigate;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.transactionUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBarWithoutCartWidget(
        title: MessageKeys.checkoutTitle.tr,
        showBackIcon: true,
      ),
      body: WebViewWidget(controller: _webViewController),
    );
  }
}
