import 'package:flutter/material.dart';
import 'package:tubes_kelompok_7/component/bottomNavbar.dart';
import 'package:tubes_kelompok_7/component/bottomNavbarHelper.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 4, // Indeks halaman Profil
        onTap: (index) => Bottomnavbarhelper.handleBottomNavTap(context, index, 4),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.teal,
            padding: const EdgeInsets.only(top: 60, bottom: 20),
            width: double.infinity,
            child: Column(
              children: const [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey,
                ),
                SizedBox(height: 10),
                Text(
                  'Halo, Username',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Text(
                  'lalalanama@gmail.com',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildListTile(Icons.receipt, 'Transaksi'),
                buildListTile(Icons.settings, 'Pengaturan'),
                buildListTile(Icons.favorite_border, 'Favorit Saya'),
                buildListTile(Icons.chat_bubble_outline, 'Chat'),
                buildListTile(Icons.info_outline, 'Info Berbelanja'),
                buildListTile(Icons.lock_outline, 'Kebijakan Privasi'),
                const Divider(),
                ListTile(
                  title: const Text(
                    'Keluar akun',
                    style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    // aksi logout
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget buildListTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        // Navigasi ke halaman terkait
      },
    );
  }
}