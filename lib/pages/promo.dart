import 'package:flutter/material.dart';
// import 'package:tubes_kelompok_7/component/add_tocart.dart';
import 'package:tubes_kelompok_7/component/showButtonSheet.dart';

class PromoPage extends StatefulWidget {
  const PromoPage({super.key});

  @override
  State<PromoPage> createState() => _PromoPageState();
}

class _PromoPageState extends State<PromoPage> {
  String _selectedSort = 'Paling Relevan';

  final List<String> _sortOptions = [
    'Paling Relevan',
    'Terbaru',
    'Terpopuler',
    'Harga Terendah',
    'Harga Tertinggi',
  ];

  final List<Map<String, dynamic>> items = [
    {
      'name': 'Sepatu gunung krem',
      'oldPrice': 'Rp1.000.000,-',
      'price': 'Rp700.000,-',
      'discount': '-30%',
      'imagePath': 'assets/images/hiking_shoes.png',
      'isFavorite': false,
    },
    {
      'name': 'Topi Abu',
      'oldPrice': 'Rp1.000.000,-',
      'price': 'Rp700.000,-',
      'discount': '-30%',
      'imagePath': 'assets/images/hat.png',
      'isFavorite': false,
    },
  ];

  void _toggleFavorite(int index) {
    setState(() {
      items[index]['isFavorite'] = !items[index]['isFavorite'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Promo'),
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
                      setState(() {
                        _selectedSort = newValue!;
                      });
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
                childAspectRatio: 0.56,
              ),
              itemCount: items.length * 2, // just duplicate to fill screen
              itemBuilder: (context, index) {
                final item = items[index % items.length];
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 4,
                        spreadRadius: 1,
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                              child: Image.asset(
                                item['imagePath'],
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item['name'], style: const TextStyle(fontWeight: FontWeight.w500)),
                              Row(
                                children: [
                                  Text(item['discount'], style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                                  const SizedBox(width: 4),
                                  Text(
                                    item['oldPrice'],
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                item['price'],
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  const Spacer(),
                                  ElevatedButton(
                                    onPressed: () {
                                      Showbuttonsheet.show(context, 1);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.teal,
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    child: const Text("Add To Cart", style: TextStyle(fontSize: 12)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
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
