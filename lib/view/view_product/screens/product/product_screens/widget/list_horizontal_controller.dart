// import 'package:get/get.dart';
// import 'package:dio/dio.dart';
// import 'package:greeve/models/api_responses/product_model.dart';
// import 'package:greeve/utils/constants/api_constant.dart';
// import 'package:greeve/utils/helpers/error_handler_helper.dart';

// class ProductController extends GetxController {
//   var products = <Product>[].obs;
//   var isLoading = true.obs;
//   Dio _dio = Dio();

//   @override
//   void onInit() {
//     super.onInit();
//     fetchProducts();
//   }

//   Future<void> fetchProducts() async {
//     isLoading(true);
//     try {
//       String? token = 'YOUR_TOKEN_HERE'; // Dapatkan token dari penyimpanan atau autentikasi
//       Options options = Options(headers: {'Authorization': 'Bearer $token'});
//       final response = await _dio.get(ApiConstant.products, options: options);

//       if (response.statusCode == 200) {
//         var data = response.data['data'] as List;
//         products.value = data.map((json) => Product.fromJson(json)).toList();
//       } else {
//         throw ErrorHandlerHelper.tryGetProducts(response.statusCode);
//       }
//     } on DioException catch (e) {
//       throw ErrorHandlerHelper.catchGetProducts(e);
//     } finally {
//       isLoading(false);
//     }
//   }
// }
