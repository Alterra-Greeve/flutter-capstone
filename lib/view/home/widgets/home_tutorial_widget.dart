part of '../screens/home_screen.dart';

class HomeTutorialWidget extends StatelessWidget {
  final String headerText;
  final String titleText;
  final String descText;
  final Function()? onPressedNext;
  final Function()? onPressedSkip;
  final String? nextText;
  final String? skipText;
  const HomeTutorialWidget({
    super.key,
    required this.titleText,
    required this.descText,
    this.onPressedNext,
    this.onPressedSkip,
    this.nextText,
    this.skipText,
    required this.headerText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          headerText,
          textAlign: TextAlign.center,
          style: TextStylesConstant.nunitoSubtitle2.copyWith(
            color: ColorsConstant.neutral50,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          titleText,
          textAlign: TextAlign.center,
          style: TextStylesConstant.nunitoTitleBold.copyWith(
            color: ColorsConstant.neutral50,
          ),
        ),
        const SizedBox(
          height: 13,
        ),
        Text(
          descText,
          textAlign: TextAlign.center,
          style: TextStylesConstant.nunitoSubtitle.copyWith(
            color: ColorsConstant.neutral50,
          ),
        ),
        const SizedBox(
          height: 36,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: ColorsConstant.secondary500,
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextButton(
            onPressed: onPressedNext,
            child: Text(
              nextText ?? 'Mulai',
              style: TextStylesConstant.nunitoButtonLarge
                  .copyWith(color: ColorsConstant.primary600),
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        TextButton(
          onPressed: onPressedSkip,
          child: Text(
            skipText ?? '',
            textAlign: TextAlign.center,
            style: TextStylesConstant.nunitoButtonLarge,
          ),
        ),
      ],
    );
  }
}
