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

void openKategoriSlider(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.8,
        minChildSize: 0.4,
        maxChildSize: 0.95,
        builder: (context, scrollController) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: KategoriPage(scrollController: scrollController),
          );
        },
      );
    },
  );
}

class KategoriPage extends StatelessWidget {
  final ScrollController scrollController;

  KategoriPage({required this.scrollController});

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
    return Column(
      children: [
        // Drag handle (kayak Shopee)
        Container(
          width: 40,
          height: 5,
          margin: EdgeInsets.only(top: 8, bottom: 16),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
          ),
        ),

        // Grid Kategori
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: GridView.count(
              controller: scrollController,
              crossAxisCount: 4,
              mainAxisSpacing: 0,
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
                      color: Colors.grey.shade100,
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Image.asset(
                              cat['image'],
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
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
