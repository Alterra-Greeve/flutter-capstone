import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:greeve/view/environtment_impact/screen/detail_impact_screen.dart';
import '../../../utils/constants/colors_constant.dart';
import '../../../utils/constants/icons_constant.dart';
import '../../../utils/constants/images_constant.dart';
import '../../../utils/constants/text_styles_constant.dart';

class ImpactScreen extends StatefulWidget {
  const ImpactScreen({super.key});

  @override
  State<ImpactScreen> createState() => _ImpactScreenState();
}

class _ImpactScreenState extends State<ImpactScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<ChartData> chartData2021 = [
    ChartData('Jan', 100, 200, 150, 250),
    ChartData('Feb', 120, 180, 160, 240),
    ChartData('Mar', 130, 170, 140, 230),
    ChartData('April', 110, 190, 130, 220),
  ];

  final List<ChartData> chartData2022 = [
    ChartData('Jan', 150, 250, 200, 300),
    ChartData('Feb', 160, 240, 210, 290),
    ChartData('Mar', 170, 230, 220, 280),
    ChartData('April', 180, 220, 230, 270),
  ];

  final List<ChartData> chartData2023 = [
    ChartData('Jan', 200, 300, 250, 350),
    ChartData('Feb', 210, 290, 260, 340),
    ChartData('Mar', 220, 280, 270, 330),
    ChartData('April', 230, 270, 280, 320),
  ];

  final List<ChartData> chartData2024 = [
    ChartData('Jan', 250, 350, 300, 400),
    ChartData('Feb', 260, 340, 310, 390),
    ChartData('Mar', 270, 330, 320, 380),
    ChartData('April', 280, 320, 330, 370),
  ];

  List<ChartData> _selectedChartData = [];
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _selectedChartData = chartData2021;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onCategorySelected(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          _selectedChartData = chartData2021;
          break;
        case 1:
          _selectedChartData = chartData2022;
          break;
        case 2:
          _selectedChartData = chartData2023;
          break;
        case 3:
          _selectedChartData = chartData2024;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Overview Impact',
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
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildCategoryList(),
                SizedBox(height: 16),
                Container(
                  height: 400,
                  child: BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.spaceAround,
                      barGroups: _buildBarGroups(),
                      borderData: FlBorderData(show: false),
                      titlesData: FlTitlesData(
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              switch (value.toInt()) {
                                case 0:
                                  return const Text('Jan');
                                case 1:
                                  return const Text('Feb');
                                case 2:
                                  return const Text('Mar');
                                case 3:
                                  return const Text('April');
                                default:
                                  return const Text('');
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLegend('Hemat Uang', ColorsConstant.secondary700),
                    _buildLegend(
                        'Mengurangi Limbah', ColorsConstant.secondary400),
                    _buildLegend('Perluas Wawasan', ColorsConstant.primary500),
                    _buildLegend('Mengurangi Pemanasan Global',
                        ColorsConstant.primary400),
                  ],
                ),
                SizedBox(height: 16),
                _buildImageAndTitleList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryList() {
    final categories = ['2021', '2022', '2023', '2024'];
    return Container(
      height: 42,
      width: double.maxFinite,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final isSelected = _selectedIndex == index;
          return GestureDetector(
            onTap: () => _onCategorySelected(index),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
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

  List<BarChartGroupData> _buildBarGroups() {
    return _selectedChartData.asMap().entries.map((entry) {
      int index = entry.key;
      ChartData data = entry.value;
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
              toY: data.y1.toDouble(),
              color: ColorsConstant.secondary700,
              width: 12),
          BarChartRodData(
              toY: data.y2.toDouble(),
              color: ColorsConstant.secondary400,
              width: 12),
          BarChartRodData(
              toY: data.y3.toDouble(),
              color: ColorsConstant.primary800,
              width: 12),
          BarChartRodData(
              toY: data.y4.toDouble(),
              color: ColorsConstant.primary400,
              width: 12),
        ],
      );
    }).toList();
  }

  Widget _buildLegend(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
          ),
          SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildImageAndTitleList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 4,
      itemBuilder: (context, index) {
        String imagePath;
        String title;
        String subtitle;

        switch (index) {
          case 0:
            imagePath = ImagesConstant.hemat;
            title = 'Hemat Uang';
            subtitle = 'Dampak yang sudah dilakukan 40%';
            break;
          case 1:
            imagePath = ImagesConstant.totebag;
            title = 'Mengurangi Limbah';
            subtitle = 'Dampak yang sudah dilakukan 40%';
            break;
          case 2:
            imagePath = ImagesConstant.knowledge;
            title = 'Perluas Wawasan';
            subtitle = 'Dampak yang sudah dilakukan 40%';
            break;
          case 3:
            imagePath = ImagesConstant.globalWarming;
            title = 'Mengurangi Pemanasan Global';
            subtitle = 'Dampak yang sudah dilakukan 40%';
            break;
          default:
            return SizedBox.shrink();
        }

        return Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.to(() => DetailImpactScreen());
              },
              child: _buildImageAndTitleContainer(imagePath, title, subtitle),
            ),
            SizedBox(height: 8),
          ],
        );
      },
    );
  }

  Widget _buildImageAndTitleContainer(
      String imagePath, String title, String subtitle) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 70,
            height: 70,
            color: ColorsConstant.primary400,
            child: Image.asset(
              imagePath,
              width: 20,
              height: 20,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChartData {
  final String x;
  final int y1;
  final int y2;
  final int y3;
  final int y4;

  ChartData(this.x, this.y1, this.y2, this.y3, this.y4);
}
