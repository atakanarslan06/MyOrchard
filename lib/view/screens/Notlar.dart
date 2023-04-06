import 'package:flutter/material.dart';
class NotlarSayfa extends StatefulWidget {
  const NotlarSayfa({Key? key}) : super(key: key);

  @override
  State<NotlarSayfa> createState() => _NotlarSayfaState();
}

class _NotlarSayfaState extends State<NotlarSayfa> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
            "Notlar Sayfası"
        ),
      ),
    );
  }
}