import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:meyvebahcem/model/hava_durum_utils.dart';

const apiKey = "a20bd91926184bb4bca122300230904";

class WeatherDisplayData{
  Icon weatherIcon;
  AssetImage weatherImage;

  WeatherDisplayData(this.weatherIcon, this.weatherImage);
}

class HavaDurumData {
  HavaDurumData({required this.locationData});

  LocationHelper locationData;
  double currentTemperature = 16;
  int currentCondition = 12;

  Future<void> getCurrentTemperature() async {
    Response response = await get(
        Uri.parse("http://api.weatherapi.com/v1/current.json?key=${apiKey}"));

    if(response.statusCode == 200) {
      String data = response.body;

      var currentWeather = jsonDecode(data);
      try {
        currentTemperature = currentWeather['current' as int] ['temp'as int] as double;
        currentCondition = currentWeather['location'as int] ['name'as int] as int;
      }
      catch(e){
        print(e);
      }
    }else
      {
        print('API den değer gelmiyor');
      }
  }
  WeatherDisplayData getWeatherDisplayData(){
  if(currentCondition < 50){

  }
  }
}
