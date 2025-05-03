import 'package:flutter/material.dart';

class SepatuPage extends StatefulWidget {
  const SepatuPage({super.key});

  @override
  State<SepatuPage> createState() => _SepatuPageState();
}

class _SepatuPageState extends State<SepatuPage> {
  List<Map<String, dynamic>> items = [
    {
      'name': 'Sepatu Gunung A',
      'price': 'Rp150.000,-',
      'imagePath': 'assets/images/hiking_shoes.png',
      'rating': '4.8',
      'reviews': '25',
      'isFavorite': false,
    },
    {
      'name': 'Sepatu Gunung B',
      'price': 'Rp200.000,-',
      'imagePath': 'assets/images/hiking_shoes.png',
      'rating': '5.0',
      'reviews': '100',
      'isFavorite': false,
    },
    {
      'name': 'Sepatu Outdoor C',
      'price': 'Rp180.000,-',
      'imagePath': 'assets/images/hiking_shoes.png',
      'rating': '4.5',
      'reviews': '60',
      'isFavorite': false,
    },
  ];

  String _selectedSort = 'Paling Relevan';

  final List<String> _sortOptions = [
    'Paling Relevan',
    'Terbaru',
    'Terpopuler',
    'Harga Terendah',
    'Harga Tertinggi',
  ];

  void _applySort() {
    setState(() {
      if (_selectedSort == 'Harga Terendah') {
        items.sort((a, b) => _parsePrice(a['price']).compareTo(_parsePrice(b['price'])));
      } else if (_selectedSort == 'Harga Tertinggi') {
        items.sort((a, b) => _parsePrice(b['price']).compareTo(_parsePrice(a['price'])));
      } else if (_selectedSort == 'Terpopuler') {
        items.sort((a, b) => int.parse(b['reviews']).compareTo(int.parse(a['reviews'])));
      } else if (_selectedSort == 'Terbaru') {
        // Sort berdasarkan waktu jika ada data tanggal, placeholder
      } else {
        // Paling Relevan (default) - tidak diurutkan
      }
    });
  }

  int _parsePrice(String price) {
    return int.tryParse(price.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
  }

  void toggleFavorite(int index) {
    setState(() {
      items[index]['isFavorite'] = !items[index]['isFavorite'];
    });
  }

  void addToCart(String name) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$name ditambahkan ke keranjang')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sepatu'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Semua Produk",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    const Text("Sort by:", style: TextStyle(fontSize: 14)),
                    const SizedBox(width: 8),
                    DropdownButton<String>(
                      value: _selectedSort,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedSort = newValue!;
                          _applySort();
                        });
                      },
                      items: _sortOptions.map((sortOption) {
                        return DropdownMenuItem<String>(
                          value: sortOption,
                          child: Text(sortOption, style: const TextStyle(fontSize: 14)),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ],
            ),

          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.7,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
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
                        offset: const Offset(0, 1),
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
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                              child: Image.asset(
                                item['imagePath'],
                                height: double.infinity,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 5,
                              right: 5,
                              child: GestureDetector(
                                onTap: () => toggleFavorite(index),
                                child: Icon(
                                  item['isFavorite'] ? Icons.favorite : Icons.favorite_border,
                                  color: Colors.red,
                                  size: 22,
                                ),
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
                              Text(item['name'], style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                              Text(item['price'], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              Row(
                                children: [
                                  const Icon(Icons.star, color: Colors.amber, size: 16),
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
                                      onPressed: () => addToCart(item['name']),
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
              },
            ),
          ),
        ],
      ),
    );
  }
}
