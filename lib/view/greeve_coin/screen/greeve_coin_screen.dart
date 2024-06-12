import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const Column(
              children: [
                Row(),
              ],
            ),
            Column(
              children: [
                const Row(),
                const Row(),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(''),
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(),
                )
              ],
            ),
            const Column(
              children: [
                SingleChildScrollView(
                  child: Column(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
