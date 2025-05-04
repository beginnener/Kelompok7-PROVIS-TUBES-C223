import 'package:flutter/material.dart';

class NotificationSettingPage extends StatelessWidget {
  const NotificationSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool transaksiKonfirmasiPesanan = true; 
    bool transaksiReminder = true; 
    bool transaksiKonfirmasiStatus = true; 
    bool transaksiKonfirmasiPerubahanJadwal = true; 
    bool notifPromo = true; 
    bool notifRekomendasi = true; 
    bool akunPerubahanData = true; 
    bool akunNotifikasiLogin = true; 
    bool akunPeringatanKeamanan = true; 
    bool nonaktifkanSemua = true; 
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if(Navigator.canPop(context)){
              Navigator.pop(context);
            }
            else{
              Navigator.pushReplacementNamed(context, '/');
            }
          },
        ),
        title: const Text('Pengaturan Notifikasi'),
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 24,
            color: Colors.grey[200],
            child: const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(
                'Notifikasi',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                children: [
                  CheckboxListTile(
                    title: const Text('Konfirmasi pesanan berhasil'),
                    value: transaksiKonfirmasiPesanan,
                    onChanged: (bool? value) {
                    setState(() {
                      transaksiKonfirmasiPesanan = value ?? false; // Update the state of the checkbox
                    });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                        content: Text(transaksiKonfirmasiPesanan
                          ? 'Notifikasi diaktifkan'
                          : 'Notifikasi dinonaktifkan'),
                        ),
                      );
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Pengingat jadwal pengembalian'),
                    value: transaksiReminder,
                    onChanged: (bool? value) {
                    setState(() {
                      transaksiReminder = value ?? false; // Update the state of the checkbox
                    });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                        content: Text(transaksiReminder
                          ? 'notifikasi diaktifkan'
                          : 'notifikasi dinonaktifkan'),
                        ),
                      );
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Status pengiriman & penerimaan barang'),
                    value: transaksiKonfirmasiStatus,
                    onChanged: (bool? value) {
                    setState(() {
                      transaksiKonfirmasiStatus = value ?? false; // Update the state of the checkbox
                    });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                        content: Text(transaksiKonfirmasiStatus
                          ? 'notifikasi diaktifkan'
                          : 'notifikasi dinonaktifkan'),
                        ),
                      );
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Pembatalan & perubahan jadwal'),
                    value: transaksiKonfirmasiPerubahanJadwal,
                    onChanged: (bool? value) {
                    setState(() {
                      transaksiKonfirmasiPerubahanJadwal = value ?? false; // Update the state of the checkbox
                    });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                        content: Text(transaksiKonfirmasiPerubahanJadwal
                          ? 'notifikasi diaktifkan'
                          : 'notifikasi dinonaktifkan'),
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
          Container(
            width: double.infinity,
            height: 24,
            color: Colors.grey[200],
            child: const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(
                'Notifikasi Promo & Penawaran',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                children: [
                  CheckboxListTile(
                    title: const Text('Promo musiman & penawaran menarik'),
                    value: notifPromo,
                    onChanged: (bool? value) {
                    setState(() {
                      notifPromo = value ?? false; // Update the state of the checkbox
                    });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                        content: Text(notifPromo
                          ? 'notifikasi promo diaktifkan'
                          : 'notifikasi promo dinonaktifkan'),
                        ),
                      );
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Rekomendasi alat'),
                    value: notifRekomendasi,
                    onChanged: (bool? value) {
                    setState(() {
                      notifRekomendasi = value ?? false; // Update the state of the checkbox
                    });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                        content: Text(notifRekomendasi
                          ? 'notifikasi rekomendasi diaktifkan'
                          : 'notifikasi rekomendasi dinonaktifkan'),
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
          Container(
            width: double.infinity,
            height: 24,
            color: Colors.grey[200],
            child: const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(
                'Notifikasi Akun',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                children: [
                  CheckboxListTile(
                    title: const Text('Perubahan data akun'),
                    value: akunPerubahanData,
                    onChanged: (bool? value) {
                    setState(() {
                      akunPerubahanData = value ?? false; // Update the state of the checkbox
                    });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                        content: Text(akunPerubahanData
                          ? 'notifikasi diaktifkan'
                          : 'notifikasi dinonaktifkan'),
                        ),
                      );
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Notifikasi login'),
                    value: akunNotifikasiLogin,
                    onChanged: (bool? value) {
                    setState(() {
                      akunNotifikasiLogin = value ?? false; // Update the state of the checkbox
                    });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                        content: Text(akunNotifikasiLogin
                          ? 'notifikasi diaktifkan'
                          : 'notifikasi dinonaktifkan'),
                        ),
                      );
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Peringatan keamanan'),
                    value: akunPeringatanKeamanan,
                    onChanged: (bool? value) {
                    setState(() {
                      akunPeringatanKeamanan = value ?? false; // Update the state of the checkbox
                    });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                        content: Text(akunPeringatanKeamanan
                          ? 'notifikasi diaktifkan'
                          : 'notifikasi dinonaktifkan'),
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
          StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                width: double.infinity,
                height: 60,
                color: Colors.grey[200],
                child: CheckboxListTile(
                  title: const Text('Nonaktifkan semua notifikasi', style: TextStyle(fontWeight: FontWeight.bold)),
                  value: nonaktifkanSemua,
                  onChanged: (bool? value) {
                    setState(() {
                      nonaktifkanSemua = value ?? false; // Update the state of the checkbox
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(nonaktifkanSemua
                            ? 'notifikasi dinonaktifkan'
                            : 'notifikasi diaktifkan'),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}