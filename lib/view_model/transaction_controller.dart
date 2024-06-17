import 'package:get/get.dart';
import 'package:greeve/models/api_responses/get_transaction_response_model.dart';
import 'package:url_launcher/url_launcher.dart';

class TransactionController extends GetxController {
  final Rx<String> snapUrl = Rx<String>('');
  var loadingPercentage = 0.obs;
  Rx<GetTransactionResponseModel> getTransactionData =
      GetTransactionResponseModel().obs;
  Rx<bool> isLoading = Rx<bool>(false);
  Rx<String?> errorMessage = Rx<String?>(null);

  @override
  void onInit() {
    updateSnapUrl();
    super.onInit();
  }

  void updateSnapUrl() {
    snapUrl.value = Get.arguments;
  }

  void updateLoadingPercentage(int percentage) {
    loadingPercentage.value = percentage;
  }

  Future<void> launchInExternalBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }
}
