// ignore_for_file: deprecated_member_use

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view_model/chatbot_controller.dart';

class ChatbotScreen extends StatelessWidget {
  const ChatbotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatbotController chatController = Get.put(ChatbotController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Greeve AI',
          style: TextStylesConstant.nunitoHeading3.copyWith(
              color: ColorsConstant.white, fontWeight: FontWeight.w500),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: true,
        backgroundColor: ColorsConstant.primary500,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: SvgPicture.asset(
            IconsConstant.arrow,
            color: ColorsConstant.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(() {
          return DashChat(
            messageOptions: const MessageOptions(
              containerColor: ColorsConstant.neutral200,
              textColor: ColorsConstant.neutral900,
              messagePadding: EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
            ),
            currentUser: chatController.currentUser,
            onSend: chatController.sendMessage,
            messages: chatController.messages.map((message) {
              return ChatMessage(
                user: message.user,
                createdAt: message.createdAt,
                text: Markdown(data: chatController.removeUnwantedSymbols(message.text)).data,
              );
            }).toList(),
          );
        }),
      ),
    );
  }
}
