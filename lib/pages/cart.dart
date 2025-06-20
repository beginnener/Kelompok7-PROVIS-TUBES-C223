import 'package:flutter/material.dart';
import 'checkout.dart';
import 'package:tubes_kelompok_7/models/cart_item.dart';
import 'package:tubes_kelompok_7/component/cart_item_card.dart';

class CartPage extends StatelessWidget {
  // buat list produk di cart
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
