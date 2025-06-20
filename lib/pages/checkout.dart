import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
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
                _OptionTile(
                  image: 'assets/images/JNE.png',
                  title: 'JNE Instan',
                  subtitle: 'Estimasi 1 Hari\nRp12.000,-',
                ),

                _SectionTitle("Metode Pembayaran"),
                _OptionTile(
                  image: 'assets/images/BCA.png',
                  title: 'BCA Virtual Account',
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
