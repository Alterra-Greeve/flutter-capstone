import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get/get.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:translator/translator.dart';

class ChatbotController extends GetxController {
  final ChatUser currentUser = ChatUser(
    id: "0",
    firstName: "User",
  );

  final ChatUser geminiUser = ChatUser(
    id: "1",
    firstName: "Greeve AI",
    profileImage: ImagesConstant.logoGrevee,
  );

  final RxList<ChatMessage> _messages = <ChatMessage>[].obs;
  final Gemini _gemini = Gemini.instance;

  RxList<ChatMessage> get messages => _messages;

  final GoogleTranslator _translator = GoogleTranslator();

  final List<String> greenEnvironmentKeywords = [
    "environment", "green", "sustainability", "recycling", "climate change",
    "renewable energy", "conservation", "ecosystem", "pollution", "biodiversity",
    "save money", "heating", "expand knowledge", "reduce waste"
  ];

  bool containsGreenEnvironmentKeywords(String text) {
    for (var keyword in greenEnvironmentKeywords) {
      if (text.toLowerCase().contains(keyword.toLowerCase())) {
        return true;
      }
    }
    return false;
  }

  String removeUnwantedSymbols(String text) {
    return text.replaceAll(RegExp(r'[*]+'), '');
  }

  Future<void> sendMessage(ChatMessage chatMessage) async {
    chatMessage.text = removeUnwantedSymbols(chatMessage.text);

    _messages.insert(0, chatMessage);

    Translation translation = await _translator.translate(chatMessage.text, to: 'en');
    String translatedText = translation.text;

    if (containsGreenEnvironmentKeywords(translatedText)) {
      try {
        String question = chatMessage.text;
        _gemini.streamGenerateContent(question).listen((event) {
          ChatMessage? lastMessage = _messages.firstOrNull;

          if (lastMessage != null && lastMessage.user == geminiUser) {
            lastMessage = _messages.removeAt(0);
            String response = event.content?.parts?.fold(
              "",
              (previousValue, element) => "$previousValue${element.text}",
            ) ??
                "";

            lastMessage.text += response;

            _messages.insert(0, lastMessage);
          } else {
            String response = event.content?.parts?.fold(
              "",
              (previousValue, element) => "$previousValue${element.text}",
            ) ??
                "";

            ChatMessage message = ChatMessage(
              user: geminiUser,
              createdAt: DateTime.now(),
              text: response,
            );

            _messages.insert(0, message);
          }
        });
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    } else {
      ChatMessage message = ChatMessage(
        user: geminiUser,
        createdAt: DateTime.now(),
        text: "Saya hanya bisa menjawab pertanyaan terkait lingkungan.",
      );
      _messages.insert(0, message);
    }
  }
}
