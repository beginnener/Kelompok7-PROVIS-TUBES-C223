import 'package:flutter/material.dart';

class ShopInformationaPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: (){
            if(Navigator.canPop(context)){
              Navigator.pop(context);
            }
            else {
              Navigator.pushReplacementNamed(context, '/');
            }
          },
        ),
        title: const Text('Informasi Berbelanja'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0, left: 32.0, right: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Selamat datang di layanan penyewaan alat camping dan hiking online kami! Menyewa alat kini jadi lebih mudah dan praktis. Anda cukup memilih peralatan yang dibutuhkan, tentukan tanggal mulai dan tanggal pengembalian, lalu lanjutkan ke proses pembayaran.\n\n'
              'Harga yang ditampilkan adalah biaya sewa per hari. Kami menyediakan beberapa pilihan pengiriman:\n'
              '- Diantar langsung ke alamat Anda\n'
              '- Diambil sendiri di lokasi mitra\n'
              '- Menggunakan titik temu yang telah disepakati\n\n'
              'Harap pastikan barang dikembalikan tepat waktu dan dalam kondisi baik. Kami menerapkan kebijakan denda sebagai berikut:\n'
              '- Denda keterlambatan: Rp50.000 per hari keterlambatan (berlaku kelipatan).\n'
              '- Denda kerusakan: Sebesar harga barang saat ini jika terjadi kerusakan berat atau kehilangan.\n'
              '- Barang tidak kembali dalam 7 hari setelah jatuh tempo akan dianggap hilang, dan Anda akan dikenakan denda penuh sesuai harga barang.\n\n'
              'Semua barang kami periksa kelayakannya sebelum dikirim. Kami juga menyarankan Anda untuk memeriksa kondisi alat saat diterima. Bila ada kendala, segera hubungi tim kami melalui fitur chat langsung di aplikasi. Dengan menyewa, Anda bisa menikmati kegiatan alam bebas tanpa harus repot membeli atau menyimpan alat sendiri. Selamat berpetualang!',
              style: TextStyle(height: 1.5),
            )
          ]
        )
      ),
    );
  }
  
}