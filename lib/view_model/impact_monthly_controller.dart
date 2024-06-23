import 'dart:developer';

import 'package:get/get.dart';
import 'package:greeve/models/api_responses/impact_poin_response_model.dart';
import 'package:greeve/services/api/api_impact_point_service.dart';
import 'package:greeve/services/shared_pref/shared_pref.dart';

class ImpactMonthlyController extends GetxController {
  var monthlyImpact = <MonthlyImpact>[].obs;
  var chartData = <ChartData>[].obs;
  RxBool isLoading = RxBool(false);
  RxInt selectedYear = 2024.obs;

  @override
  void onInit() {
    super.onInit();
    fetchMonthlyImpact();
  }

  void fetchMonthlyImpact() async {
    try {
      isLoading.value = true;
      final String? token = await SharedPreferencesManager.getToken();
      if (token != null) {
        if (selectedYear.value == 2024) {
          final List<MonthlyImpact> impactList =
              await ApiMonthlyImpactService().getMonthlyImpact(token);
          monthlyImpact.value = impactList;
          prepareChartData(impactList);
        } else {
          prepareEmptyChartData();
        }
      }
    } catch (e) {
      log('Error fetching monthly impact: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void prepareChartData(List<MonthlyImpact> monthlyImpact) {
    List<ChartData> data = [];

    for (var impact in monthlyImpact) {
      int saveMoney = 0;
      int reducedWaste = 0;
      int expandKnowledge = 0;
      int reduceGlobalWarming = 0;

      for (var point in impact.points) {
        switch (point.name) {
          case 'Hemat Uang':
            saveMoney += point.point;
            break;
          case 'Mengurangi Limbah':
            reducedWaste += point.point;
            break;
          case 'Perluas Wawasan':
            expandKnowledge += point.point;
            break;
          case 'Mengurangi Pemanasan Global':
            reduceGlobalWarming += point.point;
            break;
          default:
            break;
        }
      }

      
      data.add(ChartData(
        month: formatMonth(impact.month),
        hematUang: saveMoney,
        mengurangiLimbah: reducedWaste,
        memperluasWawasan: expandKnowledge,
        mengurangiPemanasanGlobal: reduceGlobalWarming,
      ));
    }

    chartData.value = data;
  }

  void prepareEmptyChartData() {
    List<ChartData> data = [];

    
    for (int i = 1; i <= 6; i++) {
      String month = i.toString().padLeft(2, '0');
      data.add(ChartData(
        month: formatMonth('2021-$month'),
        hematUang: 0,
        mengurangiLimbah: 0,
        memperluasWawasan: 0,
        mengurangiPemanasanGlobal: 0,
      ));
    }

    chartData.value = data;
  }

  String formatMonth(String month) {
    Map<String, String> monthMap = {
      '01': 'Jan',
      '02': 'Feb',
      '03': 'Mar',
      '04': 'Apr',
      '05': 'May',
      '06': 'Jun',
      '07': 'Jul',
      '08': 'Aug',
      '09': 'Sep',
      '10': 'Oct',
      '11': 'Nov',
      '12': 'Dec',
    };

    String monthNum = month.substring(5);
    return '${monthMap[monthNum]}';
  }
}

class ChartData {
  final String month;
  final int hematUang;
  final int mengurangiLimbah;
  final int memperluasWawasan;
  final int mengurangiPemanasanGlobal;

  ChartData({
    required this.month,
    required this.hematUang,
    required this.mengurangiLimbah,
    required this.memperluasWawasan,
    required this.mengurangiPemanasanGlobal,
  });
}