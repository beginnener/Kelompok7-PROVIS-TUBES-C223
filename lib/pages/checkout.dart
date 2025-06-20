import 'package:flutter/material.dart';
import 'package:tubes_kelompok_7/models/ekspedisi_model.dart';

final List<Map<String, dynamic>> expedisiHarga = [
    {
      'id':'1',
      'name': 'JNE',
      'price': '19000',
    },
    {
      'id':'2',
      'name': 'J&T EXPRESS',
      'price': '19000',
    },
    {
      'id':'3',
      'name': 'Ninja EXPRESS',
      'price': '18000',
    },
  ];

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

final List<Map<String, dynamic>> metodeBayar = [
    {
      'id':'1',
      'name': 'BCA Virtual Account',
      'picture': 'https://shl.co.id/wp-content/uploads/2022/11/lg-bca.png',
    },
    {
      'id':'2',
      'name': 'QRIS',
      'picture': 'https://cdn.rri.co.id/berita/Lhokseumawe/o/1746967360474-InShot_20250511_192805646/bw4yol2ts5teq5t.jpeg',
    },
    {
      'id':'3',
      'name': 'Cash',
      'picture': 'https://i.pinimg.com/474x/12/8a/66/128a66a69ea1dc8871697b8ca8012799.jpg',
    },
  ];

class _CheckoutPageState extends State<CheckoutPage> {
  Map<String, dynamic>? selectedExpedisi;
  Map<String, dynamic>? selectedMetodeBayar;


  void _showMetodeBayarDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Pilih Metode Pembayaran'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: metodeBayar.map((metode) {
            return ListTile(
              leading: Image.network(metode['picture'], width: 40, height: 40),
              title: Text(metode['name']),
              onTap: () {
                setState(() {
                  selectedMetodeBayar = metode;
                });
                Navigator.pop(context);
              },
            );
          }).toList(),
        ),
      );
    },
  );
}


  void _showExpedisiDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Pilih Ekspedisi'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: expedisiHarga.map((exp) {
              return ListTile(
                title: Text(exp['name']),
                subtitle: Text('Rp${exp['price']}'),
                onTap: () {
                  setState(() {
                    selectedExpedisi = exp;
                  });
                  Navigator.pop(context);
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        title: Text('Checkout', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: false,
        leading: BackButton(),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                _SectionTitle("Alamat"),
                _AddressCard(),

                _ProductItem(
                  image: 'assets/images/topi.png',
                  name: 'Topi abu',
                  size: '42',
                  color: 'Merah Muda',
                  price: 100000,
                ),
                _ProductItem(
                  image: 'assets/images/sepatu.png',
                  name: 'Sepatu gunung krem',
                  size: '42',
                  color: 'Merah Muda',
                  price: 100000,
                ),

                _SectionTitle("Metode Pengiriman"),
                GestureDetector(
                  onTap: () => _showExpedisiDialog(context),
                  child: _OptionTile(
                    icon: Icons.local_shipping,
                    title: selectedExpedisi?['name'] ?? 'Pilih Ekspedisi',
                    subtitle: selectedExpedisi != null
                        ? 'Rp${selectedExpedisi!['price']}'
                        : 'Klik untuk memilih jasa pengiriman',
                  ),
                ),

                _SectionTitle("Metode Pembayaran"),
                GestureDetector(
                  onTap: () => _showMetodeBayarDialog(context),
                  child: _OptionTile(
                    image: null,
                    title: selectedMetodeBayar?['name'] ?? 'Pilih Metode Pembayaran',
                    subtitle: selectedMetodeBayar != null
                        ? 'Klik untuk mengganti metode'
                        : 'Klik untuk memilih metode pembayaran',
                  ),
                ),

                _OptionTile(
                  icon: Icons.percent,
                  title: 'Promo',
                  iconColor: Colors.red,
                ),
              ],
            ),
          ),
          _BottomBar(),
        ],
      ),
    );
  }
}


// --------------------------
// COMPONENTS
// --------------------------

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Text(title,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
    );
  }
}

class _AddressCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('UPI (Nama)',
                    style: TextStyle(
                        color: Colors.teal, fontWeight: FontWeight.bold)),
                Text(
                  'Universitas di Bandung, Jawa Barat Universitas di Bandung, Jawa Barat',
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }
}

class _ProductItem extends StatelessWidget {
  final String image, name, size, color;
  final int price;

  const _ProductItem({
    required this.image,
    required this.name,
    required this.size,
    required this.color,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 1),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Image.asset(image, width: 80, height: 80, fit: BoxFit.cover),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text('Size : $size, Warna : $color'),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.calendar_month,
                        size: 16, color: Colors.teal),
                    const SizedBox(width: 4),
                    Text('12/12/2025 - 15/12/2025',
                        style: TextStyle(color: Colors.teal)),
                  ],
                ),
                const SizedBox(height: 4),
                Text('Rp${price.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.')},-',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text('1 pcs'),
        ],
      ),
    );
  }
}

class _OptionTile extends StatelessWidget {
  final String? image;
  final String title;
  final String? subtitle;
  final IconData? icon;
  final Color? iconColor;

  const _OptionTile({
    this.image,
    required this.title,
    this.subtitle,
    this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          if (image != null)
            Image.asset(image!, width: 40)
          else if (icon != null)
            Icon(icon, color: iconColor ?? Colors.black),

          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                if (subtitle != null)
                  Text(subtitle!, style: TextStyle(color: Colors.black54)),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding:
          const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Subtotal'),
                Text('Rp200.000,-',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                        fontSize: 18)),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              padding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            ),
           child: Text(
            'Bayar',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          )
        ],
      ),
    );
  }
}
