import 'package:flutter/material.dart';
import 'package:tubes_kelompok_7/pages/review.dart';
import 'chat.dart';
import 'cart.dart';

class ProductDetailPage extends StatelessWidget {
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        int quantity = 1;
        List<int> sizes = [36, 37, 38, 39, 40];
        int selectedSize = 38;

        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                top: 16,
                left: 16,
                right: 16,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/hiking_shoes.png',
                          width: 80,
                          height: 80,
                        ),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Rp100.000,-',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text('Stok: 115', style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text('Warna', style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.teal),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.all(4),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/hiking_shoes.png',
                            width: 40,
                            height: 40,
                          ),
                          SizedBox(width: 8),
                          Text('Krem'),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Text('Ukuran', style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      children: sizes.map((size) {
                        return ChoiceChip(
                          label: Text(size.toString()),
                          selected: selectedSize == size,
                          onSelected: (bool selected) {
                            setState(() {
                              selectedSize = size;
                            });
                          },
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Jumlah', style: TextStyle(fontWeight: FontWeight.bold)),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                if (quantity > 1) {
                                  setState(() {
                                    quantity--;
                                  });
                                }
                              },
                            ),
                            Text(quantity.toString(), style: TextStyle(fontSize: 16)),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  quantity++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.chat_outlined),
                            label: SizedBox.shrink(),
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => CartPage()),
                              );
                            },
                            icon: Icon(Icons.shopping_cart_outlined),
                            label: SizedBox.shrink(),
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          flex: 2,
                          child: ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                              padding: EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text('Sewa Sekarang'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.share_outlined),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              'assets/images/hiking_shoes.png',
              height: 200,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Text(
              'Rp100.000,-',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Sepatu gunung krem tali pink',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 20),
                SizedBox(width: 4),
                Text('5.0'),
                SizedBox(width: 4),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FeedbackPage()),
                    );
                  },
                  child: Text(
                    '1K review',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('Deskripsi', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Text(
                'Sepatu gunung dengan warna krem yang elegan dan tali pink yang mencolok ini dirancang untuk mendukung aktivitas outdoor Anda. Terbuat dari bahan yang tahan air dan sol anti-selip yang kokoh, sepatu ini memberikan kenyamanan dan keamanan di medan terjal. Cocok digunakan untuk hiking, camping, atau kegiatan alam lainnya. Dilengkapi dengan bantalan empuk di bagian dalam untuk kenyamanan maksimal.',
                style: TextStyle(color: Colors.black87),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey.shade300)),
          color: Colors.white,
        ),
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.chat_outlined),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatDetailPage()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart_outlined),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartPage()),
                );
              },
            ),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () => _showBottomSheet(context),
                child: Text('Sewa Sekarang'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
