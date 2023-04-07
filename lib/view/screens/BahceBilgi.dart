import 'package:flutter/material.dart';

class BahceBilgi extends StatefulWidget {
  const BahceBilgi({Key? key}) : super(key: key);

  @override
  State<BahceBilgi> createState() => _BahceBilgiState();
}

class _BahceBilgiState extends State<BahceBilgi> {
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
