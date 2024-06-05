import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/view_product/screens/cart/widget/custom_switch.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Map<String, dynamic>> cartItems = [
    {
      "name": "Tumbler",
      "description": "Botol Air",
      "price": 148500,
      "image": ImagesConstant.bottleList, // Update this path to your image
      "quantity": 1
    },
    {
      "name": "Greeve Container",
      "description": "Wadah makanan kaca",
      "price": 69900,
      "image": ImagesConstant.greeveContainer, // Update this path to your image
      "quantity": 1
    },
  ];

  bool isDiscountActive = false;
  bool isVoucherActive = false;

  double voucherDiscount = 20000; // Example discount
  double coinDiscount = 5;

  double getTotalPrice() {
    double total = 0;
    for (var item in cartItems) {
      total += item['price'] * item['quantity'];
    }
    if (isVoucherActive) {
      total -= voucherDiscount;
    }
    if (isDiscountActive) {
      total -= coinDiscount;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keranjang'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(IconsConstant.bag),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 150),
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartItems[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: Container(
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 0.5,
                              blurRadius: 0.5,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                item["image"],
                                width: 80,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 13),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      item["name"],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                      ),
                                    ),
                                    Text(
                                      item["description"],
                                      style: TextStylesConstant.nunitoCaption,
                                    ),
                                    Text('Rp ${item["price"].toString()}',
                                        style: TextStylesConstant
                                            .nunitoButtonMedium),
                                  ],
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 35,
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          if (item["quantity"] > 1)
                                            item["quantity"]--;
                                        });
                                      },
                                      icon: Image.asset(IconsConstant.decrease),
                                    ),
                                    Text(
                                      item["quantity"]
                                          .toString()
                                          .padLeft(2, '0'),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          item["quantity"]++;
                                        });
                                      },
                                      icon: Image.asset(IconsConstant.increase),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 275,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: isVoucherActive
                        ? Image.asset(IconsConstant
                            .voucherOn) // Replace with appropriate icon
                        : Image.asset(IconsConstant.voucherOff),
                    title: isVoucherActive
                        ? Text('1 Voucher Greeve digunakan')
                        : Text('Gunakan Voucher Greeve'),
                    trailing: SvgPicture.asset(IconsConstant.arrowRight),
                    onTap: () {
                      setState(() {
                        isVoucherActive = !isVoucherActive;
                      });
                    },
                  ),
                  ListTile(
                    leading: Image.asset(IconsConstant.coin),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Tukarkan Koin'), Text('[-Rp 5]')],
                    ),
                    trailing: CustomAnimatedToggleSwitch(
                      value: isDiscountActive,
                      onChanged: (bool value) {
                        setState(() {
                          isDiscountActive = value;
                        });
                      },
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Total:'),
                    trailing: Text(
                      'Rp ${getTotalPrice().toString()}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle checkout button press
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: ColorsConstant.primary500,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Lanjut checkout',
                            style: TextStylesConstant.nunitoSubtitle4,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
