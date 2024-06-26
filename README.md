# Bookstash App
[![Stars](https://img.shields.io/github/stars/ivantendou/bookstash.svg)](https://github.com/Alterra-Greeve/flutter-capstone/stargazers)
[![Forks](https://img.shields.io/github/forks/ivantendou/bookstash.svg)](https://github.com/Alterra-Greeve/flutter-capstone/network/members)
[![Watchers](https://img.shields.io/github/watchers/ivantendou/bookstash.svg)](https://github.com/Alterra-Greeve/flutter-capstone/watchers)

[![GitHub license](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/Alterra-Greeve/flutter-capstone/blob/main/LICENSE)
[![platform](https://img.shields.io/badge/platform-Flutter-blue.svg)](https://flutter.dev/)

This project belong to capstone project on
**Alterra Academy Flutter Path - Kampus Merdeka Batch 6.**

Star ⭐ the repository if you like what you see😉.

![Presentasi Greeve All Team ](https://github.com/Alterra-Greeve/flutter-capstone/assets/70643310/2b31811a-1df5-4efc-be01-0c67ae31c782)

## 🌿 About Greeve
Welcome to Greeve, where sustainable living becomes effortless! 🌍 Greeve is not just another eco-friendly app; it's your gateway to a greener lifestyle. We've identified three common challenges people face in their efforts to protect the environment: lack of information, motivation, and access to eco-friendly products. To overcome these issues, we have designed Greeve with a range of innovative features.

## 🌿 Greeve Features

### 📝 Register/Join Membership
Become part of the Greeve community. Sign up to access more challenges, rewards and benefits for sustainable living.
### 📊 Measure Environmental Impacts
Track your environmental impact. Get detailed data on how your actions affect the planet and see your progress in reducing your carbon footprint.
### 🛒 View Environment-Friendly Products
Discover eco-friendly products. Browse our curated marketplace for items that help you make greener choices.
### 📚 View Challenges About the Environment
Stay informed and motivated. Access a wealth of information and participate in challenges designed to promote sustainable living.
### 💳 Purchase a Product (Manual Transfer)
Buy eco-friendly products with ease. Use our manual transfer payment option to make your purchases securely.
### 🎯 Personalized Content Recommendations
Enjoy content tailored to you. Our AI provides personalized recommendations based on your interests and eco-friendly goals.
### 💬 AI Chatbot
Get instant support and tips. Our AI chatbot is here to answer your questions and provide eco-friendly advice.
### 🏆 View Leaderboard of Challenges & Get Rewards
Compete and earn rewards. Participate in challenges, view the leaderboard, and earn rewards for your sustainable efforts.

## 🛠️ Tech Stack

| Feature                             | Package                                                   |
|-------------------------------------|-----------------------------------------------------------|
| Splash Screen                       | [another_flutter_splash_screen](https://pub.dev/packages/another_flutter_splash_screen) |
| Cached Network Image                | [cached_network_image](https://pub.dev/packages/cached_network_image) |
| Carousel Slider                     | [carousel_slider](https://pub.dev/packages/carousel_slider) |
| Icons                               | [cupertino_icons](https://pub.dev/packages/cupertino_icons) |
| Networking                          | [dio](https://pub.dev/packages/dio)                       |
| Dotted Border                       | [dotted_border](https://pub.dev/packages/dotted_border)   |
| Charts                              | [fl_chart](https://pub.dev/packages/fl_chart)             |
| Framework                           | [flutter](https://flutter.dev/)                           |
| Card Swiper                         | [flutter_card_swiper](https://pub.dev/packages/flutter_card_swiper) |
| HTML Rendering                      | [flutter_html](https://pub.dev/packages/flutter_html)     |
| SVG Rendering                       | [flutter_svg](https://pub.dev/packages/flutter_svg)       |
| State Management                    | [get](https://pub.dev/packages/get)                       |
| HTML Parsing                        | [html](https://pub.dev/packages/html)                     |
| Image Picker                        | [image_picker](https://pub.dev/packages/image_picker)     |
| Infinite Scroll Pagination          | [infinite_scroll_pagination](https://pub.dev/packages/infinite_scroll_pagination) |
| Interactive Bottom Sheet            | [interactive_bottom_sheet](https://pub.dev/packages/interactive_bottom_sheet) |
| Internationalization                | [intl](https://pub.dev/packages/intl)                     |
| JWT Decoder                         | [jwt_decoder](https://pub.dev/packages/jwt_decoder)       |
| Loading Indicator                   | [loading_indicator](https://pub.dev/packages/loading_indicator) |
| Percent Indicator                   | [percent_indicator](https://pub.dev/packages/percent_indicator) |
| Pin Code Fields                     | [pin_code_fields](https://pub.dev/packages/pin_code_fields) |
| Shared Preferences                  | [shared_preferences](https://pub.dev/packages/shared_preferences) |
| UI Enhancement                      | [shimmer](https://pub.dev/packages/shimmer)               |
| Sliding Up Panel                    | [sliding_up_panel](https://pub.dev/packages/sliding_up_panel) |
| Page Indicator                      | [smooth_page_indicator](https://pub.dev/packages/smooth_page_indicator) |
| Charts                              | [syncfusion_flutter_charts](https://pub.dev/packages/syncfusion_flutter_charts) |
| Core Syncfusion Package             | [syncfusion_flutter_core](https://pub.dev/packages/syncfusion_flutter_core) |
| URL Launcher                        | [url_launcher](https://pub.dev/packages/url_launcher)     |
| WebView                             | [webview_flutter](https://pub.dev/packages/webview_flutter) |
| AI Recommendation                   | [flutter_gemini](https://pub.dev/packages/flutter_gemini) |
| Chat Interface                      | [dash_chat_2](https://pub.dev/packages/dash_chat_2)       |
| Environment Variables Management    | [flutter_dotenv](https://pub.dev/packages/flutter_dotenv) |
| Translator                          | [translator](https://pub.dev/packages/translator)         |
| Markdown Rendering                  | [flutter_markdown](https://pub.dev/packages/flutter_markdown) |
| Tutorial Coach Mark                 | [tutorial_coach_mark](https://pub.dev/packages/tutorial_coach_mark) |
| Environment Variables Management    | [envied](https://pub.dev/packages/envied)                 |

### Dev Dependencies

| Feature                             | Package                                                   |
|-------------------------------------|-----------------------------------------------------------|
| Code Generation                     | [build_runner](https://pub.dev/packages/build_runner)     |
| Envied Code Generator               | [envied_generator](https://pub.dev/packages/envied_generator) |


## :hammer: Build it yourself
1. Run the following command:
   ```bash
   # Clone this repo
   git clone https://github.com/Alterra-Greeve/flutter-capstone.git

   # Install all dependencies and run the project
   flutter pub get
   flutter run
   ```
2. For chatbot feature, insert the API Key into your project's code. Open the `lib/utils/contants/gemini_ai.dart` file and replace ApiKey with the API Key you obtained.
   ```dart
   import 'package:flutter_gemini/flutter_gemini.dart';

   class GeminiAi {
     static const String apiKey = 'YOUR_API_KEY_HERE';
   }
   ```
   If you prefer to use .env to store the API Key, you can use the `flutter_dotenv` or `envied` package. Make sure to install the package and add the .env file to your project by storing the API Key inside it. Then, you can access this API Key from your project's code.
3. Perform hot reload or hot restart.

