import 'package:get/get.dart';
import 'package:greeve/routes/app_routes.dart';
import 'package:greeve/models/carousel_item_model.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/view/greeve_coin/widget/bottom_sheet_widget.dart';

class GreeveCoinController extends GetxController {
  Rx<int> currentIndex = Rx<int>(0);

  final List<GetCoinAndVoucher> carouselItems = [
    GetCoinAndVoucher(
      image: ImagesConstant.carouselGetCoinImage1,
      name: 'Cara 1',
      title: 'Selesaikan\nChallenge',
    ),
    GetCoinAndVoucher(
      image: ImagesConstant.carouselGetCoinImage2,
      name: 'Cara 2',
      title: 'Beli Beberapa\nProduk',
    ),
    GetCoinAndVoucher(
      image: ImagesConstant.carouselGetCoinImage3,
      name: 'Cara 3',
      title: 'Menjadi\nPemenang',
    ),
  ];

  void navigateToBottomSheet() {
    Get.bottomSheet(
      const GreeveCoinBottomSheet(),
      isScrollControlled: true,
    );
  }

  void updateIndex(int index) {
    currentIndex.value = index;
  }

  void navigateToGetCoin() {
    Get.toNamed(
      AppRoutes.getCoin,
    );
  }
}
