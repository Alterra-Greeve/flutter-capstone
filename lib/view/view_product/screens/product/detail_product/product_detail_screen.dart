import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:greeve/models/api_responses/product_model.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/view_product/screens/cart/cart_screen.dart';
import 'package:greeve/view/view_product/screens/product/detail_product/widget/product_detail_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({Key? key, required this.product})
      : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final ProductDetailController controller =
        Get.put(ProductDetailController(widget.product));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Dapur', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartScreen(),
                ),
              );
            },
            icon: SvgPicture.asset(IconsConstant.bag),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Stack(
              children: [
                CarouselSlider(
                  items: controller.productImages
                      .map(
                        (item) => ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            item,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      )
                      .toList(),
                  options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    aspectRatio: 2.0,
                    viewportFraction: 1,
                    height: 250,
                    onPageChanged: (index, reason) {
                      controller.updateImageIndex(index);
                    },
                  ),
                ),
                Positioned(
                  top: 240,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Obx(() => AnimatedSmoothIndicator(
                          activeIndex: controller.currentImageIndex.value,
                          count: controller.productImages.length,
                          effect: const WormEffect(
                            activeDotColor: ColorsConstant.neutral900,
                            dotColor: ColorsConstant.neutral500,
                            dotHeight: 2,
                            dotWidth: 24,
                          ),
                        )),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 48,
                    width: 280,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(left: 16),
                      itemCount: controller.productImages.length,
                      itemBuilder: (context, index) {
                        var product = controller.productImages[index];
                        return GestureDetector(
                          onTap: () {
                            controller.updateImageIndex(index);
                            controller.updateRoundedImageIndex(index);
                          },
                          child: Obx(() => Container(
                                margin: const EdgeInsets.only(right: 8),
                                width: 49,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: controller.currentRoundedImageIndex
                                                .value ==
                                            index
                                        ? ColorsConstant.primary500
                                        : Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(25)),
                                  child: Image.asset(
                                    product,
                                    fit: BoxFit.cover,
                                    width: 48,
                                  ),
                                ),
                              )),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 2),
                    child: InkWell(
                      onTap: () {},
                      customBorder: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Ink(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          color: ColorsConstant.neutral100,
                        ),
                        width: 70,
                        height: 36,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(IconsConstant.coin),
                            const SizedBox(width: 4),
                            Text(
                              '+20',
                              style: TextStylesConstant.nunitoCaption,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tumbler',
                  style: TextStylesConstant.nunitoHeading4,
                ),
                Text('Rp 148.500', style: TextStylesConstant.nunitoHeading4),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: controller.dataProduct.first.entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${entry.key}:'),
                      Expanded(
                        child: Text(
                          entry.value,
                          textAlign: TextAlign.right,
                          style: const TextStyle(overflow: TextOverflow.ellipsis),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                """
Tumbler Ramah Lingkungan adalah pilihan sempurna bagi mereka yang ingin mengurangi dampak lingkungan mereka. Terbuat dari stainless steel 304 yang tahan lama dan aman untuk digunakan, tumbler ini dapat digunakan kembali berkali-kali, sehingga menghilangkan kebutuhan akan botol plastik sekali pakai.
""",
                textAlign: TextAlign.justify,
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Membantu',
                      style: TextStylesConstant.nunitoHeading5,
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: ColorsConstant.neutral200,
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.asset(IconsConstant.stickerOne)),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: ColorsConstant.neutral200,
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.asset(IconsConstant.stickerTwo)),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: ColorsConstant.neutral200,
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.asset(IconsConstant.stickerThree)),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: ColorsConstant.neutral200,
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.asset(IconsConstant.stickerFour)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ukuran',
                  style: TextStylesConstant.nunitoHeading5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: ['S', 'M', 'L', 'XL'].map((size) {
                    return Obx(() {
                      bool isSelected = size == controller.selectedSize.value;
                      return GestureDetector(
                        onTap: () => controller.selectSize(size),
                        child: Container(
                          height: 50,
                          width: 50,
                          margin:
                              const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? ColorsConstant.primary500
                                : Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: isSelected
                                  ? ColorsConstant.primary500
                                  : Colors.grey,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              size,
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    });
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CartScreen(),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: ColorsConstant.primary500,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    'Tambah ke keranjang',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
