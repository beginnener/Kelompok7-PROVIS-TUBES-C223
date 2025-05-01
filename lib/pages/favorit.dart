import 'package:flutter/material.dart';
import 'package:tubes_kelompok_7/component/bottomNavbar.dart';
import 'package:tubes_kelompok_7/component/bottomNavbarHelper.dart';
import 'package:tubes_kelompok_7/pages/home.dart';

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
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: const Text(
                    'Sort',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
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

  Widget _buildProductCard(Map<String, dynamic> item, int index) {
    return Container(
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
          // Product Image
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                  child: Container(
                    width: double.infinity,
                    color: Colors.grey.shade200,
                    child: _buildProductImage(item),
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 22,
                  ),
                ),
              ],
            ),
          ),
          // Product Details
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Product Name
                  Text(
                    item['name'],
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  // Product Price
                  Text(
                    item['price'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Rating
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      Text(
                        ' ${item['rating']} (${item['reviews']} review)',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                  // Add to Cart Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _addToCart(index),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Add To Cart',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
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

  // Helper method to build product image
  Widget _buildProductImage(Map<String, dynamic> item) {
    try {
      // Try to load the image from assets
      return Image.asset(
        item['imagePath'],
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        errorBuilder: (context, error, stackTrace) {
          // If there's an error loading the image, show an icon instead
          return Center(
            child: Icon(
              getIconForProduct(item['name']),
              size: 60,
              color: Colors.grey.shade700,
            ),
          );
        },
      );
    } catch (e) {
      // Fallback to icon if any exception occurs
      return Center(
        child: Icon(
          getIconForProduct(item['name']),
          size: 60,
          color: Colors.grey.shade700,
        ),
      );
    }
  }

  // Helper function to get appropriate icons for products
  IconData getIconForProduct(String productName) {
    if (productName.toLowerCase().contains('sepatu')) {
      return Icons.hiking;
    } else if (productName.toLowerCase().contains('senter')) {
      return Icons.flashlight_on;
    } else if (productName.toLowerCase().contains('trekking')) {
      return Icons.nordic_walking;
    } else if (productName.toLowerCase().contains('topi')) {
      return Icons.face;
    }
    return Icons.shopping_bag;
  }
}