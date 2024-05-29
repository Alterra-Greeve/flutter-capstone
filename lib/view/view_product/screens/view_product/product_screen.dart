import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greeve/utils/constants/icons_constant.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mau Beli apa hari ini ? '),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(IconsConstant.search),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(IconsConstant.bag),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Text('data'),
            // Container(
            //   height: 200, // Ensure the container has a fixed height
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: 6,
            //     itemBuilder: (context, index) {
            //       return Container(
            //         width: 160,
            //         margin: EdgeInsets.all(8),
            //         decoration: BoxDecoration(
            //           color: Colors.amber,
            //           borderRadius: BorderRadius.circular(
            //               10), // Optional: for rounded corners
            //         ),
            //         child: Center(
            //           child: Text(
            //             'item $index',
            //             style: TextStyle(
            //               color: Colors.cyan,
            //               fontSize: 20,
            //             ),
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
