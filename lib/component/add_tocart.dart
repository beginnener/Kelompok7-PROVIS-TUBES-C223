import 'package:flutter/material.dart';

void addToCart(String name, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('$name ditambahkan ke keranjang')),
  );
}