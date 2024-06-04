import 'package:flutter/material.dart';
import 'package:greeve/utils/constants/colors_constant.dart';

class ListCategoriesProduct extends StatefulWidget {
  const ListCategoriesProduct({super.key});

  @override
  State<ListCategoriesProduct> createState() => _ListHorizontalProductState();
}

class _ListHorizontalProductState extends State<ListCategoriesProduct> {
  int selectedIndex = 0;
  final List<String> labels = ['Dapur', 'R. Tamu', 'R. Keluarga', 'R. Kerja'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60, // Ensure the container has a fixed height
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: labels.length,
        itemBuilder: (context, index) {
          bool isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              width: 130,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    labels[index],
                    style: TextStyle(
                      color: isSelected ? Colors.black : Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (isSelected)
                    Container(
                      margin: EdgeInsets.only(top: 4),
                      height: 1,
                      color: ColorsConstant.primary500,
                      width: 125,
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
