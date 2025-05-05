import 'package:flutter/material.dart';
import 'checkout.dart';

import 'package:flutter/material.dart';
import 'checkout.dart';

class CartPage extends StatelessWidget {
  final List<CartItem> cartItems = [
    CartItem(
      name: 'Sepatu gunung krem',
      size: '42',
      color: 'Cream',
      price: 100000,
      image: 'assets/images/sepatu.png',
      selected: true,
    ),
    CartItem(
      name: 'Topi abu',
      size: 'M',
      color: 'hitam',
      price: 100000,
      image: 'assets/images/topi.png',
      selected: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    int subtotal = cartItems
        .where((item) => item.selected)
        .fold(0, (sum, item) => sum + item.price);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Keranjang', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.5,
        actions: [
          Row(
            children: [
              Checkbox(value: false, onChanged: (val) {}),
              const Text("Select All", style: TextStyle(color: Colors.black)),
              const SizedBox(width: 10),
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: cartItems.map((item) => CartItemWidget(item: item)).toList(),
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Subtotal', style: TextStyle(fontSize: 16)),
                      Text(
                        'Rp${subtotal.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.')},-',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2CA58D),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2CA58D),
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CheckoutPage()),
                    );
                  },
                  child: const Text('Checkout', style: TextStyle(fontSize: 16, color: Colors.black)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class CartItem {
  final String name;
  final String size;
  final String color;
  final int price;
  final String image;
  final bool selected;

  CartItem({
    required this.name,
    required this.size,
    required this.color,
    required this.price,
    required this.image,
    this.selected = false,
  });
}

class CartItemWidget extends StatelessWidget {
  final CartItem item;

  const CartItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: const BoxDecoration(
        color: Colors.white, // pindahkan ke sini
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(
            value: item.selected,
            onChanged: (_) {},
            fillColor: MaterialStateProperty.all(Color(0xFF2CA58D)),
          ),


          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset(item.image, width: 80, height: 80),
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name, style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Size: ${item.size}, Warna: ${item.color}'),
                SizedBox(height: 4),

                // Tanggal sewa
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Color(0xFFE6FBF6),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '12/12/2025 - 15/12/2025',
                        style: TextStyle(
                          color: Color(0xFF2CA58D),
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(width: 6),
                      Icon(Icons.calendar_today,
                          size: 14, color: Color(0xFF2CA58D)),
                    ],
                  ),
                ),
                SizedBox(height: 6),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rp${item.price.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.')},-',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.remove)),
                        Text('1'),
                        IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
