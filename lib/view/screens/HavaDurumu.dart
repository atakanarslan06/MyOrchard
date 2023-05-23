import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../model/hava_durum_model.dart';

class HavaDurumSayfa extends StatefulWidget {
  const HavaDurumSayfa({Key? key}) : super(key: key);

  @override
  State<HavaDurumSayfa> createState() => _HavaDurumSayfa();
}

class _HavaDurumSayfa extends State<HavaDurumSayfa> {
  Future<Weather> fetchWeather() async {
    final resp = await http.get(Uri.parse( // API bağlantısı yapılmıştır
        "https://api.openweathermap.org/data/2.5/weather?lat=39.661972&lon=32.860989&appid=40a863f9e45d22da8b470ec6b980b2c1&units=metric"));

    if (resp.statusCode == 200) { // if koşulu ile verilerin gelmemesi halinde exception oluşturuldu
      Map<String, dynamic> json = jsonDecode(resp.body);

      return Weather.fromJson(json);
    } else {
      throw Exception('Veriler yüklenemedi...');
    }
  }

  late Future<Weather> myWeather;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myWeather = fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF676BD0),
        body: FutureBuilder<Weather>(
          future: myWeather,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    snapshot.data!.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),

                  Text(
                    snapshot.data!.weather[0]['main'].toString(),  // JSON main bilgileri alınmıştır
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      letterSpacing: 1.3,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    '16 Nisan, 2023',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 250,
                    width: 250,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/weatherr.png', // Resim Eklenmiştir
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          const Text(
                            'Sıcaklık',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${(snapshot.data!.main['temp'])}', // Sıcaklık bilgisi alınmıştır
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 21,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Column(
                        children: [
                          const Text(
                            'Rüzgar',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${snapshot.data!.wind['speed']} km/h', //rüzgar bilgisi alınmıştır
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 21,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Column(
                        children: [
                          const Text(
                            'Nem',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${snapshot.data!.main['humidity']}%', // Nem bilgisi alınmıştır
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 21,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return const Text('Veriler yüklenemedi..');
            } else {
              return const CircularProgressIndicator(
                color: Colors.white,
              );
            }
          },
        )
    );
  }
}
