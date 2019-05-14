import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:makany/menu_item/drawer.dart';
import 'package:makany/pages/home.dart';

class MyLocationPage extends StatefulWidget {
  final HomePage getDat;
  MyLocationPage({this.getDat});

  @override
  _MyLocationPageState createState() => _MyLocationPageState();
}

class _MyLocationPageState extends State<MyLocationPage> {
  var location = new Location();
  var currentLocation = LocationData;
  Completer<GoogleMapController> _controller = Completer();

  double zoomVal = 5;
  @override
  void initState() {
    super.initState();
  }

  Widget _googleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:
            CameraPosition(target: LatLng(26.8206, 30.8025), zoom: 10),
        myLocationEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {makany, makany2, makany3},
      ),
    );
  }

  Marker makany = Marker(
      markerId: MarkerId('makany1'),
      position: LatLng(26.8206, 30.8025),
      infoWindow: InfoWindow(title: 'egypt'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      onTap: () {});

  Marker makany2 = Marker(
      markerId: MarkerId('makany2'),
      position: LatLng(26.8206, 30.8025),
      infoWindow: InfoWindow(title: 'egypt'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      onTap: () {});
  Marker makany3 = Marker(
      markerId: MarkerId('makany3'),
      position: LatLng(26.8206, 30.8025),
      infoWindow: InfoWindow(title: 'egypt'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      onTap: () {});

  Widget _buildcontainer() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        height: 90,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(
              width: 10,
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child:
                  _boxes('assets/apartments.png', 28.0871, 30.7618, 'assuit'),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child:
                  _boxes('assets/apartments.png', 28.0871, 30.7618, 'assuit'),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child:
                  _boxes('assets/apartments.png', 28.0871, 30.7618, 'assuit'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _gotoLocation(double lat, double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(lat, long), zoom: 15, tilt: 50, bearing: 45)));
  }

  Widget _boxes(String _image, double lat, double long, String restutentname) {
    return GestureDetector(
      onTap: () {
        _gotoLocation(lat, long);
      },
      child: Container(
        child: FittedBox(
          child: Material(
            color: Colors.white,
            elevation: 12,
            borderRadius: BorderRadius.circular(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 220,
                  height: 90,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      fit: BoxFit.fill,
                      image: NetworkImage(_image),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: _myDeteilsContainer(restutentname),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _myDeteilsContainer(restutentname) {}
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerForLocation(),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Makany'),
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[_googleMap(context), _buildcontainer()],
      ),
    );
  }
}

// List<Marker> allMarkers = [];

// GoogleMapController _controller;

// @override
// void initState() {
//   super.initState();
//   allMarkers.add(Marker(
//       markerId: MarkerId('myMarker'),
//       draggable: true,
//       onTap: () {
//         print('Marker Tapped');
//       },
//       position: LatLng(40.7128, -74.0060)));
// }

// void mapCreated(controller) {
//   setState(() {
//     _controller = controller;
//   });
// }

// movetoBoston() {
//   _controller.animateCamera(CameraUpdate.newCameraPosition(
//     CameraPosition(
//         target: LatLng(42.3601, -71.0589),
//         zoom: 14.0,
//         bearing: 45.0,
//         tilt: 45.0),
//   ));
// }

// movetoNewYork() {
//   _controller.animateCamera(CameraUpdate.newCameraPosition(
//     CameraPosition(target: LatLng(40.7128, -74.0060), zoom: 12.0),
//   ));
// }
// body: Stack(children: [
// Container(
//   height: MediaQuery.of(context).size.height,
//   width: MediaQuery.of(context).size.width,
//   child: GoogleMap(
//     initialCameraPosition:
//         CameraPosition(target: LatLng(40.7128, -74.0060), zoom: 12.0),
//     markers: Set.from(allMarkers),
//     onMapCreated: mapCreated,
//   ),
// ),
// Align(
//   alignment: Alignment.bottomCenter,
//   child: InkWell(
//     onTap: movetoBoston,
//     child: Container(
//       height: 40.0,
//       width: 40.0,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20.0),
//           color: Colors.green),
//       child: Icon(Icons.forward, color: Colors.white),
//     ),
//   ),
// ),
// Align(
//   alignment: Alignment.bottomRight,
//   child: InkWell(
//     onTap: movetoNewYork,
//     child: Container(
//       height: 40.0,
//       width: 40.0,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20.0), color: Colors.red),
//       child: Icon(Icons.backspace, color: Colors.white),
//     ),
//   ),
// ),
// ]),
