part of '../list_challenge_wrapper_screen.dart';

class ListChallengeMenuButtonWidget extends StatelessWidget {
  final ListChallengeController controller;

  const ListChallengeMenuButtonWidget({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildTextButton('Lakukan'),
        _buildTextButton('Selesai'),
        _buildTextButton('Dibatalkan'),
      ],
    );
  }

  Widget _buildTextButton(String title) {
    return Obx(() {
      bool isActive = controller.activeButton.value == title;
      return Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isActive ? ColorsConstant.primary500 : Colors.transparent,
              width: 1,
            ),
          ),
        ),
        child: TextButton(
          onPressed: () {
            controller.setActiveButton(title);
          },
          style: TextButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            title,
            style: isActive
                ? TextStylesConstant.nunitoButtonSemibold.copyWith(
                    color: ColorsConstant.neutral900,
                  )
                : TextStylesConstant.nunitoButtonSemibold.copyWith(
                    color: ColorsConstant.neutral400,
                  ),
          ),
        ),
      );
    });
  }
}
