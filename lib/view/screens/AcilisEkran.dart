import 'package:flutter/material.dart';
import 'package:meyvebahcem/model/content_model.dart';
import 'package:meyvebahcem/view/screens/GirisKayitAnim.dart';


class AcilisEkran extends StatefulWidget {
  const AcilisEkran({Key? key}) : super(key: key);

  @override
  State<AcilisEkran> createState() => _AcilisEkranState();
}

class _AcilisEkranState extends State<AcilisEkran> {
  int currentIndex = 0;
   late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ButtonStyle style = TextButton.styleFrom(
        backgroundColor: Colors.lightGreenAccent,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)));
        // Geçiş İçin Button Oluşturduk Ve Stil Verdik

    return Scaffold( // Scaffold Ana Ekran Yapısı İçin Kullanılan Metottur
      body: Column(  // Column Ekrana yerleştirilen elemanların yukarıdan aşağıya sıralanmasını sağlar
        children: [
          Expanded(  // Expanded Ekran içinde elemanın esnetilerek düzgün yerleştirilmesini sağlar
            child: PageView.builder( // Dinamik sayfa görüntülerini oluşturmak için kullanılır
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(// Padding ekranda boşluk kullanmak için yapılan ayardır.
                  padding: const EdgeInsets.all(40), // Burada ekranın her kenarından 40 piksel boşluk oluşturduk
                  child: Column(
                    children: [
                      Image.asset(
                        contents[i].image, //Acılıs Ekran Content classımızdan resimi getirdik
                        height: 300,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        contents[i].title, //Acılıs Ekran Content classımızdan başlığı getirdik
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        contents[i].description, //Acılıs Ekran Content classımızdan bilgiyi getirdik
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container( // Container istediğimiz gibi nesneleri konumlandırıp yerleştireceğimiz kutulardır
            child: Row( // Row kutu içerisindeki elemanların yan yana sıralanmasını sağlar
              mainAxisAlignment: MainAxisAlignment.center, //Ortalı hizalanmasını sağlar.
              children: List.generate(// Liste Döndürmeyi sağlar
                contents.length,
                (index) => yuvGcs(index, context),
              ),
            ),
          ),
          Container(
            height: 60,
            margin: const EdgeInsets.all(40),
            width: double.infinity,
            child: TextButton(// Basıldığında sayfanın geçme fonksiyonunu çalıştırır
              onPressed: () {
                if (currentIndex == contents.length - 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const GirisKayitAnim(), //Son ekranda GirisKayitAnim sayfasına yönlendirir
                    ),
                  );
                }
                _controller.nextPage(
                  duration: const Duration(milliseconds: 100), //sayfa gecisinin 100 milisaniyede yapılmasını sağlar
                  curve: Curves.bounceIn,
                );
              },
              style: style,
              child: Text(
                  currentIndex == contents.length - 1 ? "Hadi Başlayalım" : "İleri" // Sayfa uzunluğuna göre text yazımı
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container yuvGcs(int index, BuildContext context) { //yuvarlak küçük kutuların renk değişim kodu
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.lightGreenAccent,
      ),
    );
  }
}
