import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:location/location.dart';

class Medecins extends StatefulWidget {
  @override
  _MedecinsState createState() => _MedecinsState();
}

class _MedecinsState extends State<Medecins> {
  String dropdownValue = '  Choisissez la spécialité';
  var sp = <String>[
    '  Choisissez la spécialité',
    '  Cardiologue',
    '  Dentiste',
    '  Ophtamologue'
  ];

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(35.2082103, -0.6333336),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(35.2082103, -0.6333336),
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
          myLocationEnabled: true,

        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2.36, //apply everywhere
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [
                  0.3,
                  0.7,
                  0.9
                ],
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
              "Médecins",
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
                Navigator.pop(context);
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
              child: Image.asset("assets/images/groupe-medecins.png"),
            ),
            SizedBox(
              child: RaisedButton(
                color: Colors.white,
                onPressed: () {},
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 25,
                      child: Icon(Icons.search, color: Colors.white),
                      backgroundColor: Color(0xFF00B3FA),
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
        Padding(
          padding: EdgeInsets.only(top: 305, left: 90, right: 30),
          child: DropdownButton<String>(
              value: dropdownValue,
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 20,
              style: dropdownValue == sp[0]
                  ? TextStyle(
                      fontSize: 19,
                      color: Colors.grey[700],
                      fontFamily: 'Poppins-Medium')
                  : TextStyle(
                      fontSize: 21,
                      color: Color(0xB3000000),
                      fontFamily: 'SegoeUI'),
              items: sp.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              }),
        )
      ]),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('ESI SBA'),
        icon: Icon(Icons.computer)
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}

//not responsive
//include a streamBuilder to retreive data
//add markers and modify map's UI
//interactive map --
//location