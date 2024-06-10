import 'package:flutter/material.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/view/home/screens/home_screen.dart';
import 'package:greeve/view/product/screens/product_screen.dart';
import 'package:greeve/view/register/screens/challenge_screen.dart';
import 'package:greeve/view/register/screens/impact_screen.dart';
import 'package:greeve/view/register/screens/profile_screen.dart';

class GlobalBottomNavbar extends StatelessWidget {
  final int currentIndex;

  const GlobalBottomNavbar({Key? key, required this.currentIndex})
      : super(key: key);

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const HomeScreen()));
        break;
      case 1:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const ChallengScreen()));
        break;
      case 2:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const ProductScreen()));
        break;
      case 3:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const ImpactScreen()));
        break;
      case 4:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const ProfileScreen()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (index) => _onItemTapped(context, index),
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(IconsConstant.game),
          label: 'Beranda',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.videogame_asset),
          label: 'Tantangan',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Produk',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.show_chart),
          label: 'Dampak',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profil',
        ),
      ],
    );
  }
}
