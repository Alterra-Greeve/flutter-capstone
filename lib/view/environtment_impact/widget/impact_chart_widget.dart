import 'package:flutter/widgets.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../utils/constants/colors_constant.dart';
import '../model/chart_model.dart';

class ImpactChartWidget extends StatefulWidget {
  const ImpactChartWidget({
    Key? key,
    required this.tooltipBehavior,
    required this.chartData,
  }) : super(key: key);

  final TooltipBehavior tooltipBehavior;
  final List<ChartData> chartData;

  @override
  State<ImpactChartWidget> createState() => _ImpactChartWidgetState();
}

class _ImpactChartWidgetState extends State<ImpactChartWidget> {
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      legend: Legend(
          isVisible: true,
          position: LegendPosition.bottom,
          alignment: ChartAlignment.near,
          orientation: LegendItemOrientation.vertical,
          overflowMode: LegendItemOverflowMode.wrap,
          iconHeight: 15,
          iconWidth: 15,
          textStyle: TextStylesConstant.nunitoCaption.copyWith(
            color: ColorsConstant.neutral900,
          )),
      tooltipBehavior: widget.tooltipBehavior,
      series: <CartesianSeries>[
        StackedColumnSeries<ChartData, String>(
          dataSource: widget.chartData,
          xValueMapper: (ChartData exp, _) => exp.expenseCategory,
          yValueMapper: (ChartData exp, _) => exp.saveMoney,
          name: 'Hemat Uang',
          color: ColorsConstant.secondary700,
          legendIconType: LegendIconType.circle,
        ),
        StackedColumnSeries<ChartData, String>(
          dataSource: widget.chartData,
          xValueMapper: (ChartData exp, _) => exp.expenseCategory,
          yValueMapper: (ChartData exp, _) => exp.increaseTrash,
          name: 'Mengurangi Limbah',
          color: ColorsConstant.secondary400,
          legendIconType: LegendIconType.circle,
        ),
        StackedColumnSeries<ChartData, String>(
          dataSource: widget.chartData,
          xValueMapper: (ChartData exp, _) => exp.expenseCategory,
          yValueMapper: (ChartData exp, _) => exp.knowledge,
          name: 'Memperluas Wawasan',
          color: ColorsConstant.primary800,
          legendIconType: LegendIconType.circle,
        ),
        StackedColumnSeries<ChartData, String>(
          dataSource: widget.chartData,
          xValueMapper: (ChartData exp, _) => exp.expenseCategory,
          yValueMapper: (ChartData exp, _) => exp.globalWarming,
          name: 'Mengurangi Pemanasan Global',
          color: ColorsConstant.primary400,
          legendIconType: LegendIconType.circle,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
        ),
      ],
      primaryXAxis: CategoryAxis(),
    );
  }
}
