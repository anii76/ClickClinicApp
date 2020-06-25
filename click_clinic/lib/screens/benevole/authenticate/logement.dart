import 'package:click_clinic/screens/benevole/authenticate/services.dart';
import 'package:flutter/material.dart';

class SetLogement extends StatefulWidget {
  @override
  _SetLogementState createState() => _SetLogementState();
}

class _SetLogementState extends State<SetLogement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logement')
        ),
      body: RaisedButton(
        child: Text('Retour'),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context){
                        return SetServices();  //puis retour
                      },)); 
                  
        }
      ),

    );
  }
}