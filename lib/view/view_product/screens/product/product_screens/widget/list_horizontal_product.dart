import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:greeve/models/api_responses/product_response_model.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/view_product/screens/product/all_product/all_product_screen.dart';
import 'package:greeve/view/view_product/screens/product/product_screens/widget/list_horizontal_controller.dart';

class ListHorizontalProduct extends StatelessWidget {
  const ListHorizontalProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final ListHorizontalController productController = Get.put(ListHorizontalController());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        height: 330, // Ensure the container has a fixed height
        child: Obx(() {
          if (productController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else if (productController.errorMessage.isNotEmpty) {
            return Center(child: Text(productController.errorMessage.value));
          } else {
            final products = productController.productList;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length + 1, // Adding 1 for the custom container
              itemBuilder: (context, index) {
                if (index == 2) {
                  // Custom container at the third position
                  return Container(
                    width: 210,
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage(ImagesConstant.cardvariant),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 0.5,
                          blurRadius: 0.5,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 110),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Check out other kitchen products here',
                            textAlign: TextAlign.left,
                            style: TextStylesConstant.nunitoSubtitle4,
                          ),
                        ),
                        const SizedBox(height: 100),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'See All',
                                style: TextStylesConstant.nunitoHeading4,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const AllProductScreen(),
                                    ),
                                  );
                                },
                                icon: SvgPicture.asset(
                                  IconsConstant.arrowRight,
                                  height: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }

                final productIndex = index > 2 ? index - 1 : index;
                final product = products[productIndex];

                return Container(
                  width: 210,
                  height: 200,
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 0.5,
                        blurRadius: 0.5,
                        offset: const Offset(0, 1),
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
                        child: CachedNetworkImage(
                          imageUrl: product.images?.isNotEmpty == true
                              ? product.images!.first.imageUrl
                              : '',
                          placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red, size: 48),
                          height: 200, // Adjust the height as needed
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product.name ?? 'Product Name',
                                style: TextStylesConstant.nunitoHeading4),
                            Text(product.description ?? 'Product Description',
                                style: TextStylesConstant.nunitoSubtitle4),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Rp ${product.price}',
                                style: TextStylesConstant.nunitoHeading5),
                            CircleAvatar(
                              backgroundColor: ColorsConstant.primary100,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(IconsConstant.bag_)),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        }),
      ),
    );
  }
}
