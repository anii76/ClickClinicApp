import 'package:click_clinic/screens/benevole/authenticate/address.dart';
import 'package:click_clinic/screens/benevole/authenticate/inscription.dart';
import 'package:click_clinic/screens/benevole/authenticate/sang.dart';
import 'package:click_clinic/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:location/location.dart';

class SetServices extends StatefulWidget {
  Inscription user;
  SetServices({this.user});

  @override
  _SetServicesState createState() => _SetServicesState(user: user);
}

class _SetServicesState extends State<SetServices> {
  Inscription user;
  _SetServicesState({this.user});

  bool val1 = false, val2 = false, val3 = false;
  String _password = '';
  bool loading = false;
  Location location = new Location();
  Geoflutterfire geo = Geoflutterfire();

  void _assign() {
    user.setService1(val1);
    user.setService2(val2);
    user.setService3(val3);
    user.setDescription(_password);
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body: Stack(children: [
              Container(
                color: Color(0xFFF4F8F9),
              ),
              Container(
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
                alignment: Alignment(0, -0.6),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Finalisez votre inscription',
                    style: TextStyle(
                      fontFamily: 'Poppins-Medium',
                      fontSize: MediaQuery.of(context).size.height / 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, -0.5),
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      'Sélectionnez vos services',
                      style: TextStyle(
                        fontFamily: 'Poppins-Light',
                        fontSize: MediaQuery.of(context).size.height / 46,
                        color: Colors.white,
                      ),
                    )),
              ),
              Align(
                alignment: Alignment(-0.95, -0.85),
                //return button
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.height / 30,
                    child: Image.asset("assets/icones/retour.png"),
                    backgroundColor: Colors.white12,
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, -0.3),
                child: SizedBox(
                  width: 150, // change
                  height: 150, // change
                  child: Card(
                    color: Colors.white,
                    child: Image.asset("assets/images/add.png"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, 0.3),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50.0), //change
                  child: Wrap(alignment: WrapAlignment.center, children: [
                    Row(
                      children: <Widget>[
                        Checkbox(
                          value: val1,
                          onChanged: (bool value) {
                            setState(() {
                              val1 = value;
                              _assign();
                            });
                          },
                        ),
                        Text(
                          'Apporter des médicaments',
                          style: TextStyle(
                            fontFamily: 'Poppins-Regular',
                            fontSize: 17, //change
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Checkbox(
                          value: val2,
                          onChanged: (bool value) {
                            setState(() {
                              val2 = value;
                              _assign();
                            });
                          },
                        ),
                        Text(
                          'Donner du sang',
                          style: TextStyle(
                            fontFamily: 'Poppins-Regular',
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Checkbox(
                          value: val3,
                          onChanged: (bool value) {
                            setState(() {
                              val3 = value;
                              _assign();
                            });
                          },
                        ),
                        Text(
                          'Loger des patients',
                          style: TextStyle(
                            fontFamily: 'Poppins-Regular',
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: ' Autres services',
                        hintStyle: TextStyle(
                          fontSize: 18, //change
                          color: Colors.grey[400],
                          fontFamily: 'Poppins-Light',
                        ),
                      ),
                      style: TextStyle(fontFamily: 'Poppins-Regular'),
                      onChanged: (val) {
                        setState(() => _password = val);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ]),
                ),
              ),
              Align(
                alignment: Alignment(0, 0.8),
                child: SizedBox(
                  width: 250, //change
                  height: 60, //change
                  child: RaisedButton(
                    onPressed: () {
                      _assign();
                      _getLocation();
                      print(user.getNom());
                      print(user.getPassword());
                      //if sang then navigate to sang instead
                      if (val2) {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return SangService(
                              user: user,
                            );
                          },
                        ));
                      } else {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return SetAdresse(
                              user: user,
                            );
                          },
                        ));
                      }
                    },
                    child: Text(
                      "Suivant",
                      style: TextStyle(
                          fontFamily: 'Poppins-Medium',
                          fontSize: 19, //change
                          color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    color: Color(0xFF00B9FF),
                  ),
                ),
              ),
            ]),
          );
  }

  _getLocation() async {
    var pos = await location.getLocation();
    GeoFirePoint _point =
        geo.point(latitude: pos.latitude, longitude: pos.longitude);
    print(_point.data);
    user.setLocation(_point.data);
  }
}
