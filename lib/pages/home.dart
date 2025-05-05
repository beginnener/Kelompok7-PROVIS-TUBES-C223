import 'package:flutter/material.dart';
import 'package:tubes_kelompok_7/component/bottom_navbar.dart';
import 'package:tubes_kelompok_7/component/bottom_navbar_helper.dart';
import 'package:tubes_kelompok_7/pages/searchPage.dart';
import 'package:tubes_kelompok_7/pages/sepatu.dart';
import 'package:tubes_kelompok_7/pages/tenda.dart';
import 'package:tubes_kelompok_7/pages/tas.dart';
import 'package:tubes_kelompok_7/pages/promo.dart';
import 'package:tubes_kelompok_7/pages/kategori.dart';
import 'cart.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  
  final List<Map<String, dynamic>> categories = [
    {'label': 'Promo', 'imagePath': 'assets/images/logo-promo-home.png', 'color': Colors.redAccent},
    {'label': 'Tenda', 'imagePath': 'assets/images/logo-tenda-home.png', 'color': Colors.greenAccent},
    {'label': 'Sepatu', 'imagePath': 'assets/images/logo-sepatu-home.png', 'color': Colors.blueAccent},
    {'label': 'Tas', 'imagePath': 'assets/images/logo-tas-home.png', 'color': Colors.purpleAccent},
    {'label': 'Lainnya', 'imagePath': 'assets/images/logo-lainnya.png', 'color': Colors.tealAccent},
  ];

  final List<Map<String, dynamic>> popularItems = [
    {
      'name': 'Sepatu Gunung',
      'price': 'Rp100.000,-',
      'rating': 5.0,
      'reviews': 100,
      'imagePath': 'assets/images/hiking_shoes.png',
    },
    {
      'name': 'Senter',
      'price': 'Rp200.000,-',
      'rating': 5.0,
      'reviews': 10,
      'imagePath': 'assets/images/flashlight.jpg',
    },
  ];

  final List<Map<String, dynamic>> bundleItems = [
    {
      'name': 'Bundle Hemat',
      'price': 'Rp250.000,-',
      'imagePath': 'assets/images/hat.png',
      'rating': 5.0,
      'reviews': 50,
    },
    {
      'name': 'Bundle Lengkap',
      'price': 'Rp500.000,-',
      'imagePath': 'assets/images/hat.png',
      'rating': 4.5,
      'reviews': 70,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SearchPage()),
                      );
                    },
                    child: AbsorbPointer(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Cari...',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 0),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.shopping_cart_outlined),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartPage()),
                    );
                  },
                ),
                SizedBox(width: 12),
                Icon(Icons.notifications_outlined),
              ],
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/banner.png',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            
            SizedBox(height: 20),
            Text("Catalog", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal)),
            SizedBox(height: 12),
              GridView.count(
                crossAxisCount: 5,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                mainAxisSpacing: 16,
                crossAxisSpacing: 8,
                children: categories.map((cat) {
                  return GestureDetector(
                    onTap: () {
                      if (cat['label'] == 'Promo') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PromoPage()),
                        );
                      } else if (cat['label'] == 'Sepatu') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SepatuPage()),
                        );
                      } else if (cat['label'] == 'Tenda') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TendaPage()),
                        );
                      } else if (cat['label'] == 'Tas') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TasPage()),
                        );
                      } else if (cat['label'] == 'Lainnya') {
                        openKategoriSlider(context); // <-- BUKA SLIDER
                      }

                    },


                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AspectRatio(
                          aspectRatio: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: EdgeInsets.all(1),
                            child: Image.asset(
                              cat['imagePath'],
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),


            SizedBox(height: 20),
            Text("Popular", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal)),
            SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.56,
              children: popularItems.map((item) => _buildProductCard(item)).toList(),
            ),

            SizedBox(height: 20),
            Text("Bundle Sewa Camping", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal)),
            SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.56,
              children: bundleItems.map((item) => _buildProductCard(item)).toList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 0, 
        onTap: (index) {
          Bottomnavbarhelper.handleBottomNavTap(context, index, 0);
        },
      ),
    );
  }

  Widget _buildProductCard(Map<String, dynamic> item) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                  child: Image.asset(
                    item['imagePath'],
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item['name'], style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                  Text(item['price'], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  if (item.containsKey('rating'))
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        Text(
                          ' ${item['rating']} (${item['reviews']} review)',
                          style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                        ),
                      ],
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 80,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            'add to cart',
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
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
