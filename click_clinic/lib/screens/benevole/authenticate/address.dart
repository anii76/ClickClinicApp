import 'package:click_clinic/screens/benevole/authenticate/services.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:click_clinic/screens/benevole/authenticate/inscription.dart';
import 'package:click_clinic/services/auth.dart';
import 'package:click_clinic/shared/acceuil.dart';
import 'package:click_clinic/shared/loading.dart';
import 'package:click_clinic/services/database.dart';

class SetAdresse extends StatefulWidget {
  Inscription user;
  SetAdresse({@required this.user});
  @override
  _SetAdresseState createState() => _SetAdresseState(user: user);
}

//this page is put before services
class _SetAdresseState extends State<SetAdresse> {
  Inscription user;
  _SetAdresseState({this.user});

  final DatabaseService db = DatabaseService();

  final AuthService _auth = AuthService();
  String _error = '';
  bool loading = false;

  Location location = new Location();
  Geoflutterfire geo = Geoflutterfire();
  GeoFirePoint point;
  GoogleMapController _controller;
  final _formKey = GlobalKey<FormState>();
  String _adr;
  CameraPosition position =
      CameraPosition(target: LatLng(28.000, 3.000), zoom: 3);

  void _showVerifyEmailSentDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Verify your account"),
          content:
              new Text("Link to verify account has been sent to your email"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Dismiss"),
              onPressed: () {
                //SignIn();
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("Go Home"),
              onPressed: () {
                //SignIn();
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Acceuil(); //this is supposed to work
                  },
                ));
              },
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Error"),
          content: new Text(_error),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Dismiss"),
              onPressed: () {
                //SignIn();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _register() async {
    try {
      print(user.getNom());
      setState(() => loading = true);
      dynamic result = await _auth.inscription(user);
      print("Result: $result");
      if (result != null) {
        setState(() {
          _auth.sendEmailVerification();
          _showVerifyEmailSentDialog();
          loading = false;
        });
      }
    } catch (e) {
      print('Errror: $e');
      setState(() {
        _error = e.message;
        _showErrorDialog();
        loading = false;
      });
    }
  }

  void _assign(){
    //user.setLocation(point.data);
    user.setAdresse(_adr);
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body: Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: position,
                    onMapCreated: _onMapCreadted,
                    myLocationEnabled: true,
                  ),
                ),
                Container(
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Finalisez votre inscription',
                        style: TextStyle(
                          fontFamily: 'Poppins-Medium',
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'saisir votre adresse',
                        style: TextStyle(
                          fontFamily: 'Poppins-Light',
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.6,
                  decoration: BoxDecoration(
                    color: Color(0xFF00B9FF),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(77),
                        bottomRight: Radius.circular(77)),
                  ),
                ),
                Align(
                  alignment: Alignment(0, -0.28),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.18,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(87),
                          right: Radius.circular(87)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        SizedBox(
                          width: 8,
                        ),
                        CircleAvatar(
                          radius: 25,
                          child: Icon(Icons.search, color: Colors.white),
                          backgroundColor: Color(0xFF00B3FA),
                        ),
                        Flexible(
                          child: Form(
                            key: _formKey,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 0),
                                    hintText: ' Tappez votre adresse',
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[400],
                                      fontFamily: 'Poppins-Light',
                                    ),
                                    labelText: ' Adresse',
                                    labelStyle: TextStyle(
                                        fontFamily: 'SegoeUI',
                                        color: Color(0xFF00B9FF))),
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(fontFamily: 'Poppins-Regular'),
                                validator: (val) => (val.isEmpty)
                                    ? 'Entrer adresse valide'
                                    : null,
                                onChanged: (val) {
                                  setState(() => _adr = val);
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, 0.9),
                  child: SizedBox(
                    height: 50,
                    child: RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()){
                          _assign();
                          _register();
                        }
                      },
                      child: Text(
                        '    Inscription    ',
                        style: TextStyle(
                            fontFamily: 'Poppins-Medium',
                            fontSize: 16,
                            color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      color: Color(0xFF00B9FF),
                    ),
                  ),
                ),
              ],
            ),
          );
  }

  _onMapCreadted(GoogleMapController controller) {
    setState(() {
      _controller = controller;
    });
    _animateToUser();
  }

  _animateToUser() async {
    var pos = await location.getLocation();
    GeoFirePoint _point =
        geo.point(latitude: pos.latitude, longitude: pos.longitude);
    print(_point.data);

    
      point = _point;
      //user.setLocation(point.data);
      print(_point.data);
    

    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(pos.latitude, pos.longitude),
      zoom: 17.0,
    )));
  }
}
