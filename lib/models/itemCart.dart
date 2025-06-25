class Itemcart {
  final int id;
  final String name;
  final String size;
  final String color;
  final int price;
  final String image;
  final String tanggalSewa;
  final String tanggalSelesai;
  final int jumlah;
  final bool selected;

  Itemcart({
    required this.id,
    required this.name,
    required this.size,
    required this.color,
    required this.price,
    required this.image,
    required this.tanggalSewa,
    required this.tanggalSelesai,
    required this.jumlah,
    this.selected = true,
  });

  factory Itemcart.fromJson(Map<String, dynamic> json) {
    final item = json['item'];
    return Itemcart(
      id: json['id'],
      name: item['nama'],
      size: item['ukuran'].toString(),
      color: item['warna'] ?? '-',
      price: item['harga'],
      image: item['foto'],
      tanggalSewa: json['tanggal_sewa'],
      tanggalSelesai: json['tanggal_selesai'],
      jumlah: json['jumlah'],
    );
  }
}
