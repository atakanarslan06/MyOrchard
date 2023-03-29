import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:meyvebahcem/view/screens/GirisYap.dart';

import '../../model/widgets/AnimButton.dart';

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/looties/140503-growing-tree.json',
                height: 350,
              ),
              SizedBox(
                height: 50,
              ),
              AnimButton(
                buttonColor: Colors.green,
                buttonText: "Giriş Yap",
                textColor: Colors.white,
                handleButtonClick:
                girisButtonClickHandler,),
              SizedBox(height: 20,),
              AnimButton(
                buttonColor: Colors.lightGreen.shade400,
                buttonText: "Kayıt Ol",
                textColor: Colors.white,
                handleButtonClick:
                kayitButtonClickHandler,),
            ],
          ),
        ),
      ),
    );
  }
  girisButtonClickHandler() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
        builder: (_) => const GirisYapEkran(),
        ),
    );
  }

  kayitButtonClickHandler() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const GirisYapEkran(),
      ),
    );
  }
}


