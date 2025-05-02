import 'package:flutter/material.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

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
        title: const Text('Bahasa'),
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListTile(
            title: const Text('Pilih Bahasa', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text('Bahasa Indonesia'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
                showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                  title: const Text('Pilih Bahasa'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                    ListTile(
                      title: const Text('Bahasa Indonesia'),
                      onTap: () {
                      // Logic to change language to Indonesian
                      Navigator.of(context).pop();
                      },
                    ),
                    ListTile(
                      title: const Text('English'),
                      onTap: () {
                      // Logic to change language to English
                      Navigator.of(context).pop();
                      },
                    ),
                    ],
                  ),
                  );
                },
                );
            },
          ),
        ],
      ),
    );
  }
}