import 'package:flutter/material.dart';
import 'package:click_clinic/services/database.dart';



class NameSet extends StatefulWidget {
  @override
  _NameSetState createState() => _NameSetState();
}

class _NameSetState extends State<NameSet> {
  
  String _currentName = '';
  String error = '';
  final _formKey = GlobalKey<FormState>();
  DatabaseService db = DatabaseService();
  

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        title: Text('Name Edit'),
        backgroundColor: Colors.blue[300],
          elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 80.0),
        child: Center(child: 
        Form(
        key: _formKey,
        child:Column(
        children: <Widget>[
          SizedBox(height: 50.0,),
          Row(children: <Widget>[
            Icon(Icons.person),
            Text('     Modifier votre numero tel'),
          ],),
          SizedBox(height: 20.0),
          TextFormField(
            initialValue: db.getNom().toString(),
            /*decoration: InputDecoration(
                hintText: _currentphone,
              ),*/
            //create a const decoration in shared folder
              validator: (val) => (val.isEmpty ) ? 'Entrer un nom valide' : null,
              onChanged: (val) {
                 setState(() => _currentName = val);
              },
          ),
          SizedBox(height: 20.0),
          RaisedButton(
            child: Text('Validate'),
            onPressed: () async {
                if (_formKey.currentState.validate()){
                  db.updateNom(_currentName);
                  //Navigator.pop(context);
                  setState(() => error = 'updated :)'); 
                  print(_currentName);
                  }
                  }
            ),
            SizedBox(height: 100),
            Text(
              error, 
              style: TextStyle(color: Colors.greenAccent[400], fontSize: 50.0),
            ),

        ]
      ) ,)
      ,),
      )
    );
  }
}