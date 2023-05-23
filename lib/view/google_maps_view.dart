import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class GoogleHarita extends StatefulWidget {
  const GoogleHarita({Key? key}) : super(key: key);

  @override
  State<GoogleHarita> createState() => _GoogleHaritaState();
}

class _GoogleHaritaState extends State<GoogleHarita> {
  static final CameraPosition _bahcem = CameraPosition(
    target: LatLng(39.6620261, 32.8609159),
    zoom: 19.5,
  );
  List<LatLng> polygonPoints = [
    LatLng(39.661972, 32.860989),
    LatLng(39.662105, 32.860830),
    LatLng(39.662217, 32.861005),
    LatLng(39.662081, 32.861156),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap( // Google Mapimizi entegre ettik
        mapType: MapType.hybrid,
        initialCameraPosition: _bahcem,
        onMapCreated: (map) async {
          await _createdMarkerImageFromAsset(context);
          setState(() {});
        },
        polygons: {
          Polygon(polygonId: PolygonId("1"), // Polygon özelliği ile çizilebilir alan oluşturduk
          points: polygonPoints,
            fillColor: Colors.lightGreenAccent.withOpacity(0.6),
            strokeWidth: 2,
            strokeColor: Colors.brown,
          ),
        },
        markers: _createMarker(),
      ),
    );
  }

  BitmapDescriptor bahceIcon =
  BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet);

  Future<void> _createdMarkerImageFromAsset(BuildContext context) async { // Uygulamamıza özel marker oluşturduk
    final ImageConfiguration imageConfiguration =
    createLocalImageConfiguration(context);
    var bitmap = await BitmapDescriptor.fromAssetImage(
        imageConfiguration, 'assets/images/mapicon.png');
    bahceIcon = bitmap;
    setState(() {});
  }

  Set<Marker> _createMarker() { // Oluşturduğumuz markeri set ettik
    return <Marker>[
      Marker(
        markerId: MarkerId("1"),
        position: _bahcem.target,
        icon: bahceIcon,
        infoWindow: InfoWindow(title: "Benim Bahçem"),
      ),
    ].toSet();
  }
}
