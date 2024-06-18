import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:greeve/models/api_responses/get_transaction_response_model.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/utils/status_color_utils.dart';
import 'package:greeve/view/transaction/widgets/empty_transaction_widget.dart';
import 'package:greeve/view_model/list_transaction_controller.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class TrasactionListWidget extends StatelessWidget {
  final List<Datum> transactions;
  final ListTransactionController controller;
  const TrasactionListWidget({
    Key? key,
    required this.transactions,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: 5,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade200,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Container(
                      width: double.infinity,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                );
              },
            )
          : transactions.isEmpty
              ? const EmptyTransactionWidget()
              : ListView.builder(
                  itemCount: transactions.length,
                  padding: const EdgeInsets.all(16),
                  itemBuilder: (context, index) {
                    final transaction = transactions[index];
                    final formattedPrice = NumberFormat.currency(
                      locale: 'id_ID',
                      symbol: 'Rp ',
                      decimalDigits: 0,
                    ).format(transaction.total);
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Container(
                        width: double.infinity,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: ColorsConstant.neutral50,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(4),
                                    child: CachedNetworkImage(
                                      imageUrl: transaction.productImage ?? "",
                                      width: 64,
                                      fit: BoxFit.cover,
                                      height: 64,
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 106,
                                        height: 20,
                                        child: Text(
                                          transaction.productName!,
                                          style: TextStylesConstant
                                              .nunitoSubtitle
                                              .copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      SizedBox(
                                        width: 106,
                                        height: 20,
                                        child: Text(
                                          formattedPrice,
                                          style: TextStylesConstant
                                              .nunitoSubtitle
                                              .copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    height: 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: getStatusBackgroundColor(
                                        transaction.status!,
                                      ),
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: Text(
                                          transaction.getDisplayStatus(),
                                          style: TextStylesConstant
                                              .nunitoFooterBold
                                              .copyWith(
                                            color: getStatusTextColor(
                                                transaction.status!),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (transaction.status?.toLowerCase() ==
                                      'pending')
                                    GestureDetector(
                                      onTap: () {
                                        controller.navigateToTransaction(
                                            transaction.snapUrl);
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 120,
                                        decoration: BoxDecoration(
                                          color: ColorsConstant.primary500,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Bayar Sekarang',
                                            style: TextStylesConstant
                                                .nunitoButtonLarge,
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
