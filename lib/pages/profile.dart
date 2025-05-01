import 'package:flutter/material.dart';
import 'package:tubes_kelompok_7/component/bottomNavbar.dart';
import 'package:tubes_kelompok_7/component/bottomNavbarHelper.dart';
import 'package:tubes_kelompok_7/pages/favorit.dart';
import 'package:tubes_kelompok_7/pages/settings.dart';
import 'package:tubes_kelompok_7/pages/voucher.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // cara pake modular bottom navbar 
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 4, // Indeks halaman Profil, angkanya liat dari urutan keberapa si icon (start dari 0)
        onTap: (index) => Bottomnavbarhelper.handleBottomNavTap(context, index, 4),
      ),
      body: Column(
        children: [
          // container untuk profile
          Container(
            color: Colors.teal,
            padding: const EdgeInsets.only(top: 60, bottom: 20),
            width: double.infinity,
            child: Column(
              children: const [
                CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage('https://via.placeholder.com/50'), // menggunakan placeholder image dari internet
                ),
                SizedBox(height: 10),
                Text(
                  'Halo, Username',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Text(
                  'Username@gmail.com',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildListTile(context, (context) => Placeholder(), Icons.receipt, 'Transaksi'),
                buildListTile(context, (context) => VoucherListScreen(), Icons.discount, 'Voucher Saya'),
                buildListTile(context, (context) => SettingsPage(), Icons.settings, 'Pengaturan'),
                buildListTile(context, (context) => FavoritesPage(), Icons.favorite_border, 'Favorit Saya'),
                buildListTile(context, (context) => Placeholder(), Icons.chat_bubble_outline, 'Chat'),
                buildListTile(context, (context) => Placeholder(), Icons.info_outline, 'Info Berbelanja'),
                buildListTile(context, (context) => Placeholder(), Icons.lock_outline, 'Kebijakan Privasi'),
                ListTile(
                  title: const Text(
                    'Keluar akun',
                    style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Logout')),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget buildListTile(BuildContext context, WidgetBuilder pagebuilder, IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: pagebuilder, // ganti dengan halaman yang sesuai
          ),
        );
      },
    );
  }
}