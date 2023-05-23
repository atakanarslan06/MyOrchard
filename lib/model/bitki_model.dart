import 'dart:convert';

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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    bitkiler: List<Bitkiler>.from(json["bitkiler"].map((x) => Bitkiler.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "bitkiler": List<dynamic>.from(bitkiler.map((x) => x.toJson())),
  };
}

class Bitkiler {
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
  };
}