import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greeve/models/api_responses/impact_response_model.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/view/environtment_impact/widget/impact_banner_widget.dart';
import 'package:greeve/view/environtment_impact/widget/impact_description_widget.dart';
import 'package:greeve/view/environtment_impact/widget/impact_progress_widget.dart';
import 'package:greeve/view_model/impact_controller.dart';
import '../../../utils/constants/icons_constant.dart';
import '../../../utils/constants/text_styles_constant.dart';

class DetailImpactScreen extends StatelessWidget {
  const DetailImpactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Datum impact = Get.arguments;
    final ImpactDetailController impactDetailController =
        Get.put(ImpactDetailController());

    var monthlyPoint = impact.impactPoint / 100;
    final assetPath = impactDetailController.getAssetPath(impact.name);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            impact.name,
            style: TextStylesConstant.nunitoButtonBold,
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(IconsConstant.arrow),
          ),
          toolbarHeight: 64,
          scrolledUnderElevation: 0,
          backgroundColor: ColorsConstant.neutral50,
        ),
        body: Obx(() {
          if (impactDetailController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImpactBannerWidget(impact: impact),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        width: 45,
                        height: 45,
                        child: Image.asset(assetPath),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dampak',
                              style: TextStylesConstant.nunitoFooter.copyWith(
                                fontSize: 12,
                              ),
                            ),
                            Text(impact.name,
                                style: TextStylesConstant.nunitoTitleBold),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ImpactProgressIndicatorWidget(monthlyPoint: monthlyPoint),
                  const SizedBox(height: 6),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '${impact.impactPoint}/100',
                      style: TextStylesConstant.nunitoSemiboldTitle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(impact.name, style: TextStylesConstant.nunitoHeading4),
                  const SizedBox(height: 16),
                  const ImpactDescriptionWidget(),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
