import 'package:http/http.dart' as http;

import '../model/bitki_model.dart';

class BitkiService {
  Future<BitkiCardModel?> getBitkiCard() async {
    const String baseUrl = 'https://api.npoint.io/d68bf630c0cc12745241';

    var url = Uri.parse(baseUrl);

    final response = await http.get(url);

    if (response.statusCode == 200) {
     return bitkiCardModelFromJson(response.body);
    } else {
      return null;
    }
  }
}
