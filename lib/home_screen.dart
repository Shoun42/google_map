import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final GoogleMapController _mapController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps'),
      ),
      body: GoogleMap(
          mapType: MapType.terrain,
          initialCameraPosition:const CameraPosition(
              zoom: 16,
              target: LatLng(25.747399180983482, 89.46055303058475),
          ),

          onMapCreated : (GoogleMapController controller) {
           _mapController = controller;

           },
        trafficEnabled: true,
        zoomControlsEnabled: true,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,

        onTap: (LatLng LatLng){
            print('You Tapped on $LatLng');

        },

        onLongPress: (LatLng LatLng){
            print('You long pressed on $LatLng');
        },


    ),
    );
  }
}
