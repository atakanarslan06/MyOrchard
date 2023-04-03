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
          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => GirisYapEkran()
          ));  },
          child: Text("Çıkış Yap"),
        ),
      ),
    );
  }
}
