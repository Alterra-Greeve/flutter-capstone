part of '../screens/membership_screen.dart';

class MembershipCardLiteWidget extends StatelessWidget {
  final MembershipController controller = Get.put(MembershipController());

  MembershipCardLiteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => MembershipCardWidget(
        membershipTitle: 'Lite',
        membershipDescription: 'Dapatkan akses penuh selama 1 bulan.',
        membershipPrice: 'Rp30.000',
        membershipDuration: '/Bulan',
        backgroundColor: Colors.blue,
        gradientColor: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blue,
            Colors.blueAccent,
            Colors.white,
          ],
        ),
        isSelected: controller.isSelectedMap['Lite'] ?? false,
        onSelect: (selected) {
          if (selected) {
            controller.isSelectedMap['Epic'] = false;
            controller.isSelectedMap['Boost'] = false;
          }
          controller.isSelectedMap['Lite'] = selected;
        },
        cardKey: 'Lite',
      ),
    );
  }
}