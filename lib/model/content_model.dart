class AcilisEkranContent {
  String resim;
  String baslik;
  String bilgi;

  AcilisEkranContent({required this.resim,  required this.baslik,  required this.bilgi});
}
List<AcilisEkranContent> contents = [
  AcilisEkranContent(
    baslik: 'Verimli Bahçe',
    resim: 'assets/images/img1.jpg',
    bilgi: "Bahçe yönetiminde sana yardımcı olacak, ektiğin bitkilerin kontrolünü sağlayacak."
  ),
  AcilisEkranContent(
    baslik: 'Bitki Dünyası',
    resim: 'assets/images/img2.jpg',
    bilgi: "Bitkilerin dünyasına daha yakından bakacak ve daha verimli bitki yetiştirebileceksin."
  ),
  AcilisEkranContent(
    baslik: 'Bilinçli Tarım',
    resim: 'assets/images/img3.jpg',
    bilgi: "Onlarca bitki hakkında detaylı bilgi edinerek toprağına ne ekeceğin artık daha kolay. Hemen aramıza katıl."
  ),
];