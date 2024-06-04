import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class ListVerticalProduct extends StatefulWidget {
  const ListVerticalProduct({super.key});

  @override
  State<ListVerticalProduct> createState() => _ListVerticalProductState();
}

class _ListVerticalProductState extends State<ListVerticalProduct> {
  List<Map<String, dynamic>> cartItems = [
    {
      "name": "Greeve Container",
      "description": "Wadah makanan kaca",
      "price": 69900,
      "image": ImagesConstant.greeveContainer,
      "quantity": 1
    },
    {
      "name": "Greeve Container",
      "description": "Wadah makanan kaca",
      "price": 69900,
      "image": ImagesConstant.greeveContainer,
      "quantity": 1
    },
    {
      "name": "Greeve Container",
      "description": "Wadah makanan kaca",
      "price": 69900,
      "image": ImagesConstant.greeveContainer,
      "quantity": 1
    },
    {
      "name": "Greeve Container",
      "description": "Wadah makanan kaca",
      "price": 69900,
      "image": ImagesConstant.greeveContainer,
      "quantity": 1
    },
    {
      "name": "Greeve Container",
      "description": "Wadah makanan kaca",
      "price": 69900,
      "image": ImagesConstant.greeveContainer,
      "quantity": 1
    },
    {
      "name": "Greeve Container",
      "description": "Wadah makanan kaca",
      "price": 69900,
      "image": ImagesConstant.greeveContainer,
      "quantity": 1
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        final item = cartItems[index];
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
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    item["image"],
                    width: 80,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(item["name"],
                            style: TextStylesConstant.nunitoHeading5),
                        Text(
                          item["description"],
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
                          Text('Rp ${item["price"].toString()}',
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
}
