import 'package:click_clinic/benevole/services/auth.dart';
import 'package:click_clinic/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignIn extends StatefulWidget {

  final Function toggleview ;
  SignIn ({this.toggleview});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  
  String error ='';
  final String connexion = 'assets/connexion.png';


  //text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: SingleChildScrollView(
            child:Column(mainAxisSize: MainAxisSize.min, children: [
        SizedBox(height: 60.0,),
        Image.asset(
            connexion,
            //alignment: Alignment.topCenter,
            //height: 100,
          ),
        SizedBox(height: 30.0,),
        Text(
          'Heureux de vous revoir !',
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
            RaisedButton(
              onPressed: () async {
                if (_formKey.currentState.validate()){
                  setState(() => loading = true);
                  dynamic result = await _auth.connexion(email, password);
               
                if (result == null){
                   setState(() {
                     error = 'Could not sign in with those credentials';
                     loading = false;
                   });
                }
                }
              },
              color: Colors.blue[400],
              focusColor: Colors.blue[600],
              child: Text('Connexion', style: TextStyle(color: Colors.white),),
              ),
            FlatButton(
              onPressed: () {
                widget.toggleview();
              }, 
              child: Text('Inscription',
               style: TextStyle(decoration: TextDecoration.underline, color: Colors.blueGrey),)
              ),
            SizedBox(height: 12.0,),
            Text(
              error, 
              style: TextStyle(color: Colors.red, fontSize: 14.0),
            ),
          ]),
        )
      ]))
          ),
    );
  }
}
