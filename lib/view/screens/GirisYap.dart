import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../model/color_utils.dart';
import '../../model/widgets/lottieWidget.dart';

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
                  lottieWidget("assets/looties/107999-energyshares-plant5.json")
                ],
              ),
            ),),
        ),
      );
  }
}
