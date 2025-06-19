class ItemModel {
  final int id;
  final String name;
  final int price;
  final String imagePath;
  final int promo;

  ItemModel({
    required this.id,
    required this.name,
    required this.price,
    required this.imagePath,
    required this.promo,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'],
      name: json['nama'],
      price: json['harga'],
      imagePath: json['foto'],
      promo: json['promo'],
    );
  }
}
