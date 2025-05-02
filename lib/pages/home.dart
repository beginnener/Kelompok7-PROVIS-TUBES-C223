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
    {'label': 'Promo', 'icon': Icons.percent, 'color': Colors.redAccent},
    {'label': 'Tenda', 'icon': Icons.terrain, 'color': Colors.greenAccent},
    {'label': 'Sepatu', 'icon': Icons.hiking, 'color': Colors.blueAccent},
    {'label': 'Tas', 'icon': Icons.backpack, 'color': Colors.purpleAccent},
    {'label': 'Lainnya', 'icon': Icons.grid_view, 'color': Colors.tealAccent},
  ];

  final List<Map<String, dynamic>> popularItems = [
    {
      'name': 'Sepatu Gunung',
      'price': 'Rp100.000,-',
      'rating': 5.0,
      'reviews': 100,
      'image': 'https://via.placeholder.com/100x100?text=Sepatu',
    },
    {
      'name': 'Senter',
      'price': 'Rp200.000,-',
      'rating': 5.0,
      'reviews': 10,
      'image': 'https://via.placeholder.com/100x100?text=Senter',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Search and Icons Row
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

            // Promo Banner (Updated)
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
                    Image.network(
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
            // Catalog
            Text("Catalog", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: categories.map((cat) {
                return Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: cat['color'],
                      child: Icon(cat['icon'], color: Colors.white),
                    ),
                    SizedBox(height: 6),
                    Text(cat['label']),
                  ],
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            // Popular
            Text("Popular", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: popularItems.map((item) {
                  return Container(
                    width: 160,
                    margin: EdgeInsets.only(right: 16),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(item['image'], height: 80),
                        SizedBox(height: 8),
                        Text(item['name'], style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(item['price'], style: TextStyle(color: Colors.black)),
                        Row(
                          children: [
                            Icon(Icons.star, size: 16, color: Colors.orange),
                            SizedBox(width: 4),
                            Text("${item['rating']} (${item['reviews']} review)"),
                          ],
                        ),
                        SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            shape: StadiumBorder(),
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          ),
                          child: Text("Add To Cart", style: TextStyle(fontSize: 12)),
                        )
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20),
            // Bundle Sewa Section
            Text("Bundle Sewa Camping", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildBundleCard(
                    image: 'https://via.placeholder.com/100x100?text=Bundle+1',
                    title: 'Bundle Hemat',
                    price: 'Rp250.000,-',
                  ),
                  _buildBundleCard(
                    image: 'https://via.placeholder.com/100x100?text=Bundle+2',
                    title: 'Bundle Lengkap',
                    price: 'Rp500.000,-',
                  ),
                ],
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

  Widget _buildBundleCard({required String image, required String title, required String price}) {
    return Container(
      width: 160,
      margin: EdgeInsets.only(right: 16),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(image, height: 80),
          SizedBox(height: 8),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(price, style: TextStyle(color: Colors.black)),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              shape: StadiumBorder(),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            ),
            child: Text("Add To Cart", style: TextStyle(fontSize: 12)),
          ),
        ],
      ),
    );
  }
}
