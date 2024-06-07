import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greeve/global_widgets/global_text_field_widget.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/view_product/screens/cart/cart_screen.dart';
import 'package:greeve/view/view_product/screens/product/all_product/widget/all_product_controller.dart';
import 'package:greeve/view_model/search_product_controller.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchProductController = Get.put(SearchProductController());
    final AllProductController controller = Get.put(AllProductController());
    final FocusNode searchFocusNode = FocusNode();

    searchFocusNode.addListener(() {
      searchProductController.setFocus(searchFocusNode.hasFocus);
    });

    // Panggil getToken saat layar dimuat
    controller.getToken();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dapur'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartScreen(),
                ),
              );
            },
            icon: SvgPicture.asset(IconsConstant.bag),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: GlobalTextFieldWidget(
                focusNode: searchFocusNode,
                hintText: 'Cari Produk',
                controller: TextEditingController(),
                errorText: null,
                prefixIcon: ImagesConstant.search,
                showSuffixIcon: false,
                keyboardType: TextInputType.text,
                onChanged: searchProductController.updateSearchQuery,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Obx(
                () {
                  if (controller.productData.value == null) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final products = controller.productData.value!;
                  return GridView.builder(
                    shrinkWrap:
                        true, // Important to wrap inside SingleChildScrollView
                    physics:
                        const NeverScrollableScrollPhysics(), // Prevent GridView from scrolling independently
                    itemCount: products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns
                      crossAxisSpacing: 10, // Horizontal space between items
                      mainAxisSpacing: 10, // Vertical space between items
                      childAspectRatio:
                          2 / 3, // Width / Height ratio of the items
                    ),
                    itemBuilder: (context, index) {
                     final product = products;

                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              child: Image.network(
                                product.images!.isNotEmpty
                                    ? product.images![0].imageUrl!
                                    : '',
                                height: 180,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.name ?? 'Nama Produk',
                                    style: TextStylesConstant.nunitoHeading5,
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    '${product.price ?? 0} IDR',
                                    style: TextStylesConstant.nunitoSubtitle,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
