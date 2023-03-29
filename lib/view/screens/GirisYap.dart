import 'package:flutter/material.dart';

import '../../model/color_utils.dart';

class GirisYapEkran extends StatefulWidget {
  const GirisYapEkran({Key? key}) : super(key: key);

  @override
  State<GirisYapEkran> createState() => _GirisYapEkranState();
}

class _GirisYapEkranState extends State<GirisYapEkran> {
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
