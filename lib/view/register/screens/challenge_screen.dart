import 'package:flutter/material.dart';
import 'package:greeve/global_widgets/global_bottom_navbar_widget.dart';

class ChallengScreen extends StatelessWidget {
  const ChallengScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Challenge Screen'),
      ),
      bottomNavigationBar: const GlobalBottomNavbar(currentIndex: 1),
    );
  }
}
