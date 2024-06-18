part of '../screens/home_screen.dart';

class HomeUserDetailItemWidget extends StatelessWidget {
  final Widget iconPath;
  final String titleItem;
  final String? valueItem;
  const HomeUserDetailItemWidget({
    super.key,
    required this.iconPath,
    required this.titleItem,
    this.valueItem,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        iconPath,
        const SizedBox(height: 15),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: '$titleItem\n',
                style: TextStylesConstant.nunitoSubtitle3.copyWith(
                  color: ColorsConstant.neutral900,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text: valueItem.toString(),
                style: TextStylesConstant.nunitoCaption.copyWith(
                  color: ColorsConstant.neutral700,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
