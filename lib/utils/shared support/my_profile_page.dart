// import 'package:flutter/material.dart';
// import 'package:green_garden/Constant/color_constant.dart';
// import 'package:green_garden/constant/image_constant.dart';
// import 'package:green_garden/pages/ai_page/ai_page.dart';
// import 'package:green_garden/pages/home/home_page.dart';
// import 'package:green_garden/pages/profile_page/widget/image_avatar.dart';
// import 'package:green_garden/pages/profile_page/widget/my_profile_data.dart';
// import 'package:green_garden/pages/profile_page/widget/my_profile_menu_info.dart';
// import 'package:motion_tab_bar/MotionTabBar.dart';
// import 'package:motion_tab_bar/MotionTabBarController.dart';

// class MyProfilePage extends StatefulWidget {
//   const MyProfilePage({super.key});

//   @override
//   State<MyProfilePage> createState() => _MyProfilePageState();
// }

// class _MyProfilePageState extends State<MyProfilePage>
//     with SingleTickerProviderStateMixin {
//   MotionTabBarController? _motionTabBarController;

//   @override
//   void initState() {
//     _motionTabBarController =
//         MotionTabBarController(initialIndex: 1, vsync: this, length: 2);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorPlants.greenDark,
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: 80,
//             ),
//             ProfileImage(),
//             SizedBox(
//               height: 50,
//             ),
//             ProfileMenuInfo(),
//             SizedBox(
//               height: 50,
//             ),
//             ProfileDataInfo()
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => OpenAiPage(),
//             ),
//           );
//         },
//         backgroundColor: ColorPlants.cyanPlant,
//         child: ImageConstant.openAiBg2,
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: _buildBottomNavigationBar(),
//     );
//   }

//   MotionTabBar _buildBottomNavigationBar() {
//     return MotionTabBar(
//       controller: _motionTabBarController,
//       initialSelectedTab: "Profile",
//       labels: const ["Home", "Profile"],
//       icons: const [Icons.home, Icons.people_alt],
//       tabSize: 50,
//       tabBarHeight: 55,
//       textStyle: const TextStyle(
//         fontSize: 12,
//         color: Color(0xff27a2AB),
//         fontWeight: FontWeight.w500,
//       ),
//       tabIconColor: Colors.grey.shade400,
//       tabIconSize: 28.0,
//       tabIconSelectedSize: 26.0,
//       tabSelectedColor: ColorPlants.cyanPlant,
//       tabIconSelectedColor: Colors.white,
//       tabBarColor: Colors.white,
//       onTabItemSelected: (int value) {
//         setState(() {
//           _motionTabBarController!.index = value;
//           if (value == 0) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => HomePage(),
//               ),
//             );
//           } else {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => MyProfilePage(),
//                 ));
//           }
//         });
//       },
//     );
//   }
// }
