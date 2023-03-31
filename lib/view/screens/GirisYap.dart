import 'package:flutter/material.dart';
import 'package:meyvebahcem/model/widgets/formWidget.dart';
import '../../model/color_utils.dart';
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
    return  Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
        child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height * 0.2, 20, 0),
              child: Column(
                children: <Widget>[
                  lottieWidget("assets/looties/107999-energyshares-plant5.json"),
                  SizedBox(
                    height: 30,
                  ),
                  formWidget("Kullanıcı Adını Giriniz", Icons.person_outline, false, _emailTextController),
                  SizedBox(
                    height: 30,
                  ),
                  formWidget("Şifrenizi Giriniz", Icons.lock_outline, true, _passwordTextController),
                ],
              ),
            ),),
        ),
      );
  }
}
