import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleHarita extends StatefulWidget {
  const GoogleHarita({Key? key}) : super(key: key);

  @override
  State<GoogleHarita> createState() => _GoogleHaritaState();
}

class _GoogleHaritaState extends State<GoogleHarita> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(39.6620261, 32.8609159),
    zoom: 11.5,
  );

  Marker _MapIcon;
  Marker _Norm;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        initialCameraPosition: _initialCameraPosition,
        markers: {
          if (_MapIcon != null) _Norm,
          if(_Norm != null) _MapIcon
        },
        onLongPress: _addMarker,
      ),
    );
  }
  void _addMarker(LatLng pos)
  {
    if (_MapIcon == null || (_MapIcon != null && _Norm != null)){
      setState(() {
        _MapIcon = Marker(
          markerId:  const MarkerId('bahcem'),
          infoWindow: const InfoWindow(title: 'Bahcem'),
          icon:
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
          position: pos,
        );
        _Norm = null;
      });

    }else
      {
        setState(() {
          _Norm = Marker(markerId: const MarkerId("norm"),
          infoWindow: const InfoWindow(title: "Norm"),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
            position: pos,
          );
        });
      }
  }
}

