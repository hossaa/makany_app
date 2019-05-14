import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class PopularAds extends StatefulWidget {
  @override
  _PopularAdsState createState() => _PopularAdsState();
}

class _PopularAdsState extends State<PopularAds> {
  // final Completer<GoogleMapController> mapController;
  Completer<GoogleMapController> _controller = Completer();

  final url = 'http://m.delightsapp.net/api2.jsp?do=GetAllAds';
  List data;
  Future<String> getDat() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {'Accept': 'application/json'});
    setState(() {
      var extractdata = json.decode(response.body);
      data = extractdata['AllAds'];
    });
    return 'Success!';
  }

  @override
  void initState() {
    getDat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Makany'),
        elevation: 0,
      ),
      body: FutureBuilder(
        future: getDat(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return Center(child: const Text('Loading...'));
          }
          return Stack(
            children: <Widget>[
              // =========mapview=============
              GoogleMap(
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                initialCameraPosition:
                    CameraPosition(target: LatLng(23.8859, 45.0792), zoom: 5.5),
                // markers: snapshot.data (
                //   Marker(
                //     markerId: MarkerId(snapshot.data['id']),
                //     position: LatLng(snapshot.data['lat'].latitude,
                //         snapshot.data['lon'].longitude),
                //     icon: BitmapDescriptor.defaultMarkerWithHue(
                //         BitmapDescriptor.hueAzure),
                //     infoWindow: InfoWindow(
                //       title: snapshot.data['titlear'],
                //       snippet: snapshot.data['price'].toString(),
                //     ),
                //   ),
                // ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 450),
                  child: SizedBox(
                    height: 80,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: data.length,
                      itemBuilder: (builder, index) {
                        return SizedBox(
                          width: 340,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Card(
                              elevation: 14,
                              child: Center(
                                child: ListTile(
                                  title: Text(data[index]['titlear']),
                                  subtitle:
                                      Text(data[index]['price'].toString()),
                                  leading: Container(
                                    height: 60,
                                    width: 100,
                                    child: data[index]['img'].isNotEmpty
                                        ? ClipRRect(
                                            child: Image.network(
                                                data[index]['img'],
                                                fit: BoxFit.cover),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(2)),
                                          )
                                        : CircleAvatar(
                                            child: Icon(
                                              Icons.android,
                                              color: Colors.white,
                                            ),
                                            backgroundColor: Colors.pink,
                                          ),
                                  ),
                                  onTap: () async {
                                    final GoogleMapController controller =
                                        await _controller.future;
                                    await controller.animateCamera(
                                        CameraUpdate.newCameraPosition(
                                            CameraPosition(
                                                target: LatLng(
                                                    data[index]['lat'].latitude,
                                                    data[index]['lon']
                                                        .longitude),
                                                zoom: 16,
                                                tilt: 50,
                                                bearing: 45)));
                                  },
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      //    Stack(
      //     children: <Widget>[
      //       GoogleMap(
      //         onMapCreated: (GoogleMapController controller) {},
      //       initialCameraPosition: CameraPosition(
      //     target: ,
      //     zoom: 12,
      //   ),
      //         myLocationEnabled: true,
      //         mapType: MapType.normal,
      //         // markers: StreamBuilder(),
      //       ),
      //     ],
      //   ),
    );
  }
}

// class MapDetails extends StatelessWidget {
//   final LatLng initialPosition;
//   final Completer<GoogleMapController> mapController;
//   final List<AsyncSnapshot> documents;
//   const MapDetails({
//     Key key,
//     @required this.documents,
//     @required this.initialPosition,
//     @required this.mapController,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return GoogleMap(
//       initialCameraPosition: CameraPosition(target: initialPosition, zoom: 12),
//       markers: documents.map(
//         (document) => Marker(
//             markerId: MarkerId(document.data['id']),
//             icon: BitmapDescriptor.defaultMarker,
//             position:
//                 LatLng(document['lat'].latitude, document['lon'].longitude),
//             infoWindow: InfoWindow(title: document['titlear'])),
//       ),
//     );
//   }
// }
