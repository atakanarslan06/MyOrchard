import 'package:flutter/material.dart';
import 'package:meyvebahcem/view/screens/Bahcem.dart';
import 'package:meyvebahcem/view/screens/Bitkiler.dart';
import 'package:meyvebahcem/view/screens/HavaDurumu.dart';
import 'package:meyvebahcem/view/screens/Notlar.dart';
import 'package:meyvebahcem/view/screens/Harita.dart';

class AnaGiris extends StatefulWidget {
  const AnaGiris({Key? key}) : super(key: key);

  @override
  State<AnaGiris> createState() => _AnaGirisState();
}

class _AnaGirisState extends State<AnaGiris> {
  List pages = [
    const HaritaSayfa(),
    const HavaDurumuSayfa(),
    const BahcemSayfa(),
    const BitkilerSayfa(),
    const NotlarSayfa(),
  ];
  int _currentIndex = 0;
  void _onTap(int index){
  setState(() {
    _currentIndex = index;
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meyve Bahçem'),
        centerTitle: true,
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTap,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.blueGrey.withOpacity(0.5),
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            label: "Harita",
            icon: Icon(Icons.map_outlined),
          ),
          BottomNavigationBarItem(
            label: "Hava Durumu",
            icon: Icon(
              Icons.cloudy_snowing,
            ),
          ),
          BottomNavigationBarItem(
            label: "Bahçem",
            icon: Icon(Icons.nature_people_rounded),
          ),
          BottomNavigationBarItem(
            label: "Bitkiler",
            icon: Icon(Icons.nature_outlined),
          ),
          BottomNavigationBarItem(
            label: "Notlar",
            icon: Icon(Icons.edit_note),
          ),
        ],
      ),
    );
  }
}
