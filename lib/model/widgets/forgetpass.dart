import 'package:flutter/material.dart';
import 'package:meyvebahcem/view/screens/yeni_sifre.dart';

Widget forgetPassword(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 35,
    alignment: Alignment.bottomRight,
    child: TextButton(
      child: const Text(
        "Şifrenizi Mi Unuttunuz?",
        style: TextStyle(color: Colors.white70),
        textAlign: TextAlign.right,
      ),
      onPressed: () => Navigator.push(
      context,
  MaterialPageRoute(
  builder: (context) => const YeniSifreEkran()),
    ),
    ),
  );
}
