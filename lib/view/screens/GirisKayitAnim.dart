import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GirisKayitAnim extends StatefulWidget {
  const GirisKayitAnim({Key? key}) : super(key: key);

  @override
  State<GirisKayitAnim> createState() => _GirisKayitAnimState();
}

class _GirisKayitAnimState extends State<GirisKayitAnim> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: [
              Lottie.asset('assets/looties/140503-growing-tree.json'),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
