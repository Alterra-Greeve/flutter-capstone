import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:greeve/global_widgets/global_button_widget.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/utils/constants/routes_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/global_widgets/global_text_field_widget.dart';
import 'package:greeve/view/auth_flow/screens/forgot_password/otp_screen.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  final FocusNode _focusNode = FocusNode();
  final _controller = TextEditingController();
  String? _errorText;
  bool remindMe = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(top: 24),
            child: IconButton(
              icon: SvgPicture.asset(IconsConstant.arrow,
                  colorFilter:
                      ColorFilter.mode(ColorsConstant.black, BlendMode.srcIn)),
              iconSize: 24,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
            top: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Form(
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 60),
              child: Column(
                children: [
                  SvgPicture.asset(
                    ImagesConstant.forgotPass,
                    height: 240.0,
                    width: 240.0,
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Lupa Kata Sandi",
                      style: TextStylesConstant.nunitoHeading3,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Masukkan email Anda, kami akan kirim tautan untuk atur ulang kata sandi.",
                      style: TextStylesConstant.nunitoSubtitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 28),
                  SizedBox(
                    width: double.infinity,
                    height: 20,
                    child: Text(
                      'Email',
                      style: TextStylesConstant.nunitoCaption.copyWith(
                        fontWeight: FontWeight.w700,
                        color: ColorsConstant.neutral800,
                      ),
                    ),
                  ),
                  GlobalTextFieldWidget(
                    focusNode: _focusNode,
                    controller: _controller,
                    errorText: _errorText,
                    hintText: 'Masukkan Email Anda',
                    prefixIcon: IconsConstant.message,
                    showSuffixIcon: false,
                  ),
                  const SizedBox(height: 27),
                  GlobalButtonWidget(
                    text: 'Kirim Tautan',
                    onTap: () {
                      Get.offAndToNamed(RoutesConstant.otp);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
