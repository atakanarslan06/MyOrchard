import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meyvebahcem/view/screens/GirisYap.dart';
import 'package:meyvebahcem/view/screens/AnaGiris.dart';
import '../../model/color_utils.dart';
import '../../model/widgets/formWidget.dart';

class KayitOlEkran extends StatefulWidget {
  const KayitOlEkran({Key? key}) : super(key: key);

  @override
  State<KayitOlEkran> createState() => _KayitOlEkranState();
}

class _KayitOlEkranState extends State<KayitOlEkran> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: IconButton(
            iconSize: 30,
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const GirisYapEkran(),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Kayıt Ol",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
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
            padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                formWidget("Kullanıcı Adını Giriniz", Icons.person_outline,
                    false, _userNameTextController),
                const SizedBox(
                  height: 20,
                ),
                formWidget("E  Mailinizi Giriniz", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                formWidget("Şifrenizi Giriniz", Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                firebaseButton(context, "Kayıt Ol", () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                        print("Hesap Oluşturuldu");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  AnaGiris()));
                  }).onError((error, stackTrace) {print("Error ${error.toString()}");});
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
