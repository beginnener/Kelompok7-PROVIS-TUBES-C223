import 'package:flutter/material.dart';

class SearchResultPage extends StatefulWidget {
  const SearchResultPage({super.key});

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class FilterSheet extends StatelessWidget {
  const FilterSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20).copyWith(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Filter', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),

          // Batas Harga
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildInputBox('MIN'),
              _buildInputBox('MAX'),
            ],
          ),
          const SizedBox(height: 20),

          // Penilaian
          Align(alignment: Alignment.centerLeft, child: Text('Penilaian', style: TextStyle(fontWeight: FontWeight.bold))),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (var i = 5; i >= 1; i--)
                OutlinedButton(onPressed: () {}, child: Text('Bintang $i ke atas')),
            ],
          ),
          const SizedBox(height: 20),

          // Stok
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Hanya yang tersedia'),
              Switch(value: true, onChanged: (val) {}),
            ],
          ),
          const SizedBox(height: 10),

          // Tombol Apply
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Terapkan'),
          ),
        ],
      ),
    );
  }

  Widget _buildInputBox(String label) {
    return SizedBox(
      width: 140,
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}


class _SearchResultPageState extends State<SearchResultPage> {
  final TextEditingController _searchController = TextEditingController(text: "Sepatu");

  List<Map<String, dynamic>> items = [
    {
      'name': 'Sepatu Gunung A',
      'price': 'Rp150.000,-',
      'imagePath': 'assets/images/hiking_shoes.png',
      'rating': '4.8',
      'reviews': '25',
    },
    {
      'name': 'Sepatu Gunung B',
      'price': 'Rp200.000,-',
      'imagePath': 'assets/images/hiking_shoes.png',
      'rating': '5.0',
      'reviews': '100',
    },
    {
      'name': 'Sepatu Outdoor C',
      'price': 'Rp180.000,-',
      'imagePath': 'assets/images/hiking_shoes.png',
      'rating': '4.5',
      'reviews': '60',
    },
  ];

  void addToCart(String name) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$name ditambahkan ke keranjang')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // 🔍 Search Bar + Back
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          const Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'nama produk',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

            ),

            // 🔘 Sort & Filter Buttons
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => showMenu(
                        context: context,
                        position: const RelativeRect.fromLTRB(100, 120, 100, 100),
                        items: [
                          const PopupMenuItem(value: 'relevan', child: Text('Paling Relevan')),
                          const PopupMenuItem(value: 'terbaru', child: Text('Terbaru')),
                          const PopupMenuItem(value: 'terpopuler', child: Text('Terpopuler')),
                          const PopupMenuItem(value: 'termurah', child: Text('Harga Terendah')),
                          const PopupMenuItem(value: 'termahal', child: Text('Harga Tertinggi')),
                        ],
                      ).then((value) {
                        if (value != null) {
                          // Lakukan sorting sesuai value
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Sort: $value')));
                        }
                      }),
                      child: const Text("Sort by"),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                        ),
                        builder: (context) => const FilterSheet(),
                      ),

                      child: const Text("Filter"),
                    ),
                  ),
                ],
              ),
            ),

            // 🛒 Product Grid
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
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 🖼️ Gambar Produk
                        Expanded(
                          flex: 3,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                            child: Image.asset(
                              item['imagePath'],
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        // 📦 Info Produk
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
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
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: SizedBox(
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
                                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
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
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
