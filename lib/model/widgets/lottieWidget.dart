import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

lottieWidget(String lottieName) {
  return Lottie.asset(
    lottieName,
    fit: BoxFit.fitWidth,
    width: 240,
    height: 240,
  );
}