// TODO Try Sliding Up Chanel

//  SlidingUpPanel(
//             maxHeight: size.height * 0.8,
//             minHeight: size.height * 0.2,
//             controller: _panelController,
//             panelBuilder: (ScrollController scrollController) {
//               return Column(
//                 children: [
//                   GestureDetector(
//                     onTap: () {},
//                     child: Center(
//                       child: Container(
//                         margin: EdgeInsets.only(top: 15),
//                         height: 4,
//                         width: 40,
//                         decoration: BoxDecoration(
//                           color: ColorsConstant.neutral600,
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: ListView.builder(
//                       controller: scrollController,
//                       itemCount: _leaderController.leaderboardData.length,
//                       itemBuilder: (context, index) {
//                         final item = _leaderController.leaderboardData[index];
//                         return Container(
//                           child: ListTile(
//                             leading: Row(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 Text(
//                                   item.rank.toString(),
//                                   style: TextStylesConstant.nunitoTitleBold,
//                                 ),
//                                 SizedBox(
//                                     width: (index >= 0 && index < 6) ? 30 : 20),
//                                 CircleAvatar(
//                                   backgroundImage:
//                                       NetworkImage(item.avatarUrl ?? ''),
//                                 ),
//                               ],
//                             ),
//                             title: Text(
//                               item.name ?? '',
//                               style: TextStylesConstant.nunitoTitleBold,
//                             ),
//                             trailing: Text(
//                               item.exp.toString(),
//                               style: TextStylesConstant.nunitoTitleBold,
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),



// TODO Try With Obx

//  return DraggableScrollableSheet(
//       initialChildSize: 0.5,
//       minChildSize: 0.5,
//       maxChildSize: 0.7,
//       builder: (BuildContext context, ScrollController scrollController) {
//         return Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(15),
//               topRight: Radius.circular(15),
//             ),
//           ),
//           child: Stack(
//             children: [
//               Container(
//                 height: 3,
//                 width: 70,
//                 color: ColorsConstant.neutral600,
//                 margin: EdgeInsets.symmetric(vertical: 10),
//               ),
//               Obx(
//                 () => controller.isLoading.value
//                     ? Center(child: CircularProgressIndicator())
//                     : ListView.builder(
//                         controller: scrollController,
//                         itemCount: controller.leaderboardData.length,
//                         itemBuilder: (context, index) {
//                           final item = controller.leaderboardData[index];
//                           return ListTile(
//                             leading: CircleAvatar(
//                               backgroundImage:
//                                   NetworkImage(item.avatarUrl ?? ""),
//                             ),
//                             title: Text(controller.truncateName(item.name)),
//                             trailing: Text(item.exp.toString()),
//                           );
//                         },
//                       ),
//               ),
//             ],
//           ),
//         );
//       },
//     );


/* OLD CODE  */

//     return Obx(
//       () {
//         if (controller.isLoading.value) {
//           return Center(child: CircularProgressIndicator());
//         } else if (controller.leaderboardData.isEmpty) {
//           return Center(
//             child: GestureDetector(
//               onTap: () {
//                 showModalBottomSheet(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return Container(
//                       height: 350,
//                       color: Colors.white,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Image.asset(ImagesConstant.leaderboardEmpty),
//                           SizedBox(height: 20),
//                           Text(
//                             'Belum ada user yang masuk ke Leaderboard',
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               },
//               child: Text(
//                 'Belum ada user yang masuk ke Leaderboard',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           );
//         } else {
//           return Stack(
//             alignment: Alignment.topCenter,
//             children: [
//               if (controller.leaderboardData.length > 3) ...[
//                 SizedBox(
//                   width: 40,
//                   child: Divider(
//                     thickness: 5,
//                   ),
//                 ),
//               ],
//               Padding(
//                 padding: const EdgeInsets.only(
//                   right: 20,
//                   left: 20,
//                 ),
//                 child: Container(
//                   child: Expanded(
//                     child: ListView.builder(
//                       shrinkWrap: true,
//                       controller: scrollController,
//                       itemCount: controller.leaderboardData.length - 3,
//                       itemBuilder: (context, int index) {
//                         final item = controller.leaderboardData[index + 3];
//                         return Container(
//                           // color: item.rank == 5
//                           //     ? Colors.green.withOpacity(0.3)
//                           //     : Colors.transparent,
//                           child: ListTile(
//                             leading: Row(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 Text(
//                                   item.rank.toString(),
//                                   style: TextStylesConstant.nunitoTitleBold,
//                                 ),
//                                 SizedBox(width: 20),
//                                 CircleAvatar(
//                                   backgroundImage:
//                                       NetworkImage(item.avatarUrl ?? ''),
//                                 ),
//                               ],
//                             ),
//                             title: Text(
//                               item.name ?? '',
//                               style: TextStylesConstant.nunitoTitleBold,
//                             ),
//                             trailing: Text(
//                               item.exp.toString(),
//                               style: TextStylesConstant.nunitoTitleBold,
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           );
//         }
//       },
//     );
//   }
// }
