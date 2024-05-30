import 'package:flutter/material.dart';
import 'package:greeve/global_widgets/global_bottom_navbar_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Screen'),
      ),
            bottomNavigationBar: GlobalBottomNavbar(currentIndex: 4),

    );
  }
}
