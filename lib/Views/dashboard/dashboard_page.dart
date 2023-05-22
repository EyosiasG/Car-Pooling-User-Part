import 'dart:async';
import 'package:car_pool_app/Constants/styles/colors.dart';
import 'package:car_pool_app/Views/trips/trips_list.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

import '../trips/search_trip.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final Completer<GoogleMapController> _controllerGoogleMap = Completer();
  late GoogleMapController newgoogleMapController;
  static const CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(37.427961335580664, -122.085749655962), zoom: 14.4746);

  late Position currentPosition;
  var geoLocator = Geolocator();
  double bottomPaddingMap = 0;

  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;

    LatLng latLngPosition = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition =
        CameraPosition(target: latLngPosition, zoom: 14.0);
    newgoogleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SearchTrip(),
      // body: Stack(
      //   children: [
      //     GoogleMap(
      //       padding: EdgeInsets.only(bottom: bottomPaddingMap),
      //       myLocationEnabled: true,
      //       zoomGesturesEnabled: true,
      //       zoomControlsEnabled: true,
      //       mapType: MapType.normal,
      //       myLocationButtonEnabled: true,
      //       initialCameraPosition: _kGooglePlex,
      //       onMapCreated: (GoogleMapController controller) {
      //         _controllerGoogleMap.complete(controller);
      //         newgoogleMapController = controller;
      //         setState(() {
      //           bottomPaddingMap = 300.0;
      //         });

      //         locatePosition();
      //       },
      //     ),
      //     Positioned(
      //         left: 0.0,
      //         right: 0.0,
      //         bottom: 0.0,
      //         child: Container(
      //           height: 300.0,
      //           decoration: const BoxDecoration(
      //               color: ColorsConst.white,
      //               borderRadius: BorderRadius.only(
      //                   topLeft: Radius.circular(18.0),
      //                   topRight: Radius.circular(18.0)),
      //               boxShadow: [
      //                 BoxShadow(
      //                     color: ColorsConst.black,
      //                     blurRadius: 16.0,
      //                     spreadRadius: 0.5,
      //                     offset: Offset(0.7, 0.7))
      //               ]),
      //           child: Padding(
      //             padding: const EdgeInsets.symmetric(
      //                 horizontal: 24.0, vertical: 18.0),
      //             child: Column(
      //               children: [
      //                 const SizedBox(
      //                   height: 6.0,
      //                 ),
      //                 const Text(
      //                   "Hello,style",
      //                   style: TextStyle(fontSize: 12.0),
      //                 ),
      //                 const Text(
      //                   "Choose destination",
      //                   style: TextStyle(fontSize: 20.0),
      //                 ),
      //                 const SizedBox(
      //                   height: 20.0,
      //                 ),
      //                 Container(
      //                   decoration: BoxDecoration(
      //                       color: Colors.white,
      //                       borderRadius: BorderRadius.circular(5.0)),
      //                   child: Padding(
      //                     padding: const EdgeInsets.all(12.0),
      //                     child: Row(children: const [
      //                       Icon(Icons.search, color: ColorsConst.black),
      //                       SizedBox(
      //                         width: 10.0,
      //                       ),
      //                       Text("Search destination")
      //                     ]),
      //                   ),
      //                 )
      //               ],
      //             ),
      //           ),
      //         ))
      //   ],
      //),
      // );
    );
  }
}
