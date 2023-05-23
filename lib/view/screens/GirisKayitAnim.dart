import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:meyvebahcem/view/screens/GirisYap.dart';
import 'package:meyvebahcem/view/screens/KayitOl.dart';
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset( // Animasyon Girdisi
              'assets/looties/140503-growing-tree.json',
              height: 350,
            ),
            const SizedBox(
              height: 50,
            ),
            AnimButton(
              buttonColor: Colors.green,
              buttonText: "Giriş Yap",
              textColor: Colors.white,
              handleButtonClick:
              girisButtonClickHandler,),
            const SizedBox(height: 20,),
            AnimButton(
              buttonColor: Colors.lightGreen.shade400,
              buttonText: "Kayıt Ol",
              textColor: Colors.white,
              handleButtonClick:
              kayitButtonClickHandler,),
          ],
        ),
      ),
    );
  }
  girisButtonClickHandler() { // Giriş Yap butonuna basıldığında açılacak sayfa fonksiyonu
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
        builder: (_) => const GirisYapEkran(),
        ),
    );
  }

  kayitButtonClickHandler() { // Kayıt ol butonuna basıldığında açılacak sayfa fonksiyonu
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const KayitOlEkran(),
      ),
    );
  }
}


