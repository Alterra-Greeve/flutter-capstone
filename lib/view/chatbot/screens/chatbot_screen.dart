import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
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
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.w500),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: SvgPicture.asset(
            IconsConstant.arrow,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(() {
          return DashChat(
            currentUser: chatController.currentUser,
            onSend: chatController.sendMessage,
            messages: chatController.messages.map((message) {
              if (message.user.id == chatController.geminiUser.id) {
                return ChatMessage(
                  user: message.user,
                  createdAt: message.createdAt,
                  text: Markdown(data: message.text).data, // Render HTML content
                );
              } else {
                return message;
              }
            }).toList(),
          );
        }),
      ),
    );
  }
}
