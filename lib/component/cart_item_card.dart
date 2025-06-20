import 'package:flutter/material.dart';
import 'package:tubes_kelompok_7/models/cart.dart';

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