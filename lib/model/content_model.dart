class UnboardingContent {
  String image;
  String title;
  String description;

  UnboardingContent({required this.image, required this.title, required this.description});
}
List<UnboardingContent> contents = [
  UnboardingContent(
    title: 'Verimli Bahçe',
    image: 'assets/images/img1.jpg',
    description: "Bahçe yönetiminde sana yardımcı olacak, ektiğin bitkilerin kontrolünü sağlayacak."
  ),
  UnboardingContent(
    title: 'Bitki Dünyası',
    image: 'assets/images/img2.jpg',
    description: "Bitkilerin dünyasına daha yakından bakacak ve daha verimli bitki yetiştirebileceksin."
  ),
  UnboardingContent(
    title: 'Bilinçli Tarım',
    image: 'assets/images/img3.jpg',
    description: "Onlarca bitki hakkında detaylı bilgi edinerek toprağına ne ekeceğin artık daha kolay. Hemen aramıza katıl."
  ),
];