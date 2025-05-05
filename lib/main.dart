import 'package:flutter/material.dart';
import 'package:tubes_kelompok_7/pages/chat.dart';
import 'package:tubes_kelompok_7/pages/profile.dart';
import 'package:tubes_kelompok_7/pages/transaksi.dart';
import 'pages/cart.dart'; 
import 'pages/home.dart'; 
import 'pages/detail_sepatu.dart'; 
import 'pages/checkout.dart'; 
import 'pages/notification.dart'; 
import 'pages/settings.dart'; 

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rental Outdoor App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Color(0xFF2CB288),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF2CB288), // Tombol seperti "Checkout"
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        textTheme: TextTheme(
          titleMedium: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(color: Colors.grey[800]),
          labelLarge: TextStyle(color: Color(0xFF2CB288)), // Untuk tanggal/hijau kecil
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Color(0xFF2CB288), // Aktif
          unselectedItemColor: Colors.grey,     // Tidak aktif
          selectedIconTheme: IconThemeData(size: 28),
          unselectedIconTheme: IconThemeData(size: 24),
        ),
      ),
      home: TombolPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TombolPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TUGAS 3 KELOMPOK 7'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 2 Tombol Horizontal
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    child: Text("Home"),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SettingsPage()),
                      );},
                    child: Text("Pengaturan"),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CartPage()),
                      );
                    },
                    child: Text("Keranjang"),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProductDetailPage()),
                      );},
                    child: Text("Detail Produk"),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChatDetailPage()),
                      );},
                    child: Text("Chat"),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CheckoutPage()),
                      );},
                    child: Text("Checkout"),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TransaksiPage()),
                      );},
                    child: Text("Transaksi"),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NotificationPage()),
                      );
                    },
                    child: Text("Notifikasi"),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfilePage()),
                      );
              },
              child: SizedBox(
                  width: double.infinity, child: Center(child: Text("Profile"))),
            ),

          ],
        ),
      ),
    );
  }
}
