import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/environtment_impact/screen/detail_impact_screen.dart';
import 'package:greeve/view_model/impact_controller.dart';

class ImpactListCardWidget extends StatelessWidget {
  final ImpactDetailController impactController =
      Get.put(ImpactDetailController());

  ImpactListCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        if (impactController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: impactController.impactData.length,
          itemBuilder: (context, index) {
            final impact = impactController.impactData[index];
            final assetPath = impactController.getAssetPath(impact.name);

            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => const DetailImpactScreen(), arguments: impact);
                  },
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      color: ColorsConstant.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: ColorsConstant.neutral200, width: 1),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          decoration: const BoxDecoration(
                            color: ColorsConstant.primary400,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                          ),
                          child: Center(
                            child: Image.asset(
                              assetPath,
                              height: 40,
                              width: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                impact.name,
                                style: TextStylesConstant.nunitoButtonSemibold
                                    .copyWith(color: ColorsConstant.neutral900),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "Dampak yang sudah dilakukan ${impact.impactPoint}%",
                                style: TextStylesConstant.nunitoCaption
                                    .copyWith(color: ColorsConstant.neutral600),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            );
          },
        );
      }),
    );
  }
}
