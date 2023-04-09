import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meyvebahcem/model/hava_durum_utils.dart';
import 'package:meyvebahcem/services/hava_durum_data.dart';


class HavaDurumuSayfa extends StatefulWidget {
  const HavaDurumuSayfa({Key? key}) : super(key: key);



  @override
  State<HavaDurumuSayfa> createState() => _HavaDurumuSayfaState();
}

class _HavaDurumuSayfaState extends State<HavaDurumuSayfa> {
  late LocationHelper locationData;
  Future<void> getLocationData() async{
    locationData = LocationHelper();
    await locationData.getCurrentLocation();

    if(locationData.latitude == null || locationData.longitude == null) {
      print("Konum bilgileri gelmiyor");
    }else {
      ("latitude: " + locationData.latitude.toString());
      ("latitude: " + locationData.longitude.toString());
    }
  }
  void getWeatherData() async {
    await getLocationData();
    HavaDurumData havaDurumData = HavaDurumData(locationData: locationData);
    await havaDurumData.getCurrentTemperature();
    if(havaDurumData.currentTemperature == null || havaDurumData.currentCondition == null){
      print("API den sıcaklık veya durum bilgisi boş dönüyor.");
    }
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
      return HavaDurumuSayfa();
    }));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(
       constraints: BoxConstraints.expand(),
       decoration: BoxDecoration(
         image: DecorationImage(
           image: AssetImage('assets/images/cloud.jpg'),
           fit: BoxFit.cover,
         )
       ),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
         children: [
           SizedBox(height: 40,),
           Container(
             child: Icon(
               FontAwesomeIcons.cloud,
               size: 75.0,
               color: Colors.white70,
             ),
           ),
           SizedBox(height: 15,),
           Center(
             child: Text('20°',
             style: TextStyle(
               color: Colors.white,
               fontSize: 80.0,
               letterSpacing: -5
             ),
             ),
           )
         ],
       ),
     ),
    );
  }
}