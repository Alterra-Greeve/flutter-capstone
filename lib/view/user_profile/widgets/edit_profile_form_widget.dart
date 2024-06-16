import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greeve/global_widgets/global_text_field_widget.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view_model/user_profile_controller.dart';

class EditProfileFormWidget extends StatelessWidget {
  final UserProfileController controller;
  const EditProfileFormWidget({super.key, required this.controller,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(62.5),
            child: CachedNetworkImage(
              height: 125,
              width: 125,
              imageUrl:
                  "https://oneshaf.com/wp-content/uploads/2021/08/placeholder.png",
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Ganti',
          style: TextStylesConstant.nunitoButtonLarge.copyWith(
            fontSize: 16,
            color: ColorsConstant.black,
          ),
        ),
        const SizedBox(height: 28),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
                child: Text(
                  'Nama',
                  style: TextStylesConstant.nunitoCaption,
                ),
              ),
              GlobalTextFieldWidget(
                focusNode: controller.nameFocusNode,
                controller: controller.nameController,
                showSuffixIcon: false,
                keyboardType: TextInputType.name,
                hintText: 'John Doe',
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 20,
                child: Text(
                  'Email',
                  style: TextStylesConstant.nunitoCaption,
                ),
              ),
              GlobalTextFieldWidget(
                focusNode: controller.emailFocusNode,
                controller: controller.emailController,
                showSuffixIcon: false,
                keyboardType: TextInputType.emailAddress,
                hintText: 'johndoe@gmail.com',
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 20,
                child: Text(
                  'No. Handphone',
                  style: TextStylesConstant.nunitoCaption,
                ),
              ),
              GlobalTextFieldWidget(
                focusNode: controller.phoneNumberFocusNode,
                controller: controller.phoneNumberController,
                showSuffixIcon: false,
                keyboardType: TextInputType.number,
                hintText: '+62896396686xxx',
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 20,
                child: Text(
                  'Alamat',
                  style: TextStylesConstant.nunitoCaption,
                ),
              ),
              GlobalTextFieldWidget(
                focusNode: controller.addressFocusNode,
                controller: controller.addressController,
                showSuffixIcon: false,
                keyboardType: TextInputType.streetAddress,
                hintText: 'Cisurupan, Garut, Jawa Barat',
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 20,
                child: Text(
                  'Jenis Kelamin',
                  style: TextStylesConstant.nunitoCaption,
                ),
              ),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio<String>(
                      value: 'Pria',
                      groupValue: controller.selectedOption.value,
                      onChanged: (value) {
                        controller.setSelectedOption(value!);
                      },
                    ),
                    const Text('Pria'),
                    const SizedBox(width: 20),
                    Radio<String>(
                      value: 'Wanita',
                      groupValue: controller.selectedOption.value,
                      onChanged: (value) {
                        controller.setSelectedOption(value!);
                      },
                    ),
                    const Text('Wanita'),
                    const SizedBox(width: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
