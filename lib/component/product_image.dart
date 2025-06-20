import 'package:flutter/material.dart';

  // Helper method to build product image
Widget _buildProductImage(Map<String, dynamic> item) {
  try {
    // Try to load the image from assets
    return Image.asset(
      item['imagePath'],
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      errorBuilder: (context, error, stackTrace) {
        // If there's an error loading the image, show an icon instead
        return Center(
          child: Icon(
            getIconForProduct(item['name']),
            size: 60,
            color: Colors.grey.shade700,
          ),
        );
      },
    );
  } catch (e) {
    // Fallback to icon if any exception occurs
    return Center(
      child: Icon(
        getIconForProduct(item['name']),
        size: 60,
        color: Colors.grey.shade700,
      ),
    );
  }
}

  // Helper function to get appropriate icons for products
IconData getIconForProduct(String productName) {
  if (productName.toLowerCase().contains('sepatu')) {
    return Icons.hiking;
  } else if (productName.toLowerCase().contains('senter')) {
    return Icons.flashlight_on;
  } else if (productName.toLowerCase().contains('trekking')) {
    return Icons.nordic_walking;
  } else if (productName.toLowerCase().contains('topi')) {
    return Icons.face;
  }
  return Icons.shopping_bag;
}