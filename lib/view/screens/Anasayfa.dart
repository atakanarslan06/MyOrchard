import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class anaSayfaEkran extends StatefulWidget {
  const anaSayfaEkran({Key? key}) : super(key: key);

  @override
  State<anaSayfaEkran> createState() => _anaSayfaEkranState();
}

class _anaSayfaEkranState extends State<anaSayfaEkran> {
  int _seciliBar = 0;
  PageController? _sayfaKontroller;
  @override
  void initState() {
    super.initState();
    _sayfaKontroller = PageController();
  }
  @override
  void dispose(){
    _sayfaKontroller!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Benim Bahçem"),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavyBar(selectedIndex: _seciliBar,
        items:
        [
        BottomNavyBarItem(icon: Icon(Icons.home), title: Text("Anasayfa"), activeColor: Colors.brown,),
        BottomNavyBarItem(icon: Icon(Icons.map), title: Text("Harita"), activeColor: Colors.orangeAccent,),
        BottomNavyBarItem(icon: Icon(Icons.nature_people_rounded), title: Text("Bahçem"), activeColor: Colors.green,),
        BottomNavyBarItem(icon: Icon(Icons.nature_outlined), title: Text("Bitkiler"), activeColor: Colors.lightGreen,),
        BottomNavyBarItem(icon: Icon(Icons.event_note), title: Text("Notlar"), activeColor: Colors.redAccent,),
        ],
      onItemSelected: (index) {
        setState(() => _seciliBar = index);
        _sayfaKontroller!.jumpToPage(index);
      },
      ),
    );
  }
}
