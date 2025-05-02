import 'package:flutter/material.dart';

class SecurityAccountPage extends StatelessWidget {
  const SecurityAccountPage({super.key});

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
        title: const Text('Keamanan dan Akun'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'Nama Pengguna',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: 'Username',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  // Aksi ketika teks berubah
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'Bio',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: 'Hai saya suka berpetualang',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  // Aksi ketika teks berubah
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'No. Telepon',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: '08********7',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  // Aksi ketika teks berubah
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'Email',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: 'U******@gmail.com',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  // Aksi ketika teks berubah
                },
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Pastikan akun Anda aman dengan langkah-langkah berikut:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            ListTile(
              title: const Text('Ganti Kata Sandi'),
              subtitle: const Text('Ubah kata sandi akun Anda secara berkala.'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Kata sandi telah diubah')),
                );
              },
            ),
            ListTile(
              title: const Text('Periksa Aktivitas Akun'),
              subtitle: const Text('Lihat aktivitas terbaru di akun Anda.'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Aktivitas akun diperiksa')),
                );
              },
            ),
            ListTile(
              title: const Text('Riwayat Login'),
              subtitle: const Text('Lihat riwayat login akun Anda.'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Riwayat login diperiksa')),
                );
              },
            ),
            ListTile(
              title: const Text('Aktivasi Autentikasi Dua Faktor'),
              subtitle:
                  const Text('Tingkatkan keamanan dengan autentikasi dua faktor.'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Autentikasi dua faktor diaktifkan')),
                );
              },
            ),
            ListTile(
                title: const Text(
                'Hapus Akun',
                style: TextStyle(color: Colors.red),
                ),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Akun telah dihapus')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}