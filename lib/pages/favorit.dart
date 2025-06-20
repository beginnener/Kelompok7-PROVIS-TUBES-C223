import 'package:flutter/material.dart';
import 'package:tubes_kelompok_7/component/bottom_navbar.dart';
import 'package:tubes_kelompok_7/component/bottom_navbar_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const FavoritesPage(),
    );
  }
}

String _selectedSortOption = 'Name';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final List<Map<String, dynamic>> _favoriteItems = [
    {
      'name': 'Sepatu krem tail pink',
      'price': 'Rp100.000,-',
      'imagePath': 'assets/images/hiking_shoes.png',
      'rating': '5.0',
      'reviews': '100'
    },
    {
      'name': 'Senter menyala',
      'price': 'Rp200.000,-',
      'imagePath': 'assets/images/flashlight.jpg',
      'rating': '5.0',
      'reviews': '10'
    },
    {
      'name': 'Trekking pole',
      'price': 'Rp1.000.000,-',
      'imagePath': 'assets/images/trekking_poles.jpg',
      'rating': '5.0',
      'reviews': '1.000'
    },
    {
      'name': 'Topi abu abu',
      'price': 'Rp10.000,-',
      'imagePath': 'assets/images/hat.png',
      'rating': '5.0',
      'reviews': '100'
    },
  ];

  void _addToCart(int index) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${_favoriteItems[index]['name']} added to cart'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            if(Navigator.canPop(context)){
              Navigator.pop(context);
            }
            else{
              Navigator.pushReplacementNamed(context, '/');
            }
          },
        ),
        title: const Text(
          'Favourite',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
                children: [
                const Text(
                  'Sort By:',
                  style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 8),
                DropdownButton<String>(
                  value: _selectedSortOption,
                  items: const [
                  DropdownMenuItem(
                    value: 'Name',
                    child: Text('Name'),
                  ),
                  DropdownMenuItem(
                    value: 'Price: Low to High',
                    child: Text('Price: Low to High'),
                  ),
                  DropdownMenuItem(
                    value: 'Price: High to Low',
                    child: Text('Price: High to Low'),
                  ),
                  DropdownMenuItem(
                    value: 'Rating',
                    child: Text('Rating'),
                  ),
                  ],
                  onChanged: (value) {
                  if (value != null) {
                    setState(() {
                    _selectedSortOption = value;
                    // _sortFavorites();
                    });
                  }
                  },
                  underline: Container(),
                  style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.52,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: _favoriteItems.length,
              itemBuilder: (context, index) {
                final item = _favoriteItems[index];
                return _buildProductCard(item, index);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar (
        currentIndex: 2, 
        onTap: (index) => Bottomnavbarhelper.handleBottomNavTap(context, index, 2)
      ),
    );
  }
}