import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              Navigator.pushReplacementNamed(context, '/');
            }
          },
        ),
        title: const Text('Kebijakan Privasi'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:16.0, left: 32, right: 32, bottom: 16),
        child: SingleChildScrollView(
          child: Text(
            'Kami berkomitmen untuk menjaga dan melindungi privasi pelanggan dalam setiap transaksi penyewaan alat kemping secara online.' 
            'Informasi pribadi yang kami kumpulkan, seperti nama, alamat, nomor telepon, email, serta detail penyewaan, digunakan semata-mata untuk keperluan pemrosesan pesanan, pengiriman alat, pelacakan status penyewaan, dan komunikasi terkait layanan.' 
            '\n\nData pembayaran yang Anda berikan akan diproses secara aman melalui penyedia layanan pembayaran terpercaya dan tidak akan kami simpan di server kami. Selain itu, situs kami menggunakan cookies untuk meningkatkan pengalaman pengguna,' 
            'seperti menyimpan preferensi, menganalisis lalu lintas, dan menyesuaikan konten. '
            '\n\nKami tidak akan membagikan informasi pribadi Anda kepada pihak ketiga tanpa persetujuan, kecuali jika diwajibkan oleh hukum. Dengan menggunakan layanan kami, Anda menyetujui pengumpulan dan penggunaan data sesuai dengan kebijakan privasi ini.',
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}