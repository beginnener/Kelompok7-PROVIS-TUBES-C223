import 'package:flutter/material.dart';
import 'package:tubes_kelompok_7/component/bottom_navbar.dart';
import 'package:tubes_kelompok_7/component/bottom_navbar_helper.dart';

class TransaksiPage extends StatelessWidget {
  final List<Map<String, dynamic>> transaksiList = [
    {
      "nama": "Sepatu",
      "harga": "Rp100.000,-",
      "image": "assets/images/sepatu.png",
      "sisaHari": 3
    },
    {
      "nama": "Topi",
      "harga": "Rp100.000,-",
      "image": "assets/images/topi.png",
      "sisaHari": 3
    },
    {
      "nama": "Senter",
      "harga": "Rp100.000,-",
      "image": "assets/images/senter.jpg",
      "sisaHari": 1
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transaksi"),
        leading: Icon(Icons.arrow_back),
      ),
      body: Column(
        children: [
          // Filter Tabs
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                filterTab("Semua"),
                filterTab("Berjalan"),
                filterTab("Selesai"),
                filterTab("Batal"),
                filterTab("Belum Dikonfirmasi"),
              ],
            ),
          ),

          // List Transaksi
          Expanded(
            child: ListView.builder(
              itemCount: transaksiList.length,
              itemBuilder: (context, index) {
                final item = transaksiList[index];
                return transaksiItem(item);
              },
            ),
          ),
        ],
      ),

      // Bottom Nav Bar
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 1, 
        onTap: (index) {
          Bottomnavbarhelper.handleBottomNavTap(context, index, 1);
        },
      ),
    );
  }

  Widget filterTab(String label) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label),
    );
  }

  Widget transaksiItem(Map<String, dynamic> item) {
    Color badgeColor = item["sisaHari"] <= 1 ? Colors.red : Colors.teal;
    String badgeText = "Tersisa ${item["sisaHari"]} Hari Lagi";

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey[300]!, blurRadius: 4)],
      ),
      child: Row(
        children: [
          Image.network(item["image"], width: 60, height: 60),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item["nama"], style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Lihat Semua", style: TextStyle(fontSize: 12, color: Colors.grey)),
                SizedBox(height: 4),
                Text(item["harga"], style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 6),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: badgeColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    badgeText,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}