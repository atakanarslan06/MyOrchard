import 'dart:convert';

<<<<<<< HEAD
Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Data data;

  Welcome({
    required this.data,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  List<Bitkiler> bitkiler;

  Data({
    required this.bitkiler,
  });
=======
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
>>>>>>> origin/master

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    bitkiler: List<Bitkiler>.from(json["bitkiler"].map((x) => Bitkiler.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "bitkiler": List<dynamic>.from(bitkiler.map((x) => x.toJson())),
  };
}

class Bitkiler {
<<<<<<< HEAD
  String name;
  String image;

  Bitkiler({
    required this.name,
    required this.image,
  });

  factory Bitkiler.fromJson(Map<String, dynamic> json) => Bitkiler(
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
=======
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
>>>>>>> origin/master
  };
}