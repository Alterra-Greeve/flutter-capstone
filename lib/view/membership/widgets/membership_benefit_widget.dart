part of '../screens/membership_screen.dart';

class MembershipBenefitWidget extends StatelessWidget {
  MembershipBenefitWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 2),
          leading: SvgPicture.asset(
            IconsConstant.tickSquare,
          ),
          title: Text(
            _benefitTexts[index],
            style: TextStylesConstant.nunitoSubtitle,
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(
          height: 1,
          color: ColorsConstant.neutral200,
        );
      },
      itemCount: _benefitTexts.length,
    );
  }

  final List<String> _benefitTexts = [
    'Tolak hingga 5 Kartu Challenge',
    'Ambil 5 kartu challenge',
    'Tiga Kesempatan Shuffle Gratis!',
    'Nikmati Voucer Diskon Lebih Besar',
  ];
}
