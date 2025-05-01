import 'package:flutter/material.dart';

class NotificationSettingPage extends StatelessWidget {
  const NotificationSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Pengaturan Notifikasi'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Pengaturan Notifikasi'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add your notification setting logic here
              },
              child: const Text('Simpan Pengaturan'),
            ),
          ],
        ),
      ),
    );
  }
}