part of '../screens/membership_screen.dart';

class MembershipCardEpicWidget extends StatelessWidget {
  final MembershipController controller = Get.put(MembershipController());

  MembershipCardEpicWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => MembershipCardWidget(
        membershipTitle: 'Epic',
        membershipDescription:
            'Hemat 2 bulan! Dapatkan akses penuh selama 12 bulan.',
        membershipPrice: 'Rp299.000',
        membershipDuration: '/Tahun',
        backgroundColor: ColorsConstant.danger600,
        gradientColor: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            ColorsConstant.warning300,
            ColorsConstant.danger400,
            ColorsConstant.danger500,
            ColorsConstant.warning300,
          ],
        ),
        isSelected: controller.isSelectedMap['Epic'] ?? false,
        onSelect: (selected) {
          if (selected) {
            controller.isSelectedMap['Lite'] = false;
            controller.isSelectedMap['Boost'] = false;
          }
          controller.isSelectedMap['Epic'] = selected;
        },
        cardKey: 'Epic',
      ),
    );
  }
}
