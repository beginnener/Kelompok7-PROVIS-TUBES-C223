import 'package:flutter/material.dart';
import 'package:tubes_kelompok_7/component/bottom_navbar.dart';
import 'package:tubes_kelompok_7/component/bottom_navbar_helper.dart';
import 'searchPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

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
                Icon(Icons.shopping_cart_outlined),
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
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/banner.png',
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            SizedBox(height: 20),
            Text("Catalog", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal)),
            SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 5, // ✅ Bagi 5 item per baris
              shrinkWrap: true,  // ✅ Biar gridnya nge-fit di ListView
              physics: NeverScrollableScrollPhysics(), // ✅ Biar scrollnya tetap pake ListView, bukan Grid
              mainAxisSpacing: 16,
              crossAxisSpacing: 8,
              children: categories.map((cat) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AspectRatio(
                      aspectRatio: 1, // ✅ Biar kotaknya tetap persegi
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
                );
              }).toList(),
            ),

            SizedBox(height: 20),
            Text("Popular", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal)),
            SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: popularItems.map((item) => _buildProductCard(item)).toList(),
              ),
            ),

            SizedBox(height: 20),
            Text("Bundle Sewa Camping", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal)),
            SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: bundleItems.map((item) => _buildProductCard(item)).toList(),
              ),
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
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            child: Image.asset(
              item['imagePath'],
              height: 168,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item['name'], style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500), maxLines: 1, overflow: TextOverflow.ellipsis),
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
                SizedBox(height: 3),
                SizedBox(
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20), // more rounded
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2), // smaller button
                        minimumSize: Size(0, 28), // make sure it doesn't stretch
                      ),
                      child: const Text(
                        "Add To Cart",
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                  ),

                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
