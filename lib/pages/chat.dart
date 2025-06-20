import 'package:flutter/material.dart';

class ChatDetailPage extends StatelessWidget {
  const ChatDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text('Pesan'),
        centerTitle: false,
      ),
      body: Column(
        children: [
          // Chat bubble dari user yang mengandung produk
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Produk Preview
                  Container(
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                          child: Image.asset(
                            'assets/images/hiking_shoes.png',
                            width: double.infinity,
                            height: null,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Sepatu gunung krem', style: TextStyle(fontWeight: FontWeight.w600)),
                              SizedBox(height: 4),
                              Text(
                                'Rp100.000,-',
                                style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 4),
                              Text('Halo kak, mau tanya dong. Ini sepatunya ready semua size?'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 4),
                  Text('10.00 AM', style: TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
            ),
          ),

          // Bubble balasan dari admin
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    constraints: BoxConstraints(maxWidth: 260),
                    decoration: BoxDecoration(
                      color: Colors.teal.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Halo juga kak! Iya, untuk saat ini masih ready ukuran 39, 42, 43. Mau ambil yang mana nih kak?',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text('10.02 AM', style: TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
            ),
          ),

          Spacer(),

          // Input Bar
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            color: Colors.white,
            child: Row(
              children: [
                Icon(Icons.add),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Tanya sesuatu...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.teal),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
