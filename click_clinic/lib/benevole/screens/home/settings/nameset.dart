import 'package:flutter/material.dart';
import 'package:click_clinic/shared/loading.dart';
import 'package:click_clinic/benevole/services/database.dart';
import 'package:provider/provider.dart';
import 'package:click_clinic/benevole/models/user.dart';


class NameSet extends StatefulWidget {
  @override
  _NameSetState createState() => _NameSetState();
}

class _NameSetState extends State<NameSet> {
  
  String _currentName = '';
  String error = '';
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  @override
  Widget build(BuildContext context) {

    User user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).benevole,
      builder: (context, snapshot){
        if (snapshot.hasData){
          UserData userData = snapshot.data;

          return loading ? Loading : Scaffold(
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
            initialValue: userData.nom,
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
                  await DatabaseService(uid: user.uid).updateUserData(
                    _currentName ?? snapshot.data.nom,
                    userData.tel ?? snapshot.data.tel,
                    userData.service1 ?? snapshot.data.service1,
                    userData.service2 ?? snapshot.data.service2,
                    userData.service3 ?? snapshot.data.service3,
                    userData.description ?? snapshot.data.description,
                    userData.disponibilite ?? snapshot.data.disponibilite
                  );
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

  }else return Loading();
  });
  }
}