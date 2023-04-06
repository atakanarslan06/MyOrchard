import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meyvebahcem/model/widgets/formWidget.dart';

import 'package:meyvebahcem/view/screens/AnaGiris.dart';
import 'package:meyvebahcem/view/screens/KayitOl.dart';
import '../../model/color_utils.dart';
import '../../model/widgets/forgetpass.dart';
import '../../model/widgets/lottieWidget.dart';

class GirisYapEkran extends StatefulWidget {
  const GirisYapEkran({Key? key}) : super(key: key);

  @override
  State<GirisYapEkran> createState() => _GirisYapEkranState();
}

class _GirisYapEkranState extends State<GirisYapEkran> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            hexStringToColor("76addf"),
            hexStringToColor("6aa84f"),
            hexStringToColor("ad8443")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                lottieWidget("assets/looties/107999-energyshares-plant5.json"),
                const SizedBox(
                  height: 10,
                ),
                formWidget("Kullanıcı Adını Giriniz", Icons.person_outline,
                    false, _emailTextController),
                const SizedBox(
                  height: 30,
                ),
                formWidget("Şifrenizi Giriniz", Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(
                  height: 5,
                ),
                forgetPassword(context),
                firebaseButton(context, "Giriş Yap", () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AnaGiris()));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                }),
                girisYapOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row girisYapOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Hesabın yok mu?", style: TextStyle(color: Colors.white)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => KayitOlEkran()));
          },
          child: const Text(
            " Kayıt Ol",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
