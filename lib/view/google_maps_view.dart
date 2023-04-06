import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsView extends StatefulWidget {
  const GoogleMapsView({Key? key}) : super(key: key);

  @override
  State<GoogleMapsView> createState() => _GoogleMapsViewState();
}

class _GoogleMapsViewState extends State<GoogleMapsView> {
  static final CameraPosition _bahcem = CameraPosition(
    target: LatLng(39.6620261, 32.8609159),
    zoom: 19.151926040649414,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _bahcem,
        onMapCreated: (map) {
        },
        markers: _createMarker()
      ),
      );
  }
  Set<Marker> _createMarker(){
    return <Marker>{
      Marker(markerId: MarkerId("asda"),
      position: _bahcem.target,
        icon: BitmapDescriptor.fromAssetImage(configuration, assetName)
      )
    };
  }
}

