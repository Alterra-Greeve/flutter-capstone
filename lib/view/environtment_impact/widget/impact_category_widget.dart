import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view_model/impact_controller.dart';
import 'package:greeve/view_model/impact_monthly_controller.dart';

class ImpactCategoryList extends StatelessWidget {
  const ImpactCategoryList({
    super.key,
    required this.impactController,
  });

  final ImpactMonthlyController impactController;

  @override
  Widget build(BuildContext context) {
    final categories = ['2021', '2022', '2023', '2024'];
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: categories.map((category) {
          final index = categories.indexOf(category);
          final isSelected =
              impactController.selectedYear.value == int.parse(category);

          return Expanded(
            child: GestureDetector(
              onTap: () {
                impactController.selectedYear.value = int.parse(category);
                impactController.fetchMonthlyImpact();
              },
              child: Obx(() {
                final isSelected =
                    impactController.selectedYear.value == int.parse(category);

                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? ColorsConstant.primary500
                        : ColorsConstant.neutral100,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(category,
                        style: TextStylesConstant.nunitoCaption.copyWith(
                          color: isSelected
                              ? ColorsConstant.neutral50
                              : ColorsConstant.black,
                        )),
                  ),
                );
              }),
            ),
          );
        }).toList(),
      ),
    );
  }
}
