import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:greeve/models/api_responses/impact_response_model.dart';
import 'package:loading_indicator/loading_indicator.dart';

class ImpactBannerWidget extends StatelessWidget {
  const ImpactBannerWidget({
    super.key,
    required this.impact,
  });

  final Datum impact;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 217,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: CachedNetworkImage(
          imageUrl: impact.imageUrl,
          fit: BoxFit.cover,
          placeholder: (context, url) => Center(
            child: SizedBox(
              width: 50,
              child: LoadingIndicator(
                indicatorType: Indicator.ballRotateChase,
                strokeWidth: 4.0,
                colors: [Theme.of(context).primaryColor],
              ),
            ),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
