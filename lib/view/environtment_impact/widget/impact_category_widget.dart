import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/view/environtment_impact/impact_controller.dart';

class ImpactCategoryList extends StatelessWidget {
  const ImpactCategoryList({
    super.key,
    required this.impactController,
  });

  final ImpactController impactController;

  @override
  Widget build(BuildContext context) {
    final categories = ['2021', '2022', '2023', '2024'];
    return Container(
      height: 40,
      width: double.maxFinite,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final isSelected = impactController.selectedIndex.value == index;
          return GestureDetector(
            onTap: () => impactController.selectCategory(index),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: isSelected
                    ? ColorsConstant.primary500
                    : ColorsConstant.neutral100,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  categories[index],
                  style: TextStyle(
                    color: isSelected
                        ? ColorsConstant.white
                        : ColorsConstant.black,
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
