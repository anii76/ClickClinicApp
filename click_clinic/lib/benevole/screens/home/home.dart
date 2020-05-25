import 'package:click_clinic/benevole/models/user.dart';
import 'package:click_clinic/benevole/screens/home/services.dart';
import 'package:click_clinic/benevole/screens/home/settings.dart';
import 'package:click_clinic/benevole/services/auth.dart';
import 'package:click_clinic/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:click_clinic/benevole/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final AuthService _auth = AuthService();
  int language = 0;
  final List<String> home = ['Acceuil', 'Home', 'الرئيسية'];
  final List<String> deconnexion = ['Deconnexion', 'Sign out', 'تسجيل الخروج'];
  final List<String> bienvenue = ['Bienvenue', 'Welcome', 'مرحبا'];
  final List<String> settings = [
    'Modifier vos informations ',
    'Edit your informations',
    'تعديل المعلومات الشخصية'
  ];
  final List<String> services = [
    'Modifier vos services',
    'Edit your services',
    'تعديل الخدمات'
  ];

  //set a route between home nd settings
  Future navigateToSettings(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Settings()));
  }

  //set a route between home nd services
  Future navigateToServices(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Services()));
  }

  @override
  Widget build(BuildContext context) {

    User user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        //the provider to bypass user name & photo & disponibility
        stream: DatabaseService(uid: user.uid).benevole,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Scaffold(
              appBar: AppBar(
                title: Text(home[language]),
                backgroundColor: Colors.blue[300],
                elevation: 0.0,
                actions: <Widget>[
                  FlatButton.icon(
                    onPressed: () async {
                      await _auth.signOut();
                    },
                    icon: Icon(Icons.person, color: Colors.blueAccent),
                    label: Text(
                      deconnexion[language],
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  )
                ],
              ),
              body: Center(
                  child: Column(children: [
                SizedBox(
                  height: 150.0,
                ),
                Text(bienvenue[language] + ' ' + userData.nom),
                SizedBox(
                  height: 80.0,
                ),
                RaisedButton(
                    child: Text(settings[language]),
                    onPressed: () {
                      navigateToSettings(context);
                    }),
                SizedBox(height: 20.0),
                RaisedButton(
                    child: Text(services[language]),
                    onPressed: () {
                      navigateToServices(context);
                    }),
                SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 50,
                      height: 30,
                      child: RaisedButton(child: Text('Fr'), onPressed: () {
                        setState(() {
                          language = 0;
                        });
                      }),
                    ),
                    SizedBox(
                      width: 50,
                      height: 30,
                      child: RaisedButton(child: Text('En'), onPressed: () {
                        setState(() {
                          language = 1;
                        });
                      }),
                    ),
                    SizedBox(
                      width: 50,
                      height: 30,
                      child: RaisedButton(child: Text('Ar'), onPressed: () {
                        setState(() {
                          language = 2;
                        });
                      }),
                    ),
                  ],
                )
              ])),
            );
          } else
            return Loading();
        });
  }
}
