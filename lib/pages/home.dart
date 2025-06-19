import 'package:flutter/material.dart';
import 'package:tubes_kelompok_7/component/bottom_navbar.dart';
import 'package:tubes_kelompok_7/component/bottom_navbar_helper.dart';
import 'package:tubes_kelompok_7/pages/notification.dart';
import 'package:tubes_kelompok_7/pages/searchPage.dart';
import 'package:tubes_kelompok_7/pages/sepatu.dart';
import 'package:tubes_kelompok_7/pages/tenda.dart';
import 'package:tubes_kelompok_7/pages/tas.dart';
import 'package:tubes_kelompok_7/pages/promo.dart';
import 'package:tubes_kelompok_7/pages/kategori.dart';
import 'package:tubes_kelompok_7/component/product_card.dart';
import 'cart.dart';
import 'package:tubes_kelompok_7/pages/detail_sepatu.dart';
import 'package:tubes_kelompok_7/models/item_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> categories = [
    {'label': 'Promo', 'imagePath': 'assets/images/logo-promo-home.png', 'color': Colors.redAccent},
    {'label': 'Tenda', 'imagePath': 'assets/images/logo-tenda-home.png', 'color': Colors.greenAccent},
    {'label': 'Sepatu', 'imagePath': 'assets/images/logo-sepatu-home.png', 'color': Colors.blueAccent},
    {'label': 'Tas', 'imagePath': 'assets/images/logo-tas-home.png', 'color': Colors.purpleAccent},
    {'label': 'Lainnya', 'imagePath': 'assets/images/logo-lainnya.png', 'color': Colors.tealAccent},
  ];

  List<ItemModel> items = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchItems();
  }

  Future<void> fetchItems() async {
  final response = await http.get(Uri.parse('http://192.168.137.1:8000/items'));

  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    setState(() {
      items = data.map((item) => ItemModel.fromJson(item)).toList();
      isLoading = false;
    });
  } else {
    print('Failed to load items');
    setState(() {
      isLoading = false;
    });
  }
}

  
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
                IconButton(
                  icon: Icon(Icons.notifications_outlined), 
                  onPressed: (){
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => NotificationPage()),
                    );
                  } 
                ),
              ],
            ),
            SizedBox(height: 20),
            Stack(
              children: [
                SizedBox(
                  height: 200,
                  child: PageView(
                    children: [
                      _buildBanner('assets/images/banner.png'),
                      _buildBanner('assets/images/banner.png'),
                      _buildBanner('assets/images/banner.png'),
                    ],
                  ),
                ),


              ],
            ),

            SizedBox(height: 20),
            Text("Catalog", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal)),
            SizedBox(height: 12),
            isLoading
            ? Center(child: CircularProgressIndicator())
            : GridView.count(
              crossAxisCount: 5,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              mainAxisSpacing: 16,
              crossAxisSpacing: 8,
              children: categories.map((cat) {
                return GestureDetector(
                  onTap: () {
                    if (cat['label'] == 'Promo') {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PromoPage()));
                    } else if (cat['label'] == 'Sepatu') {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SepatuPage()));
                    } else if (cat['label'] == 'Tenda') {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TendaPage()));
                    } else if (cat['label'] == 'Tas') {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TasPage()));
                    }else if (cat['label'] == 'Lainnya') {
                      openKategoriSlider(context);
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
            isLoading
            ? Center(child: CircularProgressIndicator())
            : GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.52,
              children: items.map((item) => ProductCard(item: item)).toList(),
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

  Widget _buildBanner(String imagePath) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4.0),
    child: Container(
      width: 354,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

}
