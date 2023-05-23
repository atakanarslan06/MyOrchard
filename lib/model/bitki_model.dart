import 'dart:convert';

BitkiCardModel bitkiCardModelFromJson(String str) =>
    bitkiCardModelFromJson(json.decode(str));

class BitkiCardModel {
  BitkiCardModel({
    required this.data,
  });

  final Data data;

  factory BitkiCardModel.fromJson(Map<String, dynamic> json) => BitkiCardModel(
    data: Data.fromJson(json["data"]),
  );
}

class Data {
  Data({
    required this.bitkiler,
});

  final List<Bitkiler> bitkiler;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    bitkiler: List<Bitkiler>.from(json["bitkiler"].map((x) => Bitkiler.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "bitkiler": List<dynamic>.from(bitkiler.map((x) => x.toJson())),
  };
}

class Bitkiler {
  Bitkiler({
    required this.image,
    required this.title,
  });

  String image;
  String title;

  factory Bitkiler.fromJson(Map<String, dynamic> json) => Bitkiler(
    image: json["image"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "title": title,
  };
}