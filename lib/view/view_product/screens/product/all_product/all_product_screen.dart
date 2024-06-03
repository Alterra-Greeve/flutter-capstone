import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greeve/global_widgets/global_text_field_widget.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/view/view_product/screens/cart/cart_screen.dart';
import 'package:greeve/view_model/search_product_controller.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchProductController = Get.put(SearchProductController());
    final FocusNode searchFocusNode = FocusNode();

    searchFocusNode.addListener(() {
      searchProductController.setFocus(searchFocusNode.hasFocus);
    });

    // Sample data for grid view items
    List<Map<String, dynamic>> products = [
      {
        'name': 'Tumbler',
        'price': 'Rp 148.500',
        'image': ImagesConstant.bottleGrid // Update with correct image path
      },
      {
        'name': 'Product 2',
        'price': 'Rp 100.000',
        'image': ImagesConstant.bottleProduct // Update with correct image path
      },
      {
        'name': 'Product 3',
        'price': 'Rp 200.000',
        'image': ImagesConstant.bottleProduct // Update with correct image path
      },
      {
        'name': 'Product 4',
        'price': 'Rp 300.000',
        'image': ImagesConstant.bottleProduct // Update with correct image path
      },
      {
        'name': 'Product 5',
        'price': 'Rp 400.000',
        'image': ImagesConstant.bottleProduct // Update with correct image path
      },
      {
        'name': 'Product 6',
        'price': 'Rp 500.000',
        'image': ImagesConstant.bottleProduct // Update with correct image path
      },
      {
        'name': 'Product 7',
        'price': 'Rp 600.000',
        'image': ImagesConstant.bottleProduct // Update with correct image path
      },
      {
        'name': 'Product 8',
        'price': 'Rp 700.000',
        'image': ImagesConstant.bottleProduct // Update with correct image path
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dapur',
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(),
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                shrinkWrap:
                    true, // Important to wrap inside SingleChildScrollView
                physics:
                    NeverScrollableScrollPhysics(), // Prevent GridView from scrolling independently
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  crossAxisSpacing: 10, // Horizontal space between items
                  mainAxisSpacing: 10, // Vertical space between items
                  childAspectRatio: 2 / 3, // Width / Height ratio of the items
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          child: SvgPicture.asset(
                            product['image'], // path to your image
                            height: 140,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product['name'],
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                              Text(
                                product['price'],
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
