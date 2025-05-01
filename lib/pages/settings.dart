import 'package:flutter/material.dart';
import 'package:tubes_kelompok_7/pages/notification.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan'),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        children: [
          buildListTile(context, (context) => Placeholder(), Icons.language, 'Bahasa'),
          buildListTile(context, (context) => NotificationPage(), Icons.notifications, 'Notifikasi'),
          buildListTile(context, (context) => Placeholder(), Icons.security, 'Keamanan'),
          buildListTile(context, (context) => Placeholder(), Icons.privacy_tip, 'Privasi'),
          buildListTile(context, (context) => Placeholder(), Icons.help, 'Bantuan dan Dukungan'),
          buildListTile(context, (context) => Placeholder(), Icons.info, 'Tentang Aplikasi'),
        ],
      ),
    );
  }

  static Widget buildListTile(BuildContext context, WidgetBuilder pagebuilder, icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        print('Navigating to $pagebuilder page...');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: pagebuilder, // Ganti dengan halaman yang sesuai
          ),
        );
      },
    );
  }

}