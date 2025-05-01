import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();
  final List<String> allSuggestions = [
    'Sepatu Gunung Krem',
    'Topi Abu',
    'Tenda Camping',
    'Jaket Gunung',
    'Lampu Senter',
    'Alat Makan Portable',
    'Bundle Hemat'
  ];

  List<String> filteredSuggestions = [];

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final query = _controller.text.toLowerCase();
      setState(() {
        filteredSuggestions = allSuggestions
            .where((item) => item.toLowerCase().contains(query))
            .toList();
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildRecommendationItem({
    required String image,
    required String title,
    required String price,
  }) {
    return Expanded(
      child: Column(
        children: [
          Image.asset(image, height: 120),
          const SizedBox(height: 8),
          Text(title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          Text(price,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, color: Colors.orange, size: 16),
              const SizedBox(width: 4),
              Text("5.0  1K review", style: TextStyle(fontSize: 12)),
            ],
          ),
          const SizedBox(height: 4),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              shape: StadiumBorder(),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            ),
            child: Text("Add To Cart", style: TextStyle(fontSize: 12)),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 1,
        title: Container(
          height: 40,
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: 'Cari',
              prefixIcon: Icon(Icons.search),
              filled: true,
              fillColor: Colors.grey[200],
              contentPadding: EdgeInsets.symmetric(vertical: 0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text("Rekomendasi",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Row(
            children: [
              buildRecommendationItem(
                image: 'assets/images/shoes.png',
                title: 'Sepatu gunung krem',
                price: 'Rp1.000.000,-',
              ),
              const SizedBox(width: 16),
              buildRecommendationItem(
                image: 'assets/images/hat.png',
                title: 'Topi Abu',
                price: 'Rp1.000.000,-',
              ),
            ],
          ),
          const SizedBox(height: 24),
          if (filteredSuggestions.isNotEmpty) ...[
            Text("Hasil pencarian:",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ...filteredSuggestions.map((item) => ListTile(
                  title: Text(item),
                  leading: Icon(Icons.search),
                  onTap: () {
                    // aksi ketika suggestion diklik
                    print('User memilih: $item');
                  },
                )),
          ],
        ],
      ),
    );
  }
}
