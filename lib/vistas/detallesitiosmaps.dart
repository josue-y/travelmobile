import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class DetalleSitiosMapas extends StatefulWidget {
  var sitiosmap;
  DetalleSitiosMapas(this.sitiosmap);

  @override
  State<DetalleSitiosMapas> createState() => _DetalleSitiosMapasState(sitiosmap);
}

class _DetalleSitiosMapasState extends State<DetalleSitiosMapas> {
 var sitiosmap;
 _DetalleSitiosMapasState(this.sitiosmap);

  final Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = Set<Marker>();

  CustomInfoWindowController _customInfoWindowController = CustomInfoWindowController(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(sitiosmap['nombre']),
      ),
      body: GoogleMap(
        mapType: MapType.terrain,
        initialCameraPosition: CameraPosition(
            target: LatLng(sitiosmap['latitud'], sitiosmap['longitud']),
        zoom: 16, ),
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          _ponerMarca();
        },
      ),
    );
  }
  void _ponerMarca (){
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(sitiosmap['nombre']),
        icon: BitmapDescriptor.defaultMarker,
        position: LatLng((sitiosmap['latitud']), sitiosmap['longitud']),
      ));
    });
  }
}
