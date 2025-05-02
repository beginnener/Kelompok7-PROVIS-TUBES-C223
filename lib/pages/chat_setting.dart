import 'package:flutter/material.dart';

class ChatSettingPage extends StatelessWidget {
  const ChatSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if(Navigator.canPop(context)){
              Navigator.pop(context);
            }
            else{
              Navigator.pushReplacementNamed(context, '/');
            }
          },
        ),
        title: const Text('Pengaturan Chat'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Notifikasi',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SwitchListTile(
              title: const Text('Aktifkan Notifikasi'),
              value: true,
              onChanged: (bool value) {},
            ),
            const SizedBox(height: 16),
            const Text(
              'Suara Notifikasi',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ListTile(
              title: const Text('Nada Dering'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}