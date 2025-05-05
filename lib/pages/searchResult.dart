import 'package:flutter/material.dart';

class SearchResultPage extends StatefulWidget {
  const SearchResultPage({super.key});

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  String? selectedSortValue;
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

  String getSortLabel() {
    switch (selectedSortValue) {
      case 'relevan':
        return 'Paling Relevan';
      case 'terbaru':
        return 'Terbaru';
      case 'terpopuler':
        return 'Terpopuler';
      case 'termurah':
        return 'Harga Terendah';
      case 'termahal':
        return 'Harga Tertinggi';
      default:
        return 'Sort';
    }
  }

  void sortItems(String value) {
    setState(() {
      selectedSortValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
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

            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Row(
                children: [
                  // Tombol Sort (disamakan gaya dengan tombol Filter)
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        side: BorderSide(color: Colors.grey.shade300),
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      onPressed: () {
                        showMenu(
                          context: context,
                          position: RelativeRect.fromLTRB(100, 100, 0, 0),
                          items: [
                            PopupMenuItem(value: 'relevan', child: Text('Paling Relevan')),
                            PopupMenuItem(value: 'terbaru', child: Text('Terbaru')),
                            PopupMenuItem(value: 'terpopuler', child: Text('Terpopuler')),
                            PopupMenuItem(value: 'termurah', child: Text('Harga Terendah')),
                            PopupMenuItem(value: 'termahal', child: Text('Harga Tertinggi')),
                          ],
                        ).then((value) {
                          if (value != null) {
                            sortItems(value);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Sort: $value')));
                          }
                        });
                      },
                      child: Text(getSortLabel()),
                    ),
                  ),
                  const SizedBox(width: 8),

                  // Tombol Filter
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        side: BorderSide(color: Colors.grey.shade300),
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      onPressed: () {
                        showGeneralDialog(
                          context: context,
                          barrierDismissible: true,
                          barrierLabel: "Filter",
                          transitionDuration: const Duration(milliseconds: 300),
                          pageBuilder: (_, __, ___) => const SizedBox.shrink(),
                          transitionBuilder: (context, animation, _, child) {
                            final slideAnimation = Tween<Offset>(
                              begin: const Offset(1, 0),
                              end: Offset.zero,
                            ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut));
                            return SlideTransition(
                              position: slideAnimation,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.85,
                                  color: Colors.white,
                                  child: const Scaffold(
                                    backgroundColor: Colors.white,
                                    body: SafeArea(child: FilterSheet()),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: const Text("Filter"),
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
                                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white),
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

class FilterSheet extends StatefulWidget {
  const FilterSheet({super.key});

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  int? selectedRating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20).copyWith(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Filter', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildInputBox('MIN'),
              const SizedBox(width: 16),
              _buildInputBox('MAX'),
            ],
          ),

          const SizedBox(height: 20),

          Center(
            child: Column(
              children: [
                Text('Penilaian', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  alignment: WrapAlignment.center,
                  children: [
                    for (var i = 5; i >= 1; i--)
                      OutlinedButton(onPressed: () {}, child: Text('Bintang $i ke atas')),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(5, (index) {
              final rating = 5 - index;
              final isSelected = selectedRating == rating;
              return ChoiceChip(
                label: Text('Bintang $rating ke atas'),
                selected: isSelected,
                onSelected: (_) {
                  setState(() {
                    selectedRating = isSelected ? null : rating;
                  });
                },
                selectedColor: Colors.teal.shade100,
                backgroundColor: Colors.grey.shade200,
                labelStyle: TextStyle(
                  color: isSelected ? Colors.teal.shade900 : Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              );
            }),
          ),
          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Hanya yang tersedia'),
              Switch(value: true, onChanged: (val) {}),
            ],
          ),
          const SizedBox(height: 10),

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
