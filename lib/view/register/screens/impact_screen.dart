import 'package:flutter/material.dart';
import 'package:greeve/global_widgets/global_bottom_navbar_widget.dart';

class ImpactScreen extends StatelessWidget {
  const ImpactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Impact Screen'),
      ),
      bottomNavigationBar: GlobalBottomNavbar(currentIndex: 3),
    );
  }
}