import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greeve/models/api_responses/product_model.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
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
        name: 'Tumbler',
        description: 'Botol air',
        price: 148500,
        image: ImagesConstant.bottleCard, // Use ImagesConstant
        quantity: 1,
      ),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        height: 330, // Ensure the container has a fixed height
        child: ListView.builder(
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
                        'Cek juga produk dapur lainnya di sini',
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
                            'Lihat Semua',
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
                        Text(product.name,
                            style: TextStylesConstant.nunitoHeading4),
                        Text(product.description,
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
                              icon: Image.asset(IconsConstant.bag_)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
