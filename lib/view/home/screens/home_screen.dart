import 'package:flutter/material.dart';
import 'package:greeve/services/shared_pref/shared_pref.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){
          SharedPreferencesManager.removeToken();
          
        }, child: Text('Delete Token')),
      ),
    );
  }
}