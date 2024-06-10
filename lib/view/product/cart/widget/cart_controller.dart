import 'package:get/get.dart';
import 'package:greeve/utils/constants/images_constant.dart';

class CartController extends GetxController {
  var cartItems = [
    {
      "name": "Tumbler",
      "description" : "Botol Air",
      "price" : "148500",
      "image" : ImagesConstant.bottleList,
      "quantity" :1
    },
    {
      "name": "Greeve Container",
      "description": "Wadah makanan kaca",
      "price": 69900,
      "image": ImagesConstant.greeveContainer, // Update this path to your image
      "quantity": 1
    },
  ].obs;
}
