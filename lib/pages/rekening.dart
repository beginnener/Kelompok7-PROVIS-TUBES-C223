import 'package:flutter/material.dart';

class RekeningPage extends StatelessWidget {
  const RekeningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if(Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              Navigator.pushReplacementNamed(context, '/');
            }
          },
        ),
        title: const Text('Rekening'),
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: const Text('Tambah Rekening'),
            trailing: const Icon(Icons.add),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Menambahkan Rekening'),
                ),
              );
            },
          ),
          Container(
            width: double.infinity,
            height: 24,
            color: Colors.grey[200],
            child:
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  'Rekening Saya',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ListTile(
            title: const Text('Rekening 1', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300)),
            subtitle: const Text('Bank ABC - 1234567890\na/n John Doe'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Menampilkan Daftar Rekening'),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Rekening 1', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300)),
            subtitle: const Text('Bank ABC - 1234567890\na/n John Doe'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Menampilkan Daftar Rekening'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}