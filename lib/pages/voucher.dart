import 'package:flutter/material.dart';
import 'voucher_bca.dart';
import 'voucher_bni.dart';
import 'voucher_bri.dart';
import 'voucher_mandiri.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Voucher List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: const AndroidDeviceFrame(
        child: VoucherListScreen(),
      ),
    );
  }
}

class AndroidDeviceFrame extends StatelessWidget {
  final Widget child;
  
  const AndroidDeviceFrame({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Android status bar
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            color: Colors.black,
            height: 24,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '9:41',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                Row(
                  children: const [
                    Icon(Icons.signal_cellular_4_bar, color: Colors.white, size: 14),
                    SizedBox(width: 4),
                    Icon(Icons.wifi, color: Colors.white, size: 14),
                    SizedBox(width: 4),
                    Icon(Icons.battery_full, color: Colors.white, size: 14),
                  ],
                ),
              ],
            ),
          ),
        ),
        // Content with padding to account for status bar
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: child,
        ),
      ],
    );
  }
}

class VoucherListScreen extends StatelessWidget {
  const VoucherListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample voucher data without bank identifiers
    final List<Map<String, String>> vouchers = [
      {
        'discount': 'Diskon 20% s/d Rp40.000,-',
        'validity': 'Valid hingga 27 April 2025',
      },
      {
        'discount': 'Diskon 20% s/d Rp40.000,-',
        'validity': 'Valid hingga 27 April 2025',
      },
      {
        'discount': 'Diskon 20% s/d Rp40.000,-',
        'validity': 'Valid hingga 27 April 2025',
      },
      {
        'discount': 'Diskon 20% s/d Rp40.000,-',
        'validity': 'Valid hingga 27 April 2025',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Handle back button press
          },
        ),
        title: const Text(
          'Voucher',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: vouchers.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _buildVoucherCard(
              context, 
              vouchers[index]['discount']!,
              vouchers[index]['validity']!,
              index
            ),
          );
        },
      ),
    );
  }

  Widget _buildVoucherCard(BuildContext context, String discount, String validity, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          // Gray top area
          Container(
            height: 70,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFFD9D9D9).withOpacity(0.2),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: const Center(
              child: Text(
                "VOUCHER",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xFFD9D9D9),
                ),
              ),
            ),
          ),
          // White bottom area with text and button
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          discount,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          validity,
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle navigation based on bank type
                      switch (index) {
                        case 0:
                          // BCA voucher
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const VoucherBCAScreen()),
                          );
                          break;
                        case 1:
                          // BNI voucher - navigates to BNI voucher detail
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const VoucherBNIScreen()),
                          );
                          break;
                        case 2:
                          // BRI voucher - navigates to BRI voucher detail
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const VoucherBRIScreen()),
                          );
                          break;
                        case 3:
                          // Mandiri voucher - navigates to Mandiri voucher detail
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const VoucherMANDIRIScreen()),
                          );
                          break;
                        default:
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Voucher ${index + 1} selected!'),
                              duration: const Duration(seconds: 1),
                            ),
                          );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF24A87C),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      minimumSize: const Size(60, 32),
                    ),
                    child: const Text(
                      'Pakai',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}