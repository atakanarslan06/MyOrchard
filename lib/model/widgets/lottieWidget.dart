import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

lottieWidget(String lottieName) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10,),
    child: Lottie.asset(
      lottieName,
      fit: BoxFit.fitWidth,
      width: 240,
      height: 240,
    ),
  );
}