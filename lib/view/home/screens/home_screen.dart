import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greeve/routes/app_routes.dart';
import 'package:greeve/services/shared_pref/shared_pref.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                SharedPreferencesManager.removeToken();
              },
              child: const Text('Delete Token'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.offAllNamed(AppRoutes.listChallenge);
              },
              child: const Text('List Challenges'),
            ),
          ],
        ),
      ),
    );
  }
}
