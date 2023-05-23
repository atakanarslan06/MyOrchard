import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimButton extends StatelessWidget {
  const AnimButton({
    Key? key,
    required this.buttonColor,
    required this.textColor,
    required this.buttonText,
    required this.handleButtonClick,
  }) : super(key: key);
  final Color buttonColor;
  final Color textColor;
  final String buttonText;
  final Function handleButtonClick;

  @override
  Widget build(BuildContext context) {
    return SizedBox( // Boşluk bırakmak için kullanılır
      width: 350,
        child: ElevatedButton( // Button Metodu
          style: ButtonStyle(  // Button Stili
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), //Button köşelerinin yuvarlaklaşması
              ),
            ),
            padding: MaterialStateProperty.all(  //Button konum ayarlaması
              const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15,
              ),
            ),
            backgroundColor: MaterialStateProperty.all(buttonColor), //Button rengi
          ),
          onPressed: () {
            handleButtonClick();  //Tıklandığında yapılacak fonksiyon
          },
          child: Text(  //Buttonda yazılan text ve stilleri
            buttonText,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ),
    );
  }
  /*child: ElevatedButton(
  child: const Text("Çıkış Yap"),
  onPressed: () {
  FirebaseAuth.instance.signOut().then((value) {
  print("Çıkış Yapıldı");
  Navigator.push(context,
  MaterialPageRoute(builder: (context) => GirisYapEkran()));*/
}
