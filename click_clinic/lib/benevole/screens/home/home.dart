import 'package:click_clinic/benevole/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:click_clinic/benevole/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
          value: DatabaseService().benevole,
          child: Scaffold(
        appBar : AppBar(
          title: Text('Benevole'),
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
              SizedBox(height: 200.0,),
              RaisedButton(
                child: Text('Modifier vos information '),
                onPressed: (){}
                ),
              SizedBox(height: 20.0),
              RaisedButton(
                child: Text('  Modifier vos services  '),
                onPressed: (){}
                ),
            ]
          )
        )
      ),
    );
  }
}