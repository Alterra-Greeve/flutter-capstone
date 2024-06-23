import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view_model/greeve_coin_controller.dart';
import 'package:intl/intl.dart';

class HistoryCoinWidget extends StatelessWidget {
  final GreeveCoinController controller;
  final String id;
  final String name;
  final String? type;
  final int coin;
  final DateTime date;
  final bool spending;

  const HistoryCoinWidget({
    super.key,
    required this.controller,
    required this.id,
    required this.name,
    this.type,
    required this.coin,
    required this.date,
    required this.spending,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 7),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  ImagesConstant.coinHistory,
                ),
                const SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text(
                        name,
                        style: TextStylesConstant.nunitoCaptionBold
                            .copyWith(fontSize: 14),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    Text(
                      DateFormat(
                        'MMMM d, yyyy',
                      ).format(date),
                      style: TextStylesConstant.nunitoCaption,
                    ),
                  ],
                ),
              ],
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: spending
                    ? ColorsConstant.danger100
                    : ColorsConstant.primary100,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 8,
                ),
                child: Text(
                  coin.toString(),
                  style: TextStylesConstant.nunitoCaptionBold.copyWith(
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 7),
        const SizedBox(
          width: double.infinity,
          child: Divider(
            thickness: 0.8,
          ),
        ),
      ],
    );
  }
}
