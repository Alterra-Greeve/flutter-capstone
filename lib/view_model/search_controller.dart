import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:greeve/models/api_responses/products_response_model.dart';
import 'package:greeve/routes/app_routes.dart';
import 'package:greeve/services/api/api_service.dart';
import 'package:greeve/services/shared_pref/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchProductController extends GetxController {
  var isTextFieldFocused = false.obs;
  var historySearch = <String>[].obs;
  final ApiService _apiService = ApiService();
  Rx<bool> isLoadingProduct = Rx<bool>(false);
  Rx<String?> errorMessage = Rx<String?>(null);
  RxList<Datum> productsData = <Datum>[].obs;
  Rx<int?> statusCode = Rx<int?>(null);

  @override
  void onInit() {
    super.onInit();
    initHistory();
  }

  void setFocus(bool isFocused) {
    isTextFieldFocused.value = isFocused;
  }

  void saveSearchHistory(String valueSearch) async {
    final prefs = await SharedPreferences.getInstance();

    if (valueSearch.isEmpty) {
      return;
    }

    final historySearchList = await getHistory() ?? <String>[];
    historySearchList.add(valueSearch);

    await prefs.setStringList('search', historySearchList);

    historySearch.value = historySearchList;
    if (kDebugMode) {
      print('Saving search history: $historySearchList');
    }
  }

  Future<List<String>?> getHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final listDataHistory = prefs.getStringList('search');
    return listDataHistory;
  }

  void initHistory() async {
    historySearch.value = await getHistory() ?? <String>[];
  }

  void deleteAllHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('search');
    historySearch.clear();
    if (kDebugMode) {
      print('All search history deleted');
    }
  }

  void deleteHistoryItem(String item) async {
    final prefs = await SharedPreferences.getInstance();
    final historySearchList = await getHistory() ?? <String>[];
    historySearchList.remove(item);
    await prefs.setStringList('search', historySearchList);
    historySearch.value = historySearchList;
    if (kDebugMode) {
      print('Deleted search history item: $item');
    }
  }

  void getProductsbyName(String name) async {
    final String? token = await SharedPreferencesManager.getToken();
    productsData.value = [];
    isLoadingProduct.value = true;

    try {
      final result = await _apiService.getProductsbyName(token, name);
      productsData.value = result.data!;
      errorMessage.value = '';
      if (kDebugMode) {
        print('Fetched products: ${result.data}');
      }
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoadingProduct.value = false;
    }
  }

  void navigateToProductDetail(String productId) {
    Get.toNamed(
      AppRoutes.detailProduct,
      arguments: productId,
    );
  }
}
