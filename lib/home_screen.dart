import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final GoogleMapController _mapController;

  final Set<Marker> _marker = <Marker>{
    Marker(
      markerId: MarkerId('My home'),
      position: LatLng(25.747399180983482, 89.46055303058475),
      infoWindow: InfoWindow(title: "My Home", onTap: () {}),
      onTap: () {
        //do whatever you want
      },
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    ),
    Marker(
        markerId: MarkerId('My Institute'),
        position: LatLng(26.039013545325922, 88.44284992665052),
        infoWindow: InfoWindow(title: "My Institute", onTap: () {}),
        onTap: () {
          //do whatever you want
        },
        icon:
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
        draggable: true,
        onDragStart: (LatLng startLatLng) {
          print('Start latlng $startLatLng');
        },
        onDragEnd: (LatLng startLatLng) {
          print('Stop latlong $startLatLng');
        }),

    //location dinajpur
    Marker(
        markerId: MarkerId('Friend House'),
        position: LatLng(25.636718865301358, 88.65111105144024),
        infoWindow: InfoWindow(title: "Friend House", onTap: () {}),
        onTap: () {
          //do whatever you want
        },
        icon:
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
        draggable: true,
        onDragStart: (LatLng startLatLng) {
          print('Start latlng $startLatLng');
        },
        onDragEnd: (LatLng startLatLng) {
          print('Stop latlong $startLatLng');
        }),

    Marker(
        markerId: MarkerId('Friend House'),
        position: LatLng(25.434305979353898, 89.31283045560122),
        infoWindow: InfoWindow(title: "Friend House", onTap: () {}),
        onTap: () {
          //do whatever you want
        },
        icon:
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
        draggable: true,
        onDragStart: (LatLng startLatLng) {
          print('Start latlng $startLatLng');
        },
        onDragEnd: (LatLng startLatLng) {
          print('Stop latlong $startLatLng');
        }),

    Marker(
        markerId: MarkerId('pick-up-location-marker'),
        position: LatLng(26.340106384315177, 88.56038365513086),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        draggable: true,
        onDragStart: (LatLng startLatLng) {
          print('Start latlng $startLatLng');
        },
        onDragEnd: (LatLng startLatLng) {
          print('Stop latlong $startLatLng');
        }),
  };

  /*পলি লাইনের জন্য*/
  final Set<Polyline> _polylines = <Polyline>{
    const Polyline(
      polylineId: PolylineId('My Home to My Institute and another'),
      points: [
        LatLng(25.747399180983482, 89.46055303058475),
        LatLng(26.039013545325922, 88.44284992665052),

        LatLng(25.636718865301358, 88.65111105144024),

        LatLng(25.434305979353898, 89.31283045560122),
        //LatLng(25.747399180983482, 89.46055303058475), //my home
      ],
      color: Colors.red,
      startCap: Cap.roundCap,
      endCap: Cap.roundCap,
      width: 4,
      jointType: JointType.round,
    ),
  };

  /* বৃত্তের জন্য */
  final Set<Circle> _circle = <Circle>{
    Circle(
      circleId: CircleId('most-denger-Zoon'),
      center: LatLng(26.039013545325922, 88.44284992665052),
      radius: 30000,
      fillColor: Colors.red.withOpacity(.3),
      strokeColor: Colors.red.withOpacity(.7),
      strokeWidth: 2,
    ),
  };


  /* পলিগণের জন্য */

  final Set<Polygon> _polygon = <Polygon>{
    Polygon(
        polygonId: PolygonId('Polygone-Random'),
        points: [
          LatLng(23.948774694599326, 90.34540146589279),
          LatLng(23.82647018811372, 91.22717499732971),
          LatLng(23.400835029616665, 91.19051489979029),
          LatLng(23.227623090705688, 90.59213988482952),
        ],
        strokeWidth: 2,
        fillColor: Colors.brown.withOpacity(.3),
        strokeColor: Colors.redAccent,
        onTap: () {
          print('You Tap on Polygone');
        }),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps'),
      ),
      body: GoogleMap(
        mapType: MapType.terrain,
        initialCameraPosition: const CameraPosition(
          zoom: 8.8,
          target: LatLng(25.747104200515526, 88.93063578754663),
        ),
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
        },
        onTap: (LatLng latLng) {
          print('You Tapped on $LatLng');
        },
        onLongPress: (LatLng latLng) {
          print('You long pressed on $LatLng');
        },
        trafficEnabled: true,
        zoomControlsEnabled: true,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        compassEnabled: true,
        markers: _marker,
        polylines: _polylines,
        circles: _circle,
        polygons: _polygon,
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: _addNewMarker,
            child: const Icon(Icons.location_on_outlined),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            onPressed: _goBackToMyLocation,
            child: const Icon(Icons.my_location),
          ),
        ],
      ),
    );
  }

  void _addNewMarker() {
    _marker.add(
      Marker(
        markerId: MarkerId('new_marker'),
        position: LatLng(25.7726769782105, 88.9264290779829),
        draggable: true,
        onDragStart: (LatLng startLatLng) {
          print('Start latlng $startLatLng');
        },
        onDragEnd: (LatLng startLatLng) {
          print('Stop latlong $startLatLng');
        },
      ),
    );
    setState(() {});
  }

  void _goBackToMyLocation() {
    _mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        const CameraPosition(
          zoom: 7,
          target: LatLng(25.747399180983482, 89.46055303058475),
        ),
      ),
    );
  }
}
