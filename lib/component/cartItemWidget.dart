import 'package:flutter/material.dart';
import 'package:tubes_kelompok_7/models/itemCart.dart';

Widget cartItemWidget(Itemcart item) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    decoration: BoxDecoration(
      color: Color(0xFFE6FBF6),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${item.tanggalSewa} - ${item.tanggalSelesai}',
              style: TextStyle(
                color: Color(0xFF2CA58D),
                fontSize: 12,
              ),
            ),
            SizedBox(width: 6),
            Icon(Icons.calendar_today, size: 14, color: Color(0xFF2CA58D)),
          ],
        ),
        const SizedBox(height: 8), // spacing antar bagian
        Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.remove)),
            Text(item.jumlah.toString()),
            IconButton(onPressed: () {}, icon: Icon(Icons.add)),
          ],
        )
      ],
    ),
  );
}