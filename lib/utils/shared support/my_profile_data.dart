// import 'dart:io';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:green_garden/Constant/color_constant.dart';
// import 'package:green_garden/Constant/text_constant.dart';
// import 'package:green_garden/pages/profile_page/widget/my_profile_data_widget.dart';
// import 'package:green_garden/Utils/shred_pref.dart';
// import 'package:green_garden/widgets/reusable_button_submit.dart';

// class ProfileDataInfo extends StatefulWidget {
//   const ProfileDataInfo({
//     super.key,
//   });

//   @override
//   State<ProfileDataInfo> createState() => _ProfileDataInfoState();
// }

// class _ProfileDataInfoState extends State<ProfileDataInfo> {
//   Future<void> signOut(BuildContext context) async {
//     await showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//           backgroundColor: ColorPlants.cyanPlant,
//           title: Column(
//             children: [
//               Text(
//                 'Sign Out Confirm',
//                 style: TextStyleUsable.interButton1,
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               Icon(
//                 Icons.error,
//                 size: 100,
//                 color: Colors.amber,
//               )
//             ],
//           ),
//           content: Text(
//             'Are You Sure wanna to Sign Out ?',
//             style: TextStyleUsable.interRegularBold,
//           ),
//           actions: [
//             InkWell(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: Container(
//                 width: 100,
//                 height: 40,
//                 child: Center(
//                   child: Text(
//                     'no',
//                     style: TextStyleUsable.interRegularBold,
//                   ),
//                 ),
//                 decoration: BoxDecoration(
//                   color: ColorPlants.greenDark,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//               ),
//             ),
//             InkWell(
//               onTap: () async {
//                 await FirebaseAuth.instance.signOut();
//                 _showSnackBarMessage("You're out ");
//                 Navigator.pushAndRemoveUntil(
//                   context,
//                   MaterialPageRoute(builder: (context) => exit(0)),
//                   (Route<dynamic> route) => false,
//                 ); // Close the app
//               },
//               child: Container(
//                 width: 100,
//                 height: 40,
//                 child: Center(
//                   child: Text(
//                     'Yes',
//                     style: TextStyleUsable.interRegularBoldGreen,
//                   ),
//                 ),
//                 decoration: BoxDecoration(
//                   color: ColorPlants.whiteSkull,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _showSnackBarMessage(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         duration: Duration(seconds: 5),
//         backgroundColor: Colors.black,
//         action: SnackBarAction(
//           label: 'Close',
//           textColor: Colors.white,
//           onPressed: () {
//             ScaffoldMessenger.of(context).hideCurrentSnackBar();
//           },
//         ),
//       ),
//     );
//   }

//   String? token;
//   String? pass;

//   void getToken() async {
//     token = await ShredPref.getToken();
//     print(token);
//     setState(() {});
//   }

//   void getPassToken() async {
//     pass = await ShredPref.getPassToken();
//     print(pass);
//     setState(() {});
//   }

//   @override
//   void initState() {
//     getToken();
//     getPassToken();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 500,
//       decoration: BoxDecoration(
//           color: ColorPlants.whiteSkull,
//           borderRadius: BorderRadius.only(
//               topRight: Radius.circular(30), topLeft: Radius.circular(30))),
//       child: Column(
//         children: [
//           SizedBox(
//             height: 50,
//           ),
//           DataProfileWidget(
//             text: 'Name       ',
//             titikDua: '              : ',
//             textTwo: 'Naubill Huda                 ',
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 40),
//             child: Divider(
//               height: 2,
//               color: Colors.grey,
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           DataProfileWidget(
//             text: 'Email        ',
//             titikDua: '              : ',
//             textTwo: 'naubilode@gmail.com',
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 40),
//             child: Divider(
//               height: 2,
//               color: Colors.grey,
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           DataProfileWidget(
//             text: 'Phone Number ',
//             titikDua: ' : ',
//             textTwo: '0899235422222           ',
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 40),
//             child: Divider(
//               height: 2,
//               color: Colors.grey,
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           ReusableButtonSubmit(
//             onTap: () {
//               ShredPref.removeAllKey();
//               signOut(context);
//             },
//             text: 'Sign Out',
//             textStyle: TextStyleUsable.interButton1,
//             bgColor: ColorPlants.greenDark,
//           )
//         ],
//       ),
//     );
//   }
// }
