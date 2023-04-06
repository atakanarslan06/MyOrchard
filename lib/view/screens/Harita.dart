import 'package:flutter/material.dart';
class HaritaSayfa extends StatefulWidget {
  const HaritaSayfa({Key? key}) : super(key: key);

  @override
  State<HaritaSayfa> createState() => _HaritaSayfaState();
}

class _HaritaSayfaState extends State<HaritaSayfa> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
            "Harita Sayfa"
        ),
      ),
    );
  }
}

