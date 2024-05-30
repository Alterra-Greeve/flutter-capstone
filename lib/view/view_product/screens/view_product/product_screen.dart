import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greeve/global_widgets/global_bottom_navbar_widget.dart';
import 'package:greeve/models/api_responses/product_model.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/view_product/screens/view_product/widget/carousel/image_carousel.dart';
import 'package:greeve/view/view_product/screens/view_product/widget/carousel/image_viewer.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<String> labels = ['Dapur', 'R. Tamu', 'R. Keluarga', 'R. Kerja'];

  List<Map<String, dynamic>> cartItems = [
    {
      "name": "Tumbler",
      "description": "Botol air",
      "price": 148500,
      "image": "images/bottle_list.svg", // Update this path to your image
      "quantity": 1
    },
    {
      "name": "Greeve Container",
      "description": "Wadah makanan kaca",
      "price": 69900,
      "image": "images/greeveContainer.svg", // Update this path to your image
      "quantity": 1
    },
    {
      "name": "Tumbler",
      "description": "Botol air",
      "price": 148500,
      "image": "images/bottle_list.svg", // Update this path to your image
      "quantity": 1
    },
    {
      "name": "Greeve Container",
      "description": "Wadah makanan kaca",
      "price": 69900,
      "image": "images/greeveContainer.svg", // Update this path to your image
      "quantity": 1
    },
    {
      "name": "Tumbler",
      "description": "Botol air",
      "price": 148500,
      "image": "images/bottle_list.svg", // Update this path to your image
      "quantity": 1
    },
    {
      "name": "Greeve Container",
      "description": "Wadah makanan kaca",
      "price": 69900,
      "image": "images/greeveContainer.svg", // Update this path to your image
      "quantity": 1
    },
  ];

  List<Product> products = [
    Product(
      name: 'Tumbler',
      description: 'Botol air',
      price: 148500,
      image: 'images/bottle_list.svg',
      quantity: 1,
    ),
    Product(
      name: 'Greeve Container',
      description: 'Wadah makanan kaca',
      price: 69900,
      image: 'images/greeveContainer.svg',
      quantity: 1,
    ),
    // Tambahkan produk lainnya jika ada
  ];

  bool isDiscountActive = false;

  double getTotalPrice() {
    double total = 0;
    for (var item in cartItems) {
      total += item['price'] * item['quantity'];
    }
    if (isDiscountActive) {
      total -= 5; // Apply discount
    }
    return total;
  }

  late CarouselController innerCarouselController;
  int innerCurrentPage = 0;

  @override
  void initState() {
    innerCarouselController = CarouselController();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
            _innerBannerSlider(700, 200),
            Container(
              height: 60, // Ensure the container has a fixed height
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: labels.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 130,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          10), // Optional: for rounded corners
                    ),
                    child: Center(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          labels[index],
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 260, // Ensure the container has a fixed height
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 210,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          child: Image.asset(
                            products[index].image, // path to your image
                            height: 140,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                products[index].name,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                products[index].description,
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Rp ${products[index].price}',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                icon: Icon(Icons.shopping_cart),
                                onPressed: () {
                                  // Add to cart functionality
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Text(' Rekomendasi Produk'),
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
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: SvgPicture.asset(
                              item["image"],
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(5),
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
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text('Rp ${item["price"].toString()}',
                                      style: TextStylesConstant
                                          .nunitoButtonMedium),
                                ],
                              )
                            ],
                          ),
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
      bottomNavigationBar: GlobalBottomNavbar(currentIndex: 2),
    );
  }

  Widget _innerBannerSlider(double height, double width) {
    return Column(
      children: [
        /// Slider Style
        SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          height: 200,
          width: 370,
          child: Stack(
            alignment: Alignment.center,
            children: [
              /// Carousel Slider
              Positioned.fill(
                child: CarouselSlider(
                  carouselController: innerCarouselController,

                  /// It's options
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

                  /// Items
                  items: ImageCarouselData.innerStyleImages.map((imagePath) {
                    return Builder(
                      builder: (BuildContext context) {
                        /// Custom Image Viewer widget
                        return CustomImageViewer.Show(
                          context: context,
                          assetPath: imagePath,
                          fit: BoxFit.cover,
                        );
                      },
                    );
                  }).toList(),
                ),
              ),

              /// Indicators
              Positioned(
                bottom: height * .02,
                child: Row(
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
                          margin: EdgeInsets.symmetric(
                              horizontal: isSelected ? 6 : 3),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? ColorsConstant.primary500
                                : ColorsConstant.neutral600,
                            borderRadius: BorderRadius.circular(
                              40,
                            ),
                          ),
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
