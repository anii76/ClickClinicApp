import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:click_clinic/patient/principal.dart';

class Pharmacies extends StatefulWidget {
  @override
  _PharmaciesState createState() => _PharmaciesState();
}

class _PharmaciesState extends State<Pharmacies> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2.36, //apply everywhere
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0.3, 0.7, 0.9],
                colors: [
                  Color(0xFF00D0E1),
                  Color(0xFF00B3FA),
                  Color(0xFF00B9FF),
                ]),
            //color: Color(0xFF00B9FF),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(77),
                bottomRight: Radius.circular(77)),
          ),
        ),
        SizedBox(
          child: Padding(
            padding: const EdgeInsets.only(top: 85, left: 260, right: 3),
            child: Text(
              "Pharmacies",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontFamily: 'Poppins-Regular'),
            ),
          ),
        ),
        SizedBox(
          child: Padding(
            padding: const EdgeInsets.only(top: 70, left: 30, right: 210),
            child: RaisedButton(
              color: Color(0xFF00B9FF),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Patient();
                  },
                ));
              },
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 10,
                    child: Image.asset("assets/icones/retour.png"),
                    backgroundColor: Color(0xFF00B9FF),
                  ),
                  Text(
                    " Accueil",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontFamily: 'Poppins-Light'),
                  ),
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ),
        Center(
          child: Column(children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 141),
              child: Image.asset("assets/images/pharmacie-ils.png"),
            ),
            SizedBox(
              child: RaisedButton(
                color: Colors.white,
                onPressed: () {
                  Scaffold.of(context).showSnackBar(SnackBar(
                   content: Text('Appuyer sur une pharmacie pour afficher les détails',
                     style: TextStyle(
                       fontFamily: 'Poppins-Light',
                     ),
                   )
                   ));
                },
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 25,
                      child: Icon(Icons.search, color: Colors.white),
                      backgroundColor: Color(0xFF00B3FA),
                    ),
                    Text(
                      "  Choisissez la spécialité",
                      style: TextStyle(
                        fontSize: 21,
                        color: Color(0xB3000000),
                        fontFamily: 'SegoeUI'
                      ),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
              ),
              width: 340,
              height: 70,
            ),
          ]),
        ),
      ]),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_boat),
      ),
      bottomSheet: Container(
              height: 55.0,
              width: double.infinity,
              color: Colors.white,
              child: Center(child: Text(
                'Besoin qu\'on vous l\'apporte d\'ailleurs ?',
                style: TextStyle(
                  fontSize: 17,
                  color: Color(0xFF00B3FA),
                  fontFamily: 'SegoeUI',
                ),
              ),),
      )
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
