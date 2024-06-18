part of '../screens/membership_screen.dart';


class MembershipCardWidget extends StatelessWidget {
  final String membershipTitle;
  final String membershipDescription;
  final String membershipPrice;
  final String membershipDuration;
  final Color backgroundColor;
  final Gradient gradientColor;
  final bool isSelected;
  final Function(bool) onSelect;
  final String cardKey;

  const MembershipCardWidget({
    super.key,
    required this.membershipTitle,
    required this.membershipDescription,
    required this.membershipPrice,
    required this.membershipDuration,
    required this.backgroundColor,
    required this.gradientColor,
    required this.isSelected,
    required this.onSelect, required this.cardKey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: isSelected ? gradientColor : null,
        color: isSelected ? backgroundColor : ColorsConstant.neutral50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: ColorsConstant.neutral900,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 4,
            offset: const Offset(0, 2),
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      membershipTitle,
                      style: TextStylesConstant.nunitoButtonBold.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      membershipDescription,
                      style: TextStylesConstant.nunitoSubtitle,
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Radio(
                  value: true,
                  groupValue: isSelected,
                  onChanged: (value) {
                    onSelect(
                        true);
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                membershipPrice,
                style: TextStylesConstant.nunitoTitleBold,
              ),
              Text(
                membershipDuration,
                style: TextStylesConstant.nunitoCaption,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
