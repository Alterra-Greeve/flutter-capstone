import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:greeve/view_model/impact_monthly_controller.dart';

class ImpactChartWidget extends StatelessWidget {
  final TooltipBehavior tooltipBehavior;
  final ImpactMonthlyController controller =
      Get.find<ImpactMonthlyController>();

  ImpactChartWidget({Key? key, required this.tooltipBehavior})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        List<ChartData> chartData = controller.chartData;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SfCartesianChart(
            legend: Legend(
              isVisible: true,
              position: LegendPosition.bottom,
              alignment: ChartAlignment.near,
              orientation: LegendItemOrientation.vertical,
              overflowMode: LegendItemOverflowMode.wrap,
              iconHeight: 15,
              iconWidth: 15,
              textStyle: TextStylesConstant.nunitoButtonMedium.copyWith(
                color: ColorsConstant.black,
              ),
            ),
            tooltipBehavior: tooltipBehavior,
            series: <CartesianSeries>[
              StackedColumnSeries<ChartData, String>(
                dataSource: chartData,
                xValueMapper: (ChartData data, _) => data.month,
                yValueMapper: (ChartData data, _) => data.hematUang,
                name: 'Hemat Uang',
                color: ColorsConstant.secondary700,
                legendIconType: LegendIconType.circle,
              ),
              StackedColumnSeries<ChartData, String>(
                dataSource: chartData,
                xValueMapper: (ChartData data, _) => data.month,
                yValueMapper: (ChartData data, _) => data.mengurangiLimbah,
                name: 'Mengurangi Limbah',
                color: ColorsConstant.secondary400,
                legendIconType: LegendIconType.circle,
              ),
              StackedColumnSeries<ChartData, String>(
                dataSource: chartData,
                xValueMapper: (ChartData data, _) => data.month,
                yValueMapper: (ChartData data, _) => data.memperluasWawasan,
                name: 'Perluas Wawasan',
                color: ColorsConstant.primary800,
                legendIconType: LegendIconType.circle,
              ),
              StackedColumnSeries<ChartData, String>(
                dataSource: chartData,
                xValueMapper: (ChartData data, _) => data.month,
                yValueMapper: (ChartData data, _) =>
                    data.mengurangiPemanasanGlobal,
                name: 'Mengurangi Pemanasan Global',
                color: ColorsConstant.primary400,
                legendIconType: LegendIconType.circle,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
              ),
            ],
            primaryXAxis: CategoryAxis(
              labelStyle: TextStylesConstant.nunitoCaption.copyWith(
                color: ColorsConstant.neutral500,
              ),
            ),
            primaryYAxis: NumericAxis(
              labelStyle: TextStylesConstant.nunitoCaption.copyWith(
                color: ColorsConstant.neutral500,
              ),
            ),
          ),
        );
      },
    );
  }
}
