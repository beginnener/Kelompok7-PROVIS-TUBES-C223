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
      'image': 'https://via.placeholder.com/100x100?text=Tenda'
    },
    {
      'name': 'Sleeping Bag',
      'price': 'Rp80.000,-',
      'image': 'https://via.placeholder.com/100x100?text=Sleeping+Bag'
    },
    {
      'name': 'Kompor Portable',
      'price': 'Rp120.000,-',
      'image': 'https://via.placeholder.com/100x100?text=Kompor'
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
              padding: const EdgeInsets.only(top: 80), // agar tidak ketiban search bar
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
                        padding: EdgeInsets.all(1),
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
