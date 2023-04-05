import 'package:flutter/material.dart';
import 'package:meyvebahcem/view/screens/GirisYap.dart';
import '../../model/color_utils.dart';
import '../../model/widgets/formWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';

class YeniSifreEkran extends StatefulWidget {
  const YeniSifreEkran({Key? key}) : super(key: key);

  @override
  State<YeniSifreEkran> createState() => _YeniSifreEkranState();
}

class _YeniSifreEkranState extends State<YeniSifreEkran> {
  TextEditingController _emailTextController = TextEditingController();
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
          "Yeni Şifre",
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
                formWidget("E  Mailinizi Giriniz", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                firebaseButton(context, "Şifreyi Yenile", () {
                  FirebaseAuth.instance.sendPasswordResetEmail(email: _emailTextController.text)
                      .then((value) => Navigator.of(context).pop());
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
