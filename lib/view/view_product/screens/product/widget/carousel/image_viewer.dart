import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomImageViewer {
  CustomImageViewer._();

  static Widget show({
    required BuildContext context,
    required String assetPath,
    BoxFit? fit,
    double? radius,
  }) {
    // Check if the file is an SVG
    bool isSvg = assetPath.toLowerCase().endsWith('.svg');

    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius ?? 20)),
      child: GestureDetector(
        onTap: () {
          // Navigator.push(context, route)
        },
        child: isSvg
            ? SvgPicture.asset(
                assetPath,
                fit: fit ?? BoxFit.cover,
                placeholderBuilder: (BuildContext context) => Container(
                  padding: const EdgeInsets.all(30.0),
                  child: const LinearProgressIndicator(),
                ),
                width: double.infinity,
                height: double.infinity,
              )
            : Image.asset(
                assetPath,
                fit: fit ?? BoxFit.cover,
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                  if (wasSynchronouslyLoaded) {
                    return child;
                  }
                  return AnimatedOpacity(
                    opacity: frame == null ? 0 : 1,
                    duration: const Duration(milliseconds: 20),
                    child: child,
                  );
                },
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.error_outline),
              ),
      ),
    );
  }
}
