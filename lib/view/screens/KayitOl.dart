import 'package:flutter/material.dart';

import '../../model/color_utils.dart';

class KayitOlEkran extends StatefulWidget {
  const KayitOlEkran({Key? key}) : super(key: key);

  @override
  State<KayitOlEkran> createState() => _KayitOlEkranState();
}

class _KayitOlEkranState extends State<KayitOlEkran> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        decoration:
        BoxDecoration(
          gradient: LinearGradient(colors:
          [
            hexStringToColor("76addf"),
            hexStringToColor("6aa84f"),
            hexStringToColor("ad8443")
          ],
              begin: Alignment.topCenter, end:  Alignment.bottomCenter),
        ),
      ),
    );
  }
}