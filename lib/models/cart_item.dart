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