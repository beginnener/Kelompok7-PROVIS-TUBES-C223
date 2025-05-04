import 'package:flutter/material.dart';

class TopiPage extends StatefulWidget {
  const TopiPage({super.key});

  @override
  State<TopiPage> createState() => _TopiPageState();
}

class _TopiPageState extends State<TopiPage> {
  List<Map<String, dynamic>> items = [
    {
      'name': 'Topi A',
      'price': 'Rp50.000,-',
      'imagePath': 'assets/images/hiking_shoes.png',
      'rating': '4.6',
      'reviews': '14',
    },
    {
      'name': 'Topi B',
      'price': 'Rp70.000,-',
      'imagePath': 'assets/images/flashlight.png',
      'rating': '4.9',
      'reviews': '28',
    },
    {
      'name': 'Topi c',
      'price': 'Rp90.000,-',
      'imagePath': 'assets/images/hat.png',
      'rating': '4.8',
      'reviews': '36',
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
      }
    });
  }

  int _parsePrice(String price) {
    return int.tryParse(price.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
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
        title: const Text('Alat Makan'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                const Text("Sort By :", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.shade200,
                  ),
                  child: DropdownButton<String>(
                    value: _selectedSort,
                    underline: const SizedBox(),
                    onChanged: (newValue) {
                      _selectedSort = newValue!;
                      _applySort();
                    },
                    items: _sortOptions.map((sortOption) {
                      return DropdownMenuItem<String>(
                        value: sortOption,
                        child: Text(sortOption),
                      );
                    }).toList(),
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
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                          child: Image.asset(
                            item['imagePath'],
                            height: double.infinity,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
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
