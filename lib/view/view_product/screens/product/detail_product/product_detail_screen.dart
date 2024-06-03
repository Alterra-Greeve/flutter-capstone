import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greeve/models/api_responses/product_model.dart';  // Jika menggunakan SVG

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dapur'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Tambahkan ke keranjang
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  product.image,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              product.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Rp ${product.price}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            SizedBox(height: 8),
            Text(
              product.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Bahan: Stainless steel 304\n'
              'Kapasitas: 500 ml (17 oz)\n'
              'Dimensi: 23 cm x 7 cm (tinggi x diameter)\n'
              'Berat: 300 gram\n'
              'Warna: Silver, Biru, Hijau, Pink\n',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Tumbler Ramah Lingkungan adalah pilihan sempurna bagi mereka yang ingin mengurangi dampak lingkungan mereka. Terbuat dari stainless steel 304 yang tahan lama dan aman untuk digunakan, tumbler ini dapat digunakan kembali berulang kali, sehingga menghilangkan kebutuhan akan botol plastik sekali pakai.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Membantu',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset('images/icon1.svg', height: 40),
                SvgPicture.asset('images/icon2.svg', height: 40),
                SvgPicture.asset('images/icon3.svg', height: 40),
                SvgPicture.asset('images/icon4.svg', height: 40),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Ukuran',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildSizeButton(context, 'S'),
                _buildSizeButton(context, 'M'),
                _buildSizeButton(context, 'L'),
                _buildSizeButton(context, 'XL'),
              ],
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Tambahkan ke keranjang
                },
                child: Text('Tambah ke keranjang'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSizeButton(BuildContext context, String size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: OutlinedButton(
        onPressed: () {
          // Pilih ukuran
        },
        child: Text(size),
      ),
    );
  }
}

