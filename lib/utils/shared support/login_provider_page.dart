// import 'package:flutter/material.dart';
// import 'package:green_garden/Constant/color_constant.dart';
// import 'package:green_garden/Constant/icon_constant.dart';
// import 'package:green_garden/Constant/text_constant.dart';
// import 'package:green_garden/provider/login_provider.dart';
// import 'package:green_garden/provider_pages/forget_password_provider_page.dart';
// import 'package:green_garden/provider_pages/register_provider_page.dart';
// import 'package:green_garden/widgets/reusable_button_submit.dart';
// import 'package:green_garden/widgets/reusable_text_field.dart';
// import 'package:provider/provider.dart';

// class LoginPageProvider extends StatelessWidget {
//   const LoginPageProvider({Key? key, required this.toRegisterPage})
//       : super(key: key);
//   final VoidCallback toRegisterPage;

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => LoginProvider(), // Inisialisasi LoginProvider
//       child: Consumer<LoginProvider>(
//         builder: (context, loginProvider, _) => Scaffold(
//           backgroundColor: ColorPlants.backgroundColor,
//           body: SingleChildScrollView(
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Center(
//                   child: Image.asset(
//                     'assets/loginPic.png',
//                     width: 280,
//                     height: 280,
//                   ),
//                 ),
//                 Text(
//                   'Welcome Back',
//                   style: TextStyleUsable.interLogin,
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   'Login to your account',
//                   style: TextStyleUsable.interRegular,
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 25),
//                   child: ReusableWidgetTextField(
//                     controller: loginProvider.emailController,
//                     hintText: 'Email',
//                     prefixIcon: IconConstant.emailIcon,
//                     enable: true,
//                     obscureText: false,
//                     onChanged: (String value) {
//                       loginProvider.setName(value);
//                     },
//                     errorText: loginProvider.errorName,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 25,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 25),
//                   child: ReusableWidgetTextField(
//                     controller: loginProvider.passwordController,
//                     hintText: 'Password',
//                     prefixIcon: IconConstant.passwordIcon,
//                     enable: true,
//                     obscureText: true,
//                     onChanged: (String value) {
//                       loginProvider.setPass(value);
//                     },
//                     errorText: loginProvider.errorPass,
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 190),
//                   child: TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => ForgetPassPageProvider(),
//                         ),
//                       );
//                     },
//                     child: Text(
//                       'Forget Password ??',
//                       style: TextStyleUsable.interRegularFP,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 63,
//                 ),
//                 Center(
//                   child: ReusableButtonSubmit(
//                       onTap: () {
//                         loginProvider.signIn(
//                             email: loginProvider.emailController.text,
//                             password: loginProvider.passwordController.text,
//                             context: context);
//                       },
//                       text: 'Sign In',
//                       textStyle: TextStyleUsable.interButton,
//                       bgColor: ColorPlants.whiteSkull),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Don't have an account ? ",
//                       style: TextStyleUsable.interRegular,
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => RegisterPageProvider(
//                                     toLoginPage: () {},
//                                   )),
//                         );
//                       },
//                       child: Text(
//                         'Sign Up',
//                         style: TextStyleUsable.interRegularTwo,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
