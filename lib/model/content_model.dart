class AcilisEkranContent {
  String image;
  String title;
  String description;

  AcilisEkranContent({required this.image,  required this.title,  required this.description});
}
List<AcilisEkranContent> contents = [
  AcilisEkranContent(
    title: 'Verimli Bahçe',
    image: 'assets/images/img1.jpg',
    description: "Bahçe yönetiminde sana yardımcı olacak, ektiğin bitkilerin kontrolünü sağlayacak."
  ),
  AcilisEkranContent(
    title: 'Bitki Dünyası',
    image: 'assets/images/img2.jpg',
    description: "Bitkilerin dünyasına daha yakından bakacak ve daha verimli bitki yetiştirebileceksin."
  ),
  AcilisEkranContent(
    title: 'Bilinçli Tarım',
    image: 'assets/images/img3.jpg',
    description: "Onlarca bitki hakkında detaylı bilgi edinerek toprağına ne ekeceğin artık daha kolay. Hemen aramıza katıl."
  ),
];