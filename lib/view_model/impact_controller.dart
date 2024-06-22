import 'package:get/get.dart';
import 'package:greeve/models/api_responses/impact_response_model.dart';
import 'package:greeve/models/chart_model.dart';
import 'package:greeve/services/api/api_impact_service.dart';
import 'package:greeve/services/shared_pref/shared_pref.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ImpactDetailController extends GetxController {
  var selectedIndex = 3.obs;
  var selectedChartData = <ChartData>[].obs;
  var tooltipBehavior = TooltipBehavior(enable: true).obs;
  final ApiDetailImpactService _apiImpactService = ApiDetailImpactService();
  RxBool isLoading = RxBool(false);
  RxList<Datum> impactData = <Datum>[].obs;
  Rx<String?> errorMessage = Rx<String?>(null);
  Rx<Datum?> selectedImpactData = Rx<Datum?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchImpactData();
  }

  void fetchImpactData() async {
    try {
      isLoading.value = true;
      final String? token = await SharedPreferencesManager.getToken();
      List<Datum> data = await _apiImpactService.getImpactData(token!);
      impactData.assignAll(data);
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void fetchImpactDetail(int impactId) async {
    try {
      isLoading.value = true;
      Datum detail = await _apiImpactService.getImpactDetail(impactId);
      selectedImpactData.value = detail;
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  String getAssetPath(String impactName) {
    switch (impactName) {
      case 'Hemat Uang':
        return IconsConstant.saveMoney;
      case 'Mengurangi Limbah':
        return IconsConstant.reduceWaste;
      case 'Perluas Wawasan':
        return IconsConstant.expandKnowledge;
      case 'Mengurangi Pemanasan Global':
        return IconsConstant.reduceGlobalWarming;
      default:
        return IconsConstant.saveMoney;
    }
  }
}
