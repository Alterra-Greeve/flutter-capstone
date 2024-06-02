import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greeve/models/api_responses/product_model.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/view/view_product/screens/cart/cart_screen.dart';
import 'package:greeve/view/view_product/screens/product/all_product/all_product_screen.dart';

class ListHorizontalProduct extends StatelessWidget {
  const ListHorizontalProduct({super.key});

  @override
  Widget build(BuildContext context) {
    List<Product> products = [
      Product(
        name: 'Tumbler',
        description: 'Botol air',
        price: 148500,
        image: ImagesConstant.bottleCard, // Use ImagesConstant
        quantity: 1,
      ),
      Product(
        name: 'Greeve Container',
        description: 'Wadah makanan kaca',
        price: 69900,
        image: ImagesConstant.greeveContainer, // Use ImagesConstant
        quantity: 1,
      ),
      // Tambahkan produk lainnya jika ada
    ];
    return Container(
      height: 380, // Ensure the container has a fixed height
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length + 1, // Adding 1 for the custom container
        itemBuilder: (context, index) {
          if (index == 2) {
            // Custom container at the third position
            return Container(
              width: 210,
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImagesConstant.cardvariant),
                  fit: BoxFit.cover,
                ),
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
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Cek juga produk dapur lainnya di sini',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 26),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Lihat Semua'),
                              SizedBox(
                                width: 10,
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AllProductScreen(),
                                    ),
                                  );
                                },
                                icon:
                                    SvgPicture.asset(IconsConstant.arrowRight),
                              ),
                            ],
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
            height: 300,
            margin: EdgeInsets.all(8),
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
                  child: Image.asset(
                    product.image,
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
                      Text(
                        product.name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        product.description,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rp ${product.price}',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
