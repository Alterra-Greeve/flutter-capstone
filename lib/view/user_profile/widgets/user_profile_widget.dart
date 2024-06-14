import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view_model/user_profile_controller.dart';

class UserProfileWidget extends StatelessWidget {
  final UserProfileController controller;
  const UserProfileWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 185,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: ColorsConstant.primary500,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.elliptical(200, 45),
          bottomRight: Radius.elliptical(200, 45),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Container(
              height: 88,
              decoration: BoxDecoration(
                color: ColorsConstant.neutral50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(44),
                          ),
                          child: Obx(
                            () => CachedNetworkImage(
                              height: 64,
                              width: 64,
                              imageUrl: controller
                                      .userProfileData.value?.data?.avatarUrl ??
                                  "",
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Obx(
                          () => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 205,
                                child: Text(
                                  controller
                                          .userProfileData.value?.data?.name ??
                                      "=",
                                  style: TextStylesConstant.nunitoHeading3,
                                  overflow: TextOverflow.fade,
                                  maxLines: 1,
                                  softWrap: false,
                                ),
                              ),
                              SizedBox(
                                width: 205,
                                child: Text(
                                  controller
                                          .userProfileData.value?.data?.email ??
                                      "=",
                                  style: TextStylesConstant.nunitoCaption,
                                  overflow: TextOverflow.fade,
                                  maxLines: 1,
                                  softWrap: false,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(IconsConstant.edit),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 119,
            left: 16,
            right: 16,
            child: Container(
              height: 66,
              decoration: const BoxDecoration(
                color: ColorsConstant.neutral800,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.elliptical(200, 32),
                  bottomRight: Radius.elliptical(200, 32),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 36,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(IconsConstant.star),
                        const SizedBox(width: 8),
                        Text(
                          'Bukan Membership',
                          style: TextStylesConstant.nunitoButtonMedium.copyWith(
                            color: ColorsConstant.neutral50,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '-',
                      style: TextStylesConstant.nunitoTitleBold.copyWith(
                        color: ColorsConstant.neutral50,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
