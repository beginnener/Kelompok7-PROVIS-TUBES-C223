import 'package:flutter/material.dart';
import 'promo.dart';
import 'tenda.dart';
import 'sepatu.dart';
import 'tas.dart';
import 'alatmakan.dart';
import 'jaket.dart';
import 'topi.dart';
import 'lampu.dart';
import 'bundle.dart';


class KategoriPage extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {'label': 'Promo', 'image': 'assets/images/logo-promo.png'},
    {'label': 'Tenda', 'image': 'assets/images/logo-tenda.png'},
    {'label': 'Sepatu', 'image': 'assets/images/logo-sepatu.png'},
    {'label': 'Tas', 'image': 'assets/images/logo-tas.png'},
    {'label': 'Alat Makan', 'image': 'assets/images/logo-alat-makan.png'},
    {'label': 'Jaket', 'image': 'assets/images/logo-jaket.png'},
    {'label': 'Topi', 'image': 'assets/images/logo-topi.png'},
    {'label': 'Lampu', 'image': 'assets/images/logo-lampu.png'},
    {'label': 'Bundle', 'image': 'assets/images/logo-bundle.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kategori"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: categories.map((cat) {
            return GestureDetector(
              onTap: () {
                Widget destination;

                switch (cat['label']) {
                  case 'Promo':
                    destination = PromoPage();
                    break;
                  case 'Tenda':
                    destination = TendaPage();
                    break;
                  case 'Sepatu':
                    destination = SepatuPage();
                    break;
                  case 'Tas':
                    destination = TasPage();
                    break;
                  case 'Alat Makan':
                    destination = AlatMakanPage();
                    break;
                  case 'Jaket':
                    destination = JaketPage();
                    break;
                  case 'Topi':
                    destination = TopiPage();
                    break;
                  case 'Lampu':
                    destination = LampuPage();
                    break;
                  case 'Bundle':
                    destination = BundlePage();
                    break;
                  default:
                    destination = DummySliderPage(title: cat['label']);
                }

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => destination),
                );
              },

              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100, // warna default latar
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      cat['image'],
                      width: 140,
                      height: 140,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class DummySliderPage extends StatelessWidget {
  final String title;

  const DummySliderPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('Ini halaman kategori: $title'),
      ),
    );
  }
}
