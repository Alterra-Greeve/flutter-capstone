import 'package:flutter/material.dart';
import 'package:greeve/view/home/screens/home_screen.dart';
import 'package:greeve/view/register/screens/challenge_screen.dart';
import 'package:greeve/view/register/screens/impact_screen.dart';
import 'package:greeve/view/register/screens/profile_screen.dart';
import 'package:greeve/view/view_product/screens/product/product_screens/product_screen.dart';

class GlobalBottomNavbar extends StatelessWidget {
  final int currentIndex;

  const GlobalBottomNavbar({Key? key, required this.currentIndex})
      : super(key: key);

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => HomeScreen()));
        break;
      case 1:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => ChallengScreen()));
        break;
      case 2:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => ProductScreen()));
        break;
      case 3:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => ImpactScreen()));
        break;
      case 4:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => ProfileScreen()));
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
          icon: Icon(Icons.home),
          label: 'Beranda',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.videogame_asset),
          label: 'Tantangan',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Produk',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.show_chart),
          label: 'Dampak',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profil',
        ),
      ],
    );
  }
}
