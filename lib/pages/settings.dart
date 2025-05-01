import 'package:flutter/material.dart';
import 'package:tubes_kelompok_7/pages/address.dart';
import 'package:tubes_kelompok_7/pages/security_account.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context); // kembali ke halaman sebelumnya
            } else {
              Navigator.pushReplacementNamed(context, '/'); // ganti dengan route home
            }
          },
        ),
        title: const Text('Pengaturan'),
        backgroundColor: Colors.white,
        elevation: 1.0,
      ),
      body: ListView(
        children: [
          buildListTile(context, (context) => SecurityAccountPage(), 'Keamanan dan Akun'),
          buildListTile(context, (context) => AddressPage(), 'Alamat Saya'),
          buildListTile(context, (context) => Placeholder(), 'Kartu/Rekening'),
          buildListTile(context, (context) => Placeholder(), 'Pengaturan Chat'),
          buildListTile(context, (context) => Placeholder(), 'Pengaturan Notifikasi'),
          buildListTile(context, (context) => Placeholder(), 'Bahasa'),
          buildListTile(context, (context) => Placeholder(), 'Pusat Bantuan'),
          buildListTile(context, (context) => Placeholder(), 'Informasi Aplikasi'),
          ListTile(
            title: const Text(
              'Keluar akun',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              // ganti dengan aksi logout
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Logout')),
              );
            },
          ),
        ],
      ),
    );
  }

  static Widget buildListTile(BuildContext context, WidgetBuilder pagebuilder, String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: const Icon(Icons.arrow_forward, size: 16),
        onTap: () {
          print('Navigating to $pagebuilder page...');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: pagebuilder, // Ganti dengan halaman yang sesuai
            ),
          );
        },
      ),
    );
  }

}