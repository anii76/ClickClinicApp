import 'package:click_clinic/screens/benevole/authenticate/address.dart';
import 'package:click_clinic/screens/benevole/authenticate/inscription.dart';
import 'package:click_clinic/screens/benevole/authenticate/sang.dart';
import 'package:click_clinic/screens/benevole/home/navigator.dart';
import 'package:click_clinic/screens/benevole/wrapper.dart';
import 'package:click_clinic/services/auth.dart';
import 'package:click_clinic/shared/acceuil.dart';
import 'package:click_clinic/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:click_clinic/services/database.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:location/location.dart';

//this is the final

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
  final DatabaseService db = DatabaseService();
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
                      'selectionnez vos services',
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
                  alignment: Alignment(0, 0.3),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:50.0),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
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
                          Text('Medicament'),
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
                               /* Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return SetGroupeSanguin(); //puis retour
                                  },
                                ));*/
                              });
                            },
                          ),
                          Text('Don de sang'),
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
                          Text('logement'),
                        ],
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: ' Autres services',
                          hintStyle: TextStyle(
                            fontSize: 18,
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
            alignment: Alignment(0, 0.9),
            child: SizedBox(
              height: 50,
              child: RaisedButton.icon(
                onPressed: () {
                  _assign();
                  _getLocation();
                  print(user.getNom());
                  print(user.getPassword());
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return SetAdresse(user: user,);
                    },
                  ));
                },
                icon: Icon(Icons.person_pin),
                label:Text(
                  '    Suivant    ',
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

//collect info
//db.updateDescription(_password);
//db.updateService1(val1);
//db.updateService2(val2);
//db.updateService3(val3);
/*Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Try();
                      },));*/
