part of '../screens/membership_screen.dart';

class MembershipCardBoostWidget extends StatelessWidget {
  final MembershipController controller = Get.put(MembershipController());

  MembershipCardBoostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => MembershipCardWidget(
        membershipTitle: 'Boost',
        membershipDescription:
            'Hemat 1 bulan! Dapatkan akses penuh selama setengah tahun.',
        membershipPrice: 'Rp149.000',
        membershipDuration: '/6 Bulan',
        backgroundColor: ColorsConstant.danger300,
        gradientColor: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            ColorsConstant.danger100,
            ColorsConstant.danger300,
            ColorsConstant.danger400,
          ],
        ),
        isSelected: controller.isSelectedMap['Boost'] ?? false,
        onSelect: (selected) {
          if (selected) {
            controller.isSelectedMap['Lite'] = false;
            controller.isSelectedMap['Epic'] = false;
          }
          controller.isSelectedMap['Boost'] = selected;
        },
        cardKey: 'Boost',
      ),
    );
  }
}
