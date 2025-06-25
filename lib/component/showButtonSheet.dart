import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Showbuttonsheet {
  static void show(BuildContext context, int id_item) async {
    // Ambil data terlebih dahulu secara async
    final response = await http.get(Uri.parse('http://192.168.137.1:8000/detail_pilihan/$id_item'));
    final detail = await http.get(Uri.parse('http://192.168.137.1:8000/items/$id_item'));

    if (response.statusCode != 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Gagal memuat data pilihan')),
      );
      return;
    }

    final data = jsonDecode(response.body);
    final detail_item = jsonDecode(detail.body);
    final pilihan = data[0]; // karena isinya List<Map>

    // Lanjut tampilkan bottom sheet setelah data siap
    int quantity = 1;
    int harga = detail_item['harga'];
    int totalPrice = harga;
    List<int> sizes = []; // default fallback
    int selectedSize = 38;
    DateTime? startDate;
    DateTime? endDate;

    void updateTotalPrice() {
      if (startDate != null && endDate != null) {
        final days = endDate!.difference(startDate!).inDays;
        if (days > 0) {
          totalPrice = harga * quantity * days;
        } else {
          totalPrice = harga * quantity;
        }
      } else {
        totalPrice = harga * quantity;
      }
    }

    if (pilihan['list'] != null && pilihan['list'] is List) {
      sizes = (pilihan['list'] as List) 
          .map((e) => int.tryParse(e.toString()) ?? 0)
          .where((e) => e > 0)
          .toList();
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                top: 16,
                left: 16,
                right: 16,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.network(
                          detail_item['foto'],
                          width: 80,
                          height: 80,
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total: Rp$totalPrice',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text('Stok: 115', style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    if (sizes.isNotEmpty)...[
                      const Text('Ukuran', style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                    ],
                    Wrap(
                      spacing: 8,
                      children: sizes.map((size) {
                        return ChoiceChip(
                          label: Text(size.toString()),
                          selected: selectedSize == size,
                          onSelected: (bool selected) {
                            setState(() {
                              selectedSize = size;
                            });
                          },
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 16),
                    const Text('Tanggal Sewa', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () async {
                        final picked = await showDatePicker(
                          context: context,
                          initialDate: startDate ?? DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(const Duration(days: 365)),
                        );
                        if (picked != null) {
                          setState(() {
                            startDate = picked;
                            if (endDate != null && picked.isAfter(endDate!)) {
                              endDate = null;
                            }
                            updateTotalPrice();
                          });
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          startDate != null
                              ? '${startDate!.day}/${startDate!.month}/${startDate!.year}'
                              : 'Pilih tanggal sewa',
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),
                    const Text('Tanggal Kembali', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () async {
                        final picked = await showDatePicker(
                          context: context,
                          initialDate: endDate ?? (startDate ?? DateTime.now()).add(const Duration(days: 1)),
                          firstDate: (startDate ?? DateTime.now()).add(const Duration(days: 1)),
                          lastDate: DateTime.now().add(const Duration(days: 365)),
                        );
                        if (picked != null) {
                          setState(() {
                            endDate = picked;
                            updateTotalPrice();
                          });
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          endDate != null
                              ? '${endDate!.day}/${endDate!.month}/${endDate!.year}'
                              : 'Pilih tanggal kembali',
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Jumlah', style: TextStyle(fontWeight: FontWeight.bold)),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                if (quantity > 1) {
                                  setState(() {
                                    quantity--;
                                    updateTotalPrice();
                                  });
                                }
                              },
                            ),
                            Text(quantity.toString(), style: const TextStyle(fontSize: 16)),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  quantity++;
                                  updateTotalPrice();
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () async {
                      if (startDate == null || endDate == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Tanggal sewa dan kembali wajib diisi')),
                        );
                        return;
                      }

                      final payload = {
                        'id_item': id_item,
                        'ukuran': selectedSize.toString(), // pastikan ini string
                        'tanggal_sewa': startDate!.toIso8601String().split('T').first, // format: YYYY-MM-DD
                        'tanggal_kembali': endDate!.toIso8601String().split('T').first,
                        'jumlah': quantity,
                        'total_harga': totalPrice,
                      };

                      final response = await http.post(
                        Uri.parse('http://192.168.137.1:8000/sewa'),
                        headers: {'Content-Type': 'application/json'},
                        body: jsonEncode(payload),
                      );

                      if (response.statusCode == 200 || response.statusCode == 201) {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Berhasil menambahkan item ke keranjang')),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Gagal menambahkan item ke keranjang: ${response.body}')),
                        );
                      }
                    },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Center(child: Text('Sewa Sekarang')),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
