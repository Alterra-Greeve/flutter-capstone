import 'package:flutter/material.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class SeeAllViewProductWidget extends StatelessWidget {
  const SeeAllViewProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> products = [
      'Product 1',
      'Product 2',
      'Product 3',
      'Product 4'
    ];

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            '4 Barang ketemu',
            style: TextStylesConstant.nunitoSubtitle4,
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 10),
          Expanded(
            child: GridView.builder(
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 2.0,
              ),
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        products[index],
                        style: TextStylesConstant.nunitoSubtitle4,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
