import 'package:get/get.dart';

class SearchProductController extends GetxController {
  var isTextFieldFocused = false.obs;

  void setFocus(bool isFocused) {
    isTextFieldFocused.value = isFocused;
  }
}
