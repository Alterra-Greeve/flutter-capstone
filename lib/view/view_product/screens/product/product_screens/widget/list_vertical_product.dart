import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/view_product/screens/product/product_screens/widget/list_vertical_controller.dart';

class ListVerticalProduct extends StatelessWidget {
  const ListVerticalProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ListVerticalController productController = Get.put(ListVerticalController());

    return Obx(() {
      if (productController.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      } else if (productController.errorMessage.isNotEmpty) {
        return Center(child: Text(productController.errorMessage.value));
      } else {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: productController.productList.length,
          itemBuilder: (context, index) {
            final item = productController.productList[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Container(
                height: 90,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 0.5,
                      blurRadius: 0.5,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        item.images?.first.imageUrl ?? '',
                        width: 80,
                        height: 100,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Image.asset(ImagesConstant.greeveContainer),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(item.name ?? '',
                                style: TextStylesConstant.nunitoHeading5),
                            Text(
                              item.description ?? '',
                              style: TextStylesConstant.nunitoSubtitle,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text('Rp ${item.price.toString()}',
                                  style: TextStylesConstant.nunitoSubtitle4),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }
    });
  }
}
