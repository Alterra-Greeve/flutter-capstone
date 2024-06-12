import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greeve/services/api/api_cart_service.dart';
import 'package:greeve/services/shared_pref/shared_pref.dart';

import 'package:greeve/models/api_responses/cart_response_model.dart';

class CartController extends GetxController {
  final ApiCartService _apiCartService = ApiCartService();
  Rx<bool> isCoinApplied = false.obs;
  RxList<Item> cartData = <Item>[].obs;
  Rx<bool> isLoadingCart = Rx<bool>(false);
  Rx<String?> errorMessage = Rx<String?>(null);

  @override
  void onInit() {
    getCart();
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
    } catch (e) {
      errorMessage.value = e.toString();
      Get.snackbar(
        'Error',
        errorMessage.value ?? '',
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
      );
    } finally {
      isLoadingCart.value = false;
    }
  }

  void incrementQuantity(Item item) async {
    final token = await SharedPreferencesManager.getToken();
    try {
      await _apiCartService.updateCart(
        item.product.productId,
        'increment',
        item.quantity + 1,
        token,
      );
      item.quantity += 1;
      cartData.refresh();
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
      );
    }
  }

  void decrementQuantity(Item item) async {
    final token = await SharedPreferencesManager.getToken();
    if (item.quantity > 1) {
      try {
        await _apiCartService.updateCart(
          item.product.productId,
          'decrement',
          item.quantity - 1,
          token,
        );
        item.quantity -= 1;
        cartData.refresh();
      } catch (e) {
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(16),
        );
      }
    }
  }

  void deleteItem(Item item) async {
    final token = await SharedPreferencesManager.getToken();
    await _apiCartService.deleteCart(item.product.productId, token);
  }

  void toggleCoinSwitch() {
    isCoinApplied.value = !isCoinApplied.value;
    updateTotalPrice();
  }

  void updateTotalPrice() {
    // double discount = isCoinApplied.value ? 5 : 0;
    // totalPrice.value =
    //     218400 - discount; // Assuming a fixed price for simplicity
  }
}
