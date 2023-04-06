import 'package:flutter/material.dart';
class HavaDurumuSayfa extends StatefulWidget {
  const HavaDurumuSayfa({Key? key}) : super(key: key);

  @override
  State<HavaDurumuSayfa> createState() => _HavaDurumuSayfaState();
}

class _HavaDurumuSayfaState extends State<HavaDurumuSayfa> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
            "Hava Durumu"
        ),
      ),
    );
  }
}