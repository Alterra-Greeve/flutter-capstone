import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view_model/transaction_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TransactionController controller = Get.put(TransactionController());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 64,
        title: Text(
          'Pembayaran',
          style: TextStylesConstant.nunitoButtonSemibold,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: SvgPicture.asset(IconsConstant.arrow),
        ),
      ),
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            WebView(
              initialUrl: controller.snapUrl.value,
              onPageStarted: (url) {
                controller.updateLoadingPercentage(0);
              },
              onProgress: (progress) {
                controller.updateLoadingPercentage(progress);
              },
              onPageFinished: (url) {
                controller.updateLoadingPercentage(100);
              },
              navigationDelegate: (navigation) {
                final host = Uri.parse(navigation.url).toString();
                if (host.contains('gojek://') ||
                    host.contains('shopeeid://') ||
                    host.contains('//wsa.wallet.airpay.co.id/') ||
                    host.contains('/gopay/partner/') ||
                    host.contains('/shopeepay/') ||
                    host.contains('/pdf')) {
                  controller.launchInExternalBrowser(Uri.parse(navigation.url));
                  return NavigationDecision.prevent;
                } else {
                  return NavigationDecision.navigate;
                }
              },
              javascriptMode: JavascriptMode.unrestricted,
            ),
            Obx(
              () => controller.loadingPercentage < 100
                  ? LinearProgressIndicator(
                      color: ColorsConstant.primary500,
                      value: controller.loadingPercentage / 100.0,
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
