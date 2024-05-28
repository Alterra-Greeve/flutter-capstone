// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:green_garden/pages/home/home_page.dart';
// import 'package:green_garden/Utils/shred_pref.dart';
// import 'package:green_garden/provider_pages/forget_password_provider_page.dart';

// class LoginProvider with ChangeNotifier {
//   String? _errorMessage;
//   String _name = "";
//   String _pass = "";
//   String? _errorName;
//   String? _errorPass;
//   int _loginAttempts = 0;
//   int get loginAttempts => _loginAttempts;

//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

//   String get name => _name;
//   String get pass => _pass;
//   String? get errorName => _errorName;
//   String? get errorPass => _errorPass;

//   String? get errorMessage => _errorMessage;

//   bool _isPasswordVisible = false;
//   bool get isPasswordVisible => _isPasswordVisible;

//   void setName(String value) {
//     _name = value;
//     if (_name.isEmpty) {
//       _errorName = 'Email must not be empty';
//     } else if (_name.length < 3) {
//       _errorName = 'Email must be at least 3 characters long';
//     } else {
//       _errorName = null;
//     }
//     notifyListeners();
//   }

//   void setPass(String value) {
//     _pass = value;
//     if (_pass.isEmpty) {
//       _errorPass = 'Password must not be empty';
//     } else if (_pass.length < 6) {
//       _errorPass = 'Password must be at least 6 characters long';
//     } else {
//       _errorPass = null;
//     }
//     notifyListeners();
//   }

//   void setVisible() {
//     _isPasswordVisible = !_isPasswordVisible;
//     notifyListeners();
//   }

//   Future<void> signIn({
//     required String email,
//     required String password,
//     required BuildContext context,
//   }) async {
//     //Validasi Inputan
//     if (email.isEmpty || password.isEmpty) {
//       _errorMessage = "Please enter email and password !!";
//       _showSnackBarMessage(context, errorMessage!);
//       return;
//     }

//     try {
//       ShredPref.saveToken(token: emailController.text);
//       ShredPref.savePass(pass: passwordController.text);
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: email.trim(),
//         password: password.trim(),
//       );

//       //Reset Attempts if login successful
//       _loginAttempts = 0;

//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => HomePage(),
//         ),
//       );
//     } on FirebaseAuthException catch (e) {
//       _loginAttempts++;

//       _errorMessage = "Wrong Email and Password";
//       _showSnackBarMessage(context, errorMessage!);

//       //Check if login attempt reach 3
//       if (_loginAttempts >= 3) {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ForgetPassPageProvider(),
//           ),
//         );
//       } else {
//         if (_loginAttempts >= 3) {
//           _showSnackBarMessage(context, errorMessage!);
//         }
//       }
//     }
//   }

//   void _showSnackBarMessage(BuildContext context, String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Center(child: Text(message)),
//         duration: Duration(seconds: 5),
//         backgroundColor: Colors.black,
//       ),
//     );
//   }
// }
