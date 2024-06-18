import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greeve/global_widgets/global_button_widget.dart';
import 'package:greeve/global_widgets/global_form_button_widget.dart';
import 'package:greeve/routes/app_routes.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view_model/membership_controller.dart';


part '../widgets/membership_benefit_widget.dart';
part '../widgets/membership_button_get_membership_widget.dart';
part '../widgets/membership_card_boost_widget.dart';
part '../widgets/membership_card_epic_widget.dart';
part '../widgets/membership_card_lite_widget.dart';
part '../widgets/membership_card_widget.dart';
part 'membership_successfully_screen.dart';

class MembershipScreen extends StatelessWidget {
  final MembershipController controller = Get.put(MembershipController());

  MembershipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MembershipButtonGetMembershipWidget(),
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            IconsConstant.arrow,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        toolbarHeight: 56,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Pilih Paket Membersip Kamu',
                  style: TextStylesConstant.nunitoHeading4.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Bulanan atau Tahunan? Itu pilihanmu',
                style: TextStylesConstant.nunitoSubtitle.copyWith(
                  color: ColorsConstant.neutral600,
                ),
              ),
              const SizedBox(height: 16),
              MembershipCardEpicWidget(),
              const SizedBox(height: 12),
              MembershipCardBoostWidget(),
              const SizedBox(height: 12),
              MembershipCardLiteWidget(),
              const SizedBox(height: 8),
              MembershipBenefitWidget(),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
