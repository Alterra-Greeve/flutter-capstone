import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:greeve/models/api_responses/impact_response_model.dart';
import 'package:greeve/utils/constants/colors_constant.dart';

class ImpactDescriptionWidget extends StatelessWidget {
  const ImpactDescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Datum impact = Get.arguments;
    return Html(
      data: impact.description,
      style: {
        "body": Style(
          fontFamily: 'Nunito',
          fontSize: FontSize(14.0),
          color: ColorsConstant.black,
        ),
        "strong": Style(
          fontWeight: FontWeight.normal,
        ),
        "p": Style(
          margin: Margins.only(bottom: 16.0),
        ),
        "ul": Style(
          padding: HtmlPaddings.only(left: 16),
        ),
        "li": Style(
          listStyleType: ListStyleType.disc,
          margin: Margins.only(bottom: 8.0),
        ),
      },
    );
  }
}
