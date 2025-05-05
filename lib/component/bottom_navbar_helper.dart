// import 'dart:nativewrappers/_internal/vm_shared/lib/null_patch.dart';

import 'package:flutter/material.dart';
import 'package:tubes_kelompok_7/pages/favorit.dart';
import 'package:tubes_kelompok_7/pages/home.dart';
import 'package:tubes_kelompok_7/pages/profile.dart';
import 'package:tubes_kelompok_7/pages/transaksi.dart';
import 'package:tubes_kelompok_7/pages/chat.dart';


class Bottomnavbarhelper {
  static void handleBottomNavTap(BuildContext context, int index, int currentIndex) {
    if (index == currentIndex) return; // jangan push halaman yg sama

    Widget target;
    switch (index) {
      case 0: // home
        print('Home tapped');
        target = HomePage();
        break;
      case 1: // transaksi
        print('Transaksi tapped');
        target = TransaksiPage();
        break;
      case 2: // favorit
        print('Favorite tapped');
        target = const FavoritesPage();
        break;
      case 3: // chat
        print('Chat tapped');
        target = const ChatDetailPage();
        break;
      case 4: // profil
        print('Profile tapped');
        target = const ProfilePage();
        break;
      default:
        return;
    }

    Navigator.push(context, MaterialPageRoute(builder: (_) => target));
  }
}
