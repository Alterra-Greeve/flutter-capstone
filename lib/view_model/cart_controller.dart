import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:greeve/services/api/api_cart_service.dart';
import 'package:greeve/services/shared_pref/shared_pref.dart';
import 'package:greeve/models/api_responses/cart_response_model.dart';

class CartController extends GetxController {
  final ApiCartService _apiCartService = ApiCartService();
  Rx<bool> isCoinApplied = false.obs;
  RxList<Item> cartData = <Item>[].obs;
  Rx<bool> isLoadingCart = Rx<bool>(false);
  Rx<String?> errorMessage = Rx<String?>(null);
  Rx<String> qtyErrorText = Rx<String>("");
  Rx<bool> isFormValid = Rx<bool>(false);
  Rx<int> newQty = Rx<int>(0);
  Rx<double> totalPrice = Rx<double>(0.0);

  final debouncer = Debouncer(delay: const Duration(milliseconds: 200));
  final TextEditingController _qtyController = TextEditingController();
  final FocusNode _qtyFocusNode = FocusNode();
  TextEditingController get qtyController => _qtyController;
  FocusNode get qtyFocusNode => _qtyFocusNode;

  @override
  void onInit() {
    getCart();
    _qtyFocusNode.addListener(() => update());
    _qtyController.addListener(validateForm);
    super.onInit();
  }

  void getCart() async {
    try {
      final String? token = await SharedPreferencesManager.getToken();
      cartData.value = [];
      isLoadingCart.value = true;
      final result = await _apiCartService.getCart(token);
      cartData.value = result.data.items;
      errorMessage.value = '';
      updateTotalPrice();
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoadingCart.value = false;
    }
  }

  void incrementQuantity(Item item) async {
    debouncer(() async {
      final token = await SharedPreferencesManager.getToken();
      if (item.quantity < 20) {
        try {
          await _apiCartService.updateCart(
            item.product.productId,
            item.quantity + 1,
            token,
            type: 'increment',
          );
          item.quantity += 1;
          cartData.refresh();
          updateTotalPrice();
        } catch (e) {
          Get.snackbar(
            'Error',
            e.toString(),
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.all(16),
          );
        }
      }
    });
  }

  void decrementQuantity(Item item) async {
    debouncer(() async {
      final token = await SharedPreferencesManager.getToken();
      if (item.quantity > 1) {
        try {
          await _apiCartService.updateCart(
            item.product.productId,
            item.quantity - 1,
            token,
            type: 'decrement',
          );
          item.quantity -= 1;
          cartData.refresh();
          updateTotalPrice();
        } catch (e) {
          Get.snackbar(
            'Error',
            e.toString(),
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.all(16),
          );
        }
      }
    });
  }

  void setQuantity(Item item, int newQty) async {
    final token = await SharedPreferencesManager.getToken();
    try {
      await _apiCartService.updateCart(
        item.product.productId,
        newQty,
        token,
      );
      item.quantity = newQty;
      cartData.refresh();
      updateTotalPrice();
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
      );
    }
  }

  void validateQty(String value) {
    int qty = int.tryParse(value) ?? 0;
    if (qty == 0) {
      qtyErrorText.value = 'Jumlah produk tidak boleh 0!';
    } else if (qty > 20) {
      qtyErrorText.value = 'Jumlah produk tidak boleh lebih dari 20!';
    } else {
      qtyErrorText.value = "";
    }
    validateForm();
  }

  void validateForm() {
    if (_qtyController.text == '') {
      isFormValid.value = false;
    } else {
      isFormValid.value = true;
    }
  }

  void deleteItem(Item item) async {
    final token = await SharedPreferencesManager.getToken();
    await _apiCartService.deleteCart(item.product.productId, token);
    getCart();
  }

  void toggleCoinSwitch() {
    isCoinApplied.value = !isCoinApplied.value;
    updateTotalPrice();
  }

  void updateTotalPrice() {
    double total = 0.0;
    for (var item in cartData) {
      total += item.product.price * item.quantity;
    }
    if (isCoinApplied.value) {
      total -= 5;
    }
    totalPrice.value = total;
  }
}
