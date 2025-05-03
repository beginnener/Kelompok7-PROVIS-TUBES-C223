import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  String searchText = '';

  List<String> suggestions = [
    'Tenda Gunung',
    'Sepatu Hiking',
    'Kompor Portable',
    'Sleeping Bag',
    'Senter LED',
    'Matras Camping',
  ];

  List<String> filteredSuggestions = [];

  final List<Map<String, dynamic>> categories = [
    {'label': 'Promo', 'image': 'assets/images/logo-promo.png'},
    {'label': 'Tenda', 'image': 'assets/images/logo-tenda.png'},
    {'label': 'Sepatu', 'image': 'assets/images/logo-sepatu.png'},
    {'label': 'Tas', 'image': 'assets/images/logo-tas.png'},
    {'label': 'Alat Makan', 'image': 'assets/images/logo-alat-makan.png'},
    {'label': 'Jaket', 'image': 'assets/images/logo-jaket.png'},
    {'label': 'Topi', 'image': 'assets/images/logo-topi.png'},
    {'label': 'Lampu', 'image': 'assets/images/logo-lampu.png'},
    {'label': 'Bundle', 'image': 'assets/images/logo-bundle.png'},
  ];

  final List<Map<String, dynamic>> recommendations = [
    {
      'name': 'Tenda Dome',
      'price': 'Rp150.000,-',
      'image': 'assets/images/hat.png'
    },
    {
      'name': 'Sleeping Bag',
      'price': 'Rp80.000,-',
      'image': 'assets/images/hat.png'
    },
    {
      'name': 'Kompor Portable',
      'price': 'Rp120.000,-',
      'image': 'assets/images/hat.png'
    },
  ];

  void _updateSuggestions(String value) {
    setState(() {
      searchText = value;
      filteredSuggestions = suggestions
          .where((item) => item.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  void _onSuggestionTap(String suggestion) {
    setState(() {
      _controller.text = suggestion;
      _updateSuggestions(suggestion);
      _focusNode.unfocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isSearching = _focusNode.hasFocus && searchText.isNotEmpty;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // 🔽 Konten utama (di bawah)
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  // Section: Rekomendasi
                  Text("Rekomendasi", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: recommendations.map((item) {
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
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Product Image
                              ClipRRect(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                                child: Image.network(
                                  item['image'],
                                  width: double.infinity,
                                  height: 168,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Product Name
                                    Text(
                                      item['name'],
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    // Product Price
                                    Text(
                                      item['price'],
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    // Add to Cart Button (setengah lebar, kanan)
                                    Row(
                                      children: [
                                        Spacer(),
                                        SizedBox(
                                          width: 70,
                                          height: 28,
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.teal,
                                              padding: EdgeInsets.zero,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(50),
                                              ),
                                              elevation: 0,
                                            ),
                                            child: Text(
                                              'Add',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 24),

                  // Section: Kategori
                  Text("Kategori", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 12),
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 4,
                    physics: NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    children: categories.map((cat) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: EdgeInsets.all(0),
                        child: Center(
                          child: Image.asset(cat['image'], height: 168),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),

            // 🔍 Search bar + overlay dropdown (di atas)
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      // ⬅️ Tombol Back
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(width: 8),

                      // 🔎 Search TextField
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          focusNode: _focusNode,
                          onChanged: _updateSuggestions,
                          decoration: InputDecoration(
                            hintText: 'Cari produk camping...',
                            prefixIcon: Icon(Icons.search),
                            suffixIcon: searchText.isNotEmpty
                                ? IconButton(
                                    icon: Icon(Icons.clear),
                                    onPressed: () {
                                      _controller.clear();
                                      _updateSuggestions('');
                                    },
                                  )
                                : null,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (isSearching)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Material(
                      elevation: 4,
                      borderRadius: BorderRadius.circular(8),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: 250,
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: filteredSuggestions.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(filteredSuggestions[index]),
                              onTap: () => _onSuggestionTap(filteredSuggestions[index]),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
