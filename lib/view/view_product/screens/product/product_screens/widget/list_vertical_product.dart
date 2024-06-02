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
    // {
    //   "name": "Tumbler",
    //   "description": "Botol air",
    //   "price": 148500,
    //   "image": ImagesConstant.bottleList,
    //   "quantity": 1
    // },
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
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    // child: SvgPicture.asset(
                    //   item["image"],
                    //   width: 80,
                    //   height: 80,
                    //   fit: BoxFit.cover,
                    // ),
                    child: Image.asset(
                      item["image"],
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          item["name"],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        Text(
                          item["description"],
                          style: TextStylesConstant.nunitoCaption,
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
                              style: TextStylesConstant.nunitoButtonMedium),
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
