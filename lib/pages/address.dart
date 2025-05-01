import 'package:flutter/material.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

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
        title: const Text('Alamat Saya'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Nama Penerima',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: 'Nama Lengkap',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Nomor Telepon',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: '08123456789',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Alamat Lengkap',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: 'Jl. Raya No. 123, Jakarta',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Provinsi, Kota/Kabupaten, Kecamatan, Kode Pos',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: 
                'DKI Jakarta,\n'
                'Jakarta Selatan,\n'
                'Kebayoran Baru,\n'
                '12120',
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Catatan Tambahan (Opsional)',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: 'Contoh: Tingkat 2, Blok A',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
              child: Text(
                'Peta akan ditampilkan di sini (gunakan plugin seperti Google Maps atau MapBox)',
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              ),
            )
          ],
        ),
      ),
    );
  }
}