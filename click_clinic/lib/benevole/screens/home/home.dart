import 'package:click_clinic/benevole/models/user.dart';
import 'package:click_clinic/benevole/screens/home/services.dart';
import 'package:click_clinic/benevole/screens/home/settings.dart';
import 'package:click_clinic/benevole/services/auth.dart';
import 'package:click_clinic/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:click_clinic/benevole/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget { 

  final AuthService _auth = AuthService();
  
  //set a route between home nd settings
  Future navigateToSettings(context) async { 
    Navigator.push(context,MaterialPageRoute(builder: (context) => Settings()));
  }
  //set a route between home nd services
  Future navigateToServices(context) async { 
    Navigator.push(context,MaterialPageRoute(builder: (context) => Services()));
  }

  @override
  Widget build(BuildContext context) {

    User user = Provider.of<User>(context);

    return StreamBuilder<UserData>( //the provider to bypass user name & photo & disponibility
          stream: DatabaseService(uid: user.uid).benevole,
          builder: (context, snapshot) {
            if (snapshot.hasData){
              UserData userData = snapshot.data;
          return Scaffold(
        appBar : AppBar(
          title: Text('Home'),
          backgroundColor: Colors.blue[300],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              onPressed:() async {
                await _auth.signOut();
              }, 
              icon: Icon(Icons.person, color: Colors.blueAccent), 
              label: Text('Deconnexion', style: TextStyle(color: Colors.blueAccent),),
              )
          ],
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 150.0,),
              Text('Bienvenue  '+ userData.nom),
              SizedBox(height: 80.0,),
              RaisedButton(
                child: Text('Modifier vos information '),
                onPressed: (){ navigateToSettings(context);}
                ),
              SizedBox(height: 20.0),
              RaisedButton(
                child: Text('  Modifier vos services  '),
                onPressed: (){ navigateToServices(context);}
                ),
            ]
          )
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
          )
        ),
      );
      }else return Loading();
     }
    );
  }
}