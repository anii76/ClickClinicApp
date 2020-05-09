import 'package:click_clinic/benevole/services/auth.dart';
import 'package:click_clinic/shared/loading.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  
  final Function toggleview ;
  Register ({this.toggleview});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error ='';
  bool loading = false;

  //text field state
  String email = '';
  String password = '';
  String tel = '';
  String nom = 'Benevole';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: SingleChildScrollView(
            child:Column(mainAxisSize: MainAxisSize.min, children: [
        SizedBox(height: 200.0,),
        Text(
          'Inscrivez vous !',
        ),
        //Text form
        Form(
          key: _formKey,
          child: Column(children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Nom Complet',
              ),

              validator: (val) => (val.isEmpty) ? 'Entrer un nom valide' : null,
              onChanged: (val) {
                 setState(() => nom = val);
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Email',
              ),

              validator: (val) => (val.isEmpty || !val.contains('@')) ? 'Entrer email valide' : null,
              onChanged: (val) {
                 setState(() => email = val);
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Mot de passe',
              ),
              validator: (val) => val.length < 6 ? 'mot de passe doit etre au min 6 caracteres' : null,
              obscureText: true,
              onChanged: (val) {
                 setState(() => password = val);
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Telephone',
              ),

              validator: (val) => (val.isEmpty || val.length != 10) ? 'Entrer un tel valide' : null,
              onChanged: (val) {
                 setState(() => tel = val);
              },
            ),
            SizedBox(
              height: 20.0,
            ),

            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              onPressed: () async {
                if (_formKey.currentState.validate()){
                  setState(() => loading = true); 
                  dynamic result = await _auth.inscription(email, password, nom, tel);

                if (result == null){
                   setState(() {
                     error = 'please supply a valid email ';
                     loading = false;
                     });
                }
                }
              },
              color: Colors.blue[400],
              focusColor: Colors.blue[600],
              child: Text('Inscription', style: TextStyle(color: Colors.white),),
              ),
            FlatButton(
              onPressed: () {
                widget.toggleview();
              }, 
              child: Text('Connexion',
               style: TextStyle(decoration: TextDecoration.underline, color: Colors.blueGrey),)
              ),
            SizedBox(height: 12.0,),
            Text(
              error, 
              style: TextStyle(color: Colors.red, fontSize: 14.0),
            ),
          ]),
        )
      ])
          )
           ),
    );
  }
}