import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/transaction/widgets/transaction_list_widget.dart';
import 'package:greeve/view_model/list_transaction_controller.dart';

class ListTransactionScreen extends StatelessWidget {
  const ListTransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ListTransactionController controller =
        Get.put(ListTransactionController());
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 64,
          title: Text(
            'Riwayat Pembayaran',
            style: TextStylesConstant.nunitoButtonSemibold,
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(IconsConstant.arrow),
          ),
          bottom: TabBar(
            labelStyle: TextStylesConstant.nunitoButtonSemibold.copyWith(
              color: ColorsConstant.neutral900,
            ),
            unselectedLabelStyle:
                TextStylesConstant.nunitoButtonSemibold.copyWith(
              color: ColorsConstant.neutral400,
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: const [
              Tab(text: 'Selesai'),
              Tab(text: 'Belum Bayar'),
              Tab(text: 'Dibatalkan'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TrasactionListWidget(
              transactions: controller.successTransactionList,
              controller: controller,
            ),
            TrasactionListWidget(
              transactions: controller.pendingTransactionList,
              controller: controller,
            ),
            TrasactionListWidget(
              transactions: controller.failedTransactionList,
              controller: controller,
            ),
          ],
        ),
      ),
    );
  }
}
