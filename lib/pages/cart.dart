import 'package:flutter/material.dart';

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
      name: 'Senter',
      size: 'M',
      color: 'hitam',
      price: 3000000,
      image: 'assets/images/senter.jpg',
      selected: true,
    ),
    CartItem(
      name: 'Trekking pole',
      size: 'M',
      color: 'hitam',
      price: 300000,
      image: 'assets/images/trekking_poles.jpg',
      selected: false,
    ),
    CartItem(
      name: 'Topi',
      size: 'M',
      color: 'hitam',
      price: 300000,
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
      appBar: AppBar(
        title: Text('Keranjang'),
        leading: BackButton(),
        actions: [
          Row(
            children: [
              Checkbox(value: false, onChanged: (val) {}),
              Text("Select All"),
              SizedBox(width: 10),
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
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Subtotal', style: TextStyle(fontSize: 16)),
                      Text(
                        'Rp${subtotal.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.')},-',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Checkout'),
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
          Checkbox(value: item.selected, onChanged: (_) {}),

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
