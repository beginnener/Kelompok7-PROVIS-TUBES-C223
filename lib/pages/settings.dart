import 'package:flutter/material.dart';
import 'package:tubes_kelompok_7/pages/address.dart';
import 'package:tubes_kelompok_7/pages/appinfo.dart';
import 'package:tubes_kelompok_7/pages/chat_setting.dart';
import 'package:tubes_kelompok_7/pages/help.dart';
import 'package:tubes_kelompok_7/pages/language.dart';
import 'package:tubes_kelompok_7/pages/notification_setting.dart';
import 'package:tubes_kelompok_7/pages/rekening.dart';
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
          buildListTile(context, (context) => RekeningPage(), 'Kartu/Rekening'),
          buildListTile(context, (context) => ChatSettingPage(), 'Pengaturan Chat'),
          buildListTile(context, (context) => NotificationSettingPage(), 'Pengaturan Notifikasi'),
          buildListTile(context, (context) => LanguagePage(), 'Bahasa'),
          buildListTile(context, (context) => HelpPage(), 'Pusat Bantuan'),
          buildListTile(context, (context) => AppInformationPage(), 'Informasi Aplikasi'),
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