import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:greeve/models/api_responses/product_model.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/view/view_product/screens/product/widget/carousel/image_carousel.dart';
import 'package:greeve/view/view_product/screens/product/widget/carousel/image_viewer.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({super.key});

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  late CarouselController innerCarouselController;
  int innerCurrentPage = 0;

  @override
  void initState() {
    innerCarouselController = CarouselController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final product = Product(
      name: "Tumbler",
      description:
          "Tumbler Ramah Lingkungan adalah pilihan sempurna bagi mereka yang ingin mengurangi dampak lingkungan mereka.",
      price: 148500,
      image: ImageCarouselData.innerStyleImages[0],
      quantity: 1,
    );

    return Column(
      children: [
        SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          height: 170,
          width: 400,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned.fill(
                child: CarouselSlider(
                  carouselController: innerCarouselController,
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    viewportFraction: 0.8,
                    onPageChanged: (index, reason) {
                      setState(() {
                        innerCurrentPage = index;
                      });
                    },
                  ),
                  items: ImageCarouselData.innerStyleImages.map((imagePath) {
                    return Builder(
                      builder: (BuildContext context) {
                        return CustomImageViewer.show(
                          context: context,
                          assetPath: imagePath,
                          product: product,
                          fit: BoxFit.cover,
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            ImageCarouselData.innerStyleImages.length,
            (index) {
              bool isSelected = innerCurrentPage == index;
              return GestureDetector(
                onTap: () {
                  innerCarouselController.animateToPage(index);
                },
                child: AnimatedContainer(
                  width: isSelected ? 45 : 17,
                  height: 3,
                  margin: EdgeInsets.symmetric(horizontal: isSelected ? 6 : 3),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? ColorsConstant.primary500
                        : ColorsConstant.neutral600,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
