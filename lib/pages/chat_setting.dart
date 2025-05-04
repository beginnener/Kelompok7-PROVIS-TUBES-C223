import 'package:flutter/material.dart';

class ChatSettingPage extends StatelessWidget {
  const ChatSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isSelectedPopup = true; // Default value for the switch
    bool isSelectedSound = true; // Default value for the switch
    bool isSelectedHide = true; // Default value for the switch
    bool isSelectedAutoChat = true; // Default value for the switch
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
        title: const Text('Pengaturan Chat'),
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
                    title: const Text('Aktifkan Notifikasi Pop up'),
                    value: isSelectedPopup,
                    onChanged: (bool? value) {
                    setState(() {
                      isSelectedPopup = value ?? false; // Update the state of the checkbox
                    });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                        content: Text(isSelectedPopup
                          ? 'Notifikasi diaktifkan'
                          : 'Notifikasi dinonaktifkan'),
                        ),
                      );
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Aktifkan Suara Notifikasi'),
                    value: isSelectedSound,
                    onChanged: (bool? value) {
                    setState(() {
                      isSelectedSound = value ?? false; // Update the state of the checkbox
                    });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                        content: Text(isSelectedSound
                          ? 'Suara notifikasi diaktifkan'
                          : 'Suara notifikasi dinonaktifkan'),
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            height: 24,
            color: Colors.grey[200],
            child: const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(
                'Preferensi Chat',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                children: [
                  CheckboxListTile(
                    title: const Text('Sembunyikan Chat'),
                    value: isSelectedHide,
                    onChanged: (bool? value) {
                    setState(() {
                      isSelectedHide = value ?? false; // Update the state of the checkbox
                    });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                        content: Text(isSelectedHide
                          ? ' Chat disembunyikan'
                          : ' Chat batal disembunyikan'),
                        ),
                      );
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Aktifkan Auto Chat'),
                    value: isSelectedAutoChat,
                    onChanged: (bool? value) {
                    setState(() {
                      isSelectedAutoChat = value ?? false; // Update the state of the checkbox
                    });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                        content: Text(isSelectedAutoChat
                          ? 'Auto Chat diaktifkan'
                          : 'Auto Chat dinonaktifkan'),
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}