int parsePrice(String price) {
  return int.tryParse(price.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
}

String formatPrice(int price) {
  return 'Rp${price.toStringAsFixed(0).replaceAllMapped(
    RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
    (Match m) => '${m[1]}.',
  )},-';
}