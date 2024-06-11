import 'package:get/get.dart';
import 'package:greeve/models/api_responses/products_response_model.dart';
import 'package:greeve/routes/app_routes.dart';
import 'package:greeve/services/api/api_product_service.dart';
import 'package:greeve/services/shared_pref/shared_pref.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class AllProductScreenController extends GetxController {
  final ApiProductService _apiService = ApiProductService();
  final PagingController<int, Datum> pagingController =
      PagingController(firstPageKey: 1);

  Rx<String?> errorMessage = Rx<String?>(null);
  RxList<Datum> productsData = <Datum>[].obs;

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      getProductsbyCategory(pageKey);
    });
    super.onInit();
  }

  void getProductsbyCategory(int pageKey) async {
    try {
      final String category = Get.arguments;
      final String? token = await SharedPreferencesManager.getToken();
      final result = await _apiService.getProductsbyCategoryWithPage(
          token, category, pageKey.toString());
      final isLastPage = pageKey >= result.metadata!.totalPage!;
      if (isLastPage) {
        pagingController.appendLastPage(result.data!);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(result.data!, nextPageKey);
      }
      errorMessage.value = '';
    } catch (e) {
      pagingController.error = e;
    }
  }

  void navigateToProductDetail(String productId) {
    Get.toNamed(
      AppRoutes.detailProduct,
      arguments: productId,
    );
  }

  void navigateToProductSearch() {
    Get.toNamed(
      AppRoutes.searchProduct,
    );
  }
}
