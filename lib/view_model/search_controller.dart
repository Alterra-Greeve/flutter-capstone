import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchProductController extends GetxController {
  var isTextFieldFocused = false.obs;
  var historySearch = <String>[].obs;

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
}
