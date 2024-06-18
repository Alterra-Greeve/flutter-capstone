import 'package:get/get.dart';
import 'package:greeve/models/api_responses/get_transaction_response_model.dart';
import 'package:greeve/routes/app_routes.dart';
import 'package:greeve/services/api/api_transaction_service.dart';
import 'package:greeve/services/shared_pref/shared_pref.dart';

class ListTransactionController extends GetxController {
  final ApiTransactionService _apiService = ApiTransactionService();
  Rx<GetTransactionResponseModel> getTransactionData =
      GetTransactionResponseModel().obs;
  Rx<bool> isLoading = Rx<bool>(false);
  Rx<String?> errorMessage = Rx<String?>(null);
  RxList<Datum> successTransactionList = <Datum>[].obs;
  RxList<Datum> pendingTransactionList = <Datum>[].obs;
  RxList<Datum> failedTransactionList = <Datum>[].obs;

  @override
  void onInit() {
    getTransaction();
    super.onInit();
  }

  void getTransaction() async {
    try {
      final String? token = await SharedPreferencesManager.getToken();
      isLoading.value = true;
      getTransactionData.value = GetTransactionResponseModel();
      final result = await _apiService.getTransaction(token);
      getTransactionData.value = result;
      errorMessage.value = '';
      successTransactionList.value = result.data!
          .where((element) => element.status == 'Berhasil')
          .toList();
      pendingTransactionList.value =
          result.data!.where((element) => element.status == 'Pending').toList();
      failedTransactionList.value =
          result.data!.where((element) => element.status == 'Gagal').toList();
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void navigateToTransaction(String? snapUrl) {
    Get.offNamed(
      AppRoutes.transaction,
      arguments: snapUrl,
    );
  }
}
