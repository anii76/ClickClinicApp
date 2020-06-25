import 'package:flutter/material.dart';
import 'package:click_clinic/shared/loading.dart';
import 'package:click_clinic/services/database.dart';
import 'package:click_clinic/models/user.dart';


class PhoneSet extends StatefulWidget {
  @override
  _PhoneSetState createState() => _PhoneSetState();
}

class _PhoneSetState extends State<PhoneSet> {

  String _currentPhone = '';
  String error = '';
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  DatabaseService db = DatabaseService();

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        title: Text('Phone Reset'),
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
            Icon(Icons.phone),
            Text('     Modifier votre numero tel'),
          ],),
          SizedBox(height: 20.0),
          TextFormField(
            initialValue: db.getTel().toString(),
            /*decoration: InputDecoration(
                hintText: _currentphone,
              ),*/
            //create a const decoration in shared folder
              validator: (val) => (val.isEmpty || val.length != 10 ) ? 'Entrer un tel valide' : null,
              onChanged: (val) {
                 setState(() => _currentPhone = val);
              },
          ),
          SizedBox(height: 20.0),
          RaisedButton(
            child: Text('Validate'),
            onPressed: () async {
                if (_formKey.currentState.validate()){
                  db.updateTel(_currentPhone);
                  //Navigator.pop(context);
                  setState(() => error = 'updated :)'); 
                  print(_currentPhone);
                  }
                  }
            ),
            SizedBox(height: 150),
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
