import 'package:flutter/material.dart';
import 'package:greeve/view/leaderboard/screens/leaderboard_screen.dart';
import 'package:greeve/view/leaderboard/screens/new_leaderboard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LeaderboardScreen(),
                  // builder: (context) => NewLeaderboard(),
                ),
              );
            },
            icon: Icon(
              Icons.table_chart,
            ),
          ),
        ],
      ),
    );
  }
}
