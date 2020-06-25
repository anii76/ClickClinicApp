import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

import 'package:rxdart/rxdart.dart';

class Carte extends StatefulWidget {
  Carte({@required Key key ,double this.Width , double this.Height }) : super(key : key);
  final double Width;
  final double Height;

  @override

  State createState() => FireMapState();
}

class FireMapState extends State<Carte> {
  String collection;
  Firestore firestore = Firestore.instance;
  Geoflutterfire geo = Geoflutterfire();
  BehaviorSubject<double> radius = BehaviorSubject.seeded(100.0);
  Stream<dynamic> querry;
  StreamSubscription subscription;




  GoogleMapController mapController;
Location location = new Location();



build(context) {
  return Container(
      width: widget.Width,
      height: widget.Height,

      child: Stack(
      children: [
        GoogleMap(
            initialCameraPosition: CameraPosition(target: LatLng(24.150, -110.32), zoom: 10),
            onMapCreated: _onMapCreated,
            myLocationEnabled: true, // Add little blue dot for device location, requires permission from user
            mapType: MapType.normal,
            markers: SetOfMarkers,


        ),
        Positioned(
            bottom: 50,
            left: 10,
            child: Slider(
              min: 10.0,
              max: 500.0,
              divisions: 10,
              value: radius.value,
              label: 'Radius ${radius.value}km',
              activeColor: Colors.green,
              inactiveColor: Colors.green.withOpacity(0.2),
              onChanged: _updateQuery,
            )
        ),


      ]
  ));
}

Set<Marker> SetOfMarkers = Set();
  static var compteur = 0;
  void _add(double latitude , double longitude, String infoWindowText,String title, String id) {
    var markerIdVal = compteur.toString();
    compteur++;
    final MarkerId markerId = MarkerId(markerIdVal);

    // creating a new MARKER
    final Marker marker = Marker(

      markerId: markerId,
      position: LatLng(latitude,longitude),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(snippet: infoWindowText, title: title),
      onTap: (){}
//pass doc id to next widget
    );

    setState(() {
      // adding a new marker to map
      SetOfMarkers.add(marker);
    });
  }






void _onMapCreated(GoogleMapController controller) {
  setState(() {

    mapController = controller;
  });
  _animateToUser();
}







  //del name?

  Future<DocumentReference> _addGeoPoint() async {
    var pos = await location.getLocation();
    GeoFirePoint point = geo.point(latitude: pos.latitude, longitude: pos.longitude);
    return firestore.collection('Benevole').add({
      'Location': point.data,
    });
  }

_animateToUser() async {
  var pos = await location.getLocation();
  mapController.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: LatLng(pos.latitude, pos.longitude),
        zoom: 17.0,
      )
  )
  );
}

//change accordingly (speciality -> adresse), this is for adding markers
  void _updateMarkers(List<DocumentSnapshot> documentList) {
    print(documentList);
    SetOfMarkers.clear();
    documentList.forEach((DocumentSnapshot document) {
      GeoPoint pos = document.data['Location']['geopoint'];
      double distance = document.data['distance'];
      _add(pos.latitude,pos.longitude,document.data['Adress'],document.data['Name'],document.documentID);
    });
  }


 method(String collection) async {_startQuery(collection);}

  _startQuery(String collection) async {
    // Get users location
    var pos = await location.getLocation();
    double lat = pos.latitude;
    double lng = pos.longitude;


    // Make a referece to firestore
    var ref = firestore.collection(collection);
    GeoFirePoint center = geo.point(latitude: lat, longitude: lng);

    // subscribe to query
    subscription = radius.switchMap((rad) {
      return geo.collection(collectionRef: ref).within(
          center: center,
          radius: rad,
          field: 'Location',
          strictMode: false
      );
    }).listen(_updateMarkers);
  }

  _updateQuery(value) {
    final zoomMap = {
      100.0: 12.0,
      200.0: 10.0,
      300.0: 7.0,
      400.0: 6.0,
      500.0: 5.0
    };
    final zoom = zoomMap[value];
    mapController.moveCamera(CameraUpdate.zoomTo(zoom));

    setState(() {
      radius.add(value);
    });
  }

  @override
  dispose() {
    subscription.cancel();
    super.dispose();
  }




}





