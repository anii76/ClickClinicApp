import 'package:click_clinic/screens/benevole/authenticate/services.dart';
import 'package:flutter/material.dart';

class SetGroupeSanguin extends StatefulWidget {
  @override
  _SetGroupeSanguinState createState() => _SetGroupeSanguinState();
}

class _SetGroupeSanguinState extends State<SetGroupeSanguin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Don de sang')
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