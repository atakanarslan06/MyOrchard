import 'package:flutter/material.dart';

Widget forgetPassword(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 35,
    alignment: Alignment.bottomRight,
    child: TextButton(
      child: Text(
        "Şifrenizi Mi Unuttunuz?",
        style: TextStyle(color: Colors.white70),
        textAlign: TextAlign.right,
      ),
      onPressed: () {},
    ),
  );
}
