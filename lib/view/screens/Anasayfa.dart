import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meyvebahcem/view/screens/GirisYap.dart';

class anaSayfaEkran extends StatefulWidget {
  const anaSayfaEkran({Key? key}) : super(key: key);

  @override
  State<anaSayfaEkran> createState() => _anaSayfaEkranState();
}

class _anaSayfaEkranState extends State<anaSayfaEkran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            child: const Text("Çıkış Yap"),
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value) {
                print("Çıkış Yapıldı");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GirisYapEkran()));
              });
            }),
      ),
    );
  }
}
