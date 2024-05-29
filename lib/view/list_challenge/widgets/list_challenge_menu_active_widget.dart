import 'package:flutter/material.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';

class ListChallengeMenuActiveWidget extends StatelessWidget {
  final String activeButton;

  const ListChallengeMenuActiveWidget({required this.activeButton, super.key});

  @override
  Widget build(BuildContext context) {
    switch (activeButton) {
      case 'Lakukan':
        return _buildLakukanWidget();
      case 'Selesai':
        return _buildSelesaiWidget();
      case 'Dibatalkan':
        return _buildDibatalkanWidget();
      default:
        return Container();
    }
  }

  Widget _buildLakukanWidget() {
    return Text('Widget untuk Lakukan', style: TextStylesConstant.nunitoHeading3);
  }

  Widget _buildSelesaiWidget() {
    return Text('Widget untuk Selesai', style: TextStylesConstant.nunitoHeading3);
  }

  Widget _buildDibatalkanWidget() {
    return Text('Widget untuk Dibatalkan', style: TextStylesConstant.nunitoHeading3);
  }
}
