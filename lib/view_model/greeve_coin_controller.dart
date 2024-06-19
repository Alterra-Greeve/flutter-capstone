import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:greeve/routes/app_routes.dart';
import 'package:greeve/models/carousel_item_model.dart';
import 'package:greeve/services/api/api_user_serpice.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/services/shared_pref/shared_pref.dart';
import 'package:greeve/view/common/bottom_navigation_screen.dart';
import 'package:greeve/view/greeve_coin/widget/bottom_sheet_widget.dart';
import 'package:greeve/models/api_responses/get_user_profile_response_model.dart';

class GreeveCoinController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final ApiUserService _apiUserService = ApiUserService();
  Rx<GetUserProfileResponseModel?> infoCoinUser =
      Rx<GetUserProfileResponseModel?>(null);
  Rx<int> currentIndex = Rx<int>(0);
  Rx<String?> errorMessage = Rx<String?>(null);
  Rx<bool> isLoading = Rx<bool>(false);
  late TabController _tabControllerHistory;
  TabController get tabControllerHistory => _tabControllerHistory;

  @override
  void onInit() {
    getInfoCoinUser();
    super.onInit();
    _tabControllerHistory = TabController(length: 3, vsync: this);
    _tabControllerHistory.addListener(() {
      if (_tabControllerHistory.indexIsChanging) {}
    });
  }

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

  final List<Tab> categoryTabsHistory = <Tab>[
    const Tab(text: 'All History'),
    const Tab(text: 'Income'),
    const Tab(text: 'Spending'),
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

  void navigateToAllVoucher() {
    Get.toNamed(
      AppRoutes.allVoucher,
    );
  }

  void navigateToAllHistoryCoin() {
    Get.toNamed(
      AppRoutes.historyCoin,
    );
  }

  void navigateToHome() {
    Get.offAll(
      const BottomNavScreen(),
    );
  }

  void getInfoCoinUser() async {
    final String? token = await SharedPreferencesManager.getToken();
    isLoading.value = true;
    try {
      final result = await _apiUserService.getUserProfile(token);
      infoCoinUser.value = result;
      var name = result.data?.name;
      var coin = result.data?.coin;
      var username = result.data?.username;
      if (kDebugMode) {
        print('testing get info $name');
        print('testing get info $username');
        print('testing get info $coin');
      }
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}

class AllVoucherController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<int> currentIndex = Rx<int>(0);

  late TabController _tabController;
  TabController get tabController => _tabController;

  @override
  void onInit() {
    super.onInit();
    _tabController = TabController(length: 5, vsync: this);

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {}
    });
  }

  final List<Tab> categoryTabsVoucher = <Tab>[
    const Tab(text: 'Semua'),
    const Tab(text: 'Hemat Uang'),
    const Tab(text: 'Mengurangi Limbah'),
    const Tab(text: 'Perluas Wawasan'),
    const Tab(text: 'Mengurangi Pemanasan Global'),
  ];
}
