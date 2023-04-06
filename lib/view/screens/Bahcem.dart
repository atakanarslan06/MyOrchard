import 'package:flutter/material.dart';
class BahcemSayfa extends StatefulWidget {
  const BahcemSayfa({Key? key}) : super(key: key);

  @override
  State<BahcemSayfa> createState() => _BahcemSayfaState();
}

class _BahcemSayfaState extends State<BahcemSayfa> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
            "Bahcem Sayfası"
        ),
      ),
    );
  }
}
