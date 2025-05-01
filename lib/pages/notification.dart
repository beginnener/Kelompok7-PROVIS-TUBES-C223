import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if(Navigator.canPop(context)) {
              Navigator.pop(context); // kembali ke halaman sebelumnya
            } else {
              Navigator.pushReplacementNamed(context, '/'); // ganti dengan route home
            }
          },
        ),
        title: const Text('Notifikasi'),
        backgroundColor: Colors.white,
        elevation: 1.0,
      ),
      body: ListView.builder(
        itemCount: 20, // jumlah notifikasi
        itemBuilder: (context, index) {
            return Column(
            children: [
              ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
                ),
              ),
              title: Text('Notifikasi ${index + 1}'),
              subtitle: const Text('Pesanan anda dengan kode xxxxxx telah dikonfirmasi'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // aksi ketika notifikasi ditekan
                ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Notifikasi ${index + 1} ditekan')),
                );
              },
              ),
              Divider(
              color: Colors.grey.shade300,
              thickness: 1,
              height: 1,
              ),
            ],
            );
        },
      ),
    );
  }
}