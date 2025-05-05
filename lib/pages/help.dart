import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

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
        title: const Text('Pusat Bantuan'),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: const Text(
              'Temukan jawaban dari pertanyaan umum dan panduan penggunaan aplikasi kami di bawah ini. Jika masih ada yang ingin ditanyakan, Anda bisa menghubungi kami melalui fitur chat langsung di pojok kanan bawah layar.',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Container(
            width: double.infinity,
            height: 24,
            color: Colors.grey[200],
            child: const Padding(
              padding: EdgeInsets.only(left: 24.0),
              child: Text(
                'FAQ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text( 
                "Bagaimana cara menyewa alat di aplikasi ini?",
                style: const TextStyle(fontSize: 16),
              ),
              trailing: const Icon(Icons.arrow_forward, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Placeholder(), // Ganti dengan halaman yang sesuai
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text( 
                "Bagaimana cara menyewa alat di aplikasi ini?",
                style: const TextStyle(fontSize: 16),
              ),
              trailing: const Icon(Icons.arrow_forward, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Placeholder(), // Ganti dengan halaman yang sesuai
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text( 
                "Bagaimana cara menyewa alat di aplikasi ini?",
                style: const TextStyle(fontSize: 16),
              ),
              trailing: const Icon(Icons.arrow_forward, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Placeholder(), // Ganti dengan halaman yang sesuai
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text( 
                "Bagaimana cara menyewa alat di aplikasi ini?",
                style: const TextStyle(fontSize: 16),
              ),
              trailing: const Icon(Icons.arrow_forward, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Placeholder(), // Ganti dengan halaman yang sesuai
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}