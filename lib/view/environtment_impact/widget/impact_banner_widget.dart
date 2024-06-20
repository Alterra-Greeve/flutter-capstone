import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:greeve/models/api_responses/impact_response_model.dart';

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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: CachedNetworkImage(
          imageUrl: impact.imageUrl,
          fit: BoxFit.cover,
          placeholder: (context, url) =>
              Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
