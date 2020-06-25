import 'package:click_clinic/screens/benevole/authenticate/inscription.dart';
import 'package:click_clinic/screens/benevole/authenticate/logement.dart';
import 'package:click_clinic/screens/benevole/authenticate/sang.dart';
import 'package:click_clinic/screens/benevole/home/navigator.dart';
import 'package:click_clinic/services/auth.dart';
import 'package:click_clinic/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:click_clinic/services/database.dart';

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

  final AuthService _auth = AuthService();
  String _error = '';
  bool loading = false;

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
                    return Try(); //puis retour
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
      setState(() => loading = true);
      dynamic result = await _auth.inscription(
          user.getEmail(),
          user.getPassword(),
          user.getNom(),
          user.getTel(),
          user.getDescription(),
          user.getService1(),
          user.getService2(),
          user.getService3());
      //change if try-catch bloc worked
      //check for network connectivity here
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
        : Material(
            child: Center(
              child: Column(children: [
                //refactor later
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: BoxDecoration(
                    color: Color(0xFF00B9FF),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(77),
                        bottomRight: Radius.circular(77)),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Text('Medicament'),
                    Checkbox(
                      value: val1,
                      onChanged: (bool value) {
                        setState(() {
                          val1 = value;
                          _assign();
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text('Don de sang'),
                    Checkbox(
                      value: val2,
                      onChanged: (bool value) {
                        setState(() {
                          val2 = value;
                          _assign();
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return SetGroupeSanguin(); //puis retour
                            },
                          ));
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text('logement'),
                    Checkbox(
                      value: val3,
                      onChanged: (bool value) {
                        setState(() {
                          val3 = value;
                          _assign();
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return SetLogement(); //puis retour
                            },
                          ));
                        });
                      },
                    ),
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
                  obscureText: true,
                  onChanged: (val) {
                    setState(() => _password = val);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                RaisedButton(
                  onPressed: () {
                    _assign();
                    _register();
                  },
                  child: Text('Finalier votre inscription'),
                )
              ]),
            ),
          );
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
