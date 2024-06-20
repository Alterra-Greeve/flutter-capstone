import 'package:get/get.dart';
import 'package:greeve/models/chart_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ImpactController extends GetxController {
  var selectedIndex = 3.obs;
  var selectedChartData = <ChartData>[].obs;
  var tooltipBehavior = TooltipBehavior(enable: true).obs;

  List<ChartData> chartData2021 = [
    ChartData('Jan', 70, 60, 40, 30),
    ChartData('Feb', 80, 70, 60, 50),
    ChartData('Mar', 50, 40, 30, 20),
    ChartData('Apr', 60, 50, 40, 30),
  ];

  List<ChartData> chartData2022 = [
    ChartData('Jan', 75, 65, 45, 35),
    ChartData('Feb', 85, 75, 65, 55),
    ChartData('Mar', 55, 45, 35, 25),
    ChartData('Apr', 65, 55, 45, 35),
  ];

  List<ChartData> chartData2023 = [
    ChartData('Jan', 80, 70, 50, 40),
    ChartData('Feb', 90, 80, 70, 60),
    ChartData('Mar', 60, 50, 40, 30),
    ChartData('Apr', 70, 60, 50, 40),
  ];

  List<ChartData> chartData2024 = [
    ChartData('Jan', 85, 75, 55, 45),
    ChartData('Feb', 95, 85, 75, 65),
    ChartData('Mar', 65, 55, 45, 35),
    ChartData('Apr', 75, 65, 55, 45),
  ];

  @override
  void onInit() {
    super.onInit();
    _onCategorySelected(selectedIndex.value);
  }

  void selectCategory(int index) {
    _onCategorySelected(index);
  }

  void _onCategorySelected(int index) {
    selectedIndex.value = index;
    switch (index) {
      case 0:
        selectedChartData.value = chartData2021;
        break;
      case 1:
        selectedChartData.value = chartData2022;
        break;
      case 2:
        selectedChartData.value = chartData2023;
        break;
      case 3:
        selectedChartData.value = chartData2024;
        break;
    }
  }
}
