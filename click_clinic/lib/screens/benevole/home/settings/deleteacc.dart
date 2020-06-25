import 'package:click_clinic/services/auth.dart';
import 'package:click_clinic/shared/acceuil.dart';
import 'package:flutter/material.dart';

class DeleteAccount extends StatefulWidget {
  @override
  _DeleteAccountState createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
  final AuthService _auth = AuthService();
  String _error = 'Are you sure you want to delete your account';

  void _showConfirmDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Delete Account"),
          content: new Text(_error),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Delete"),
              onPressed: () async {
                try {
                  await _auth.deleteUser();
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Acceuil();
                    },
                  ));
                } catch (e) {
                  print('Errror: $e');
                  setState(() {
                    _error = e.message;
                    _showErrorDialog();
                  });
                }
              },
            ),
            new FlatButton(
              child: new Text("Dismiss"),
              onPressed: () {
                //SignIn();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Error"),
          content: new Text(_error),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Dismiss"),
              onPressed: () {
                //SignIn();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  final _formKey = GlobalKey<FormState>();

  String _resetPassword = '';
  String _confirmPassword;
  bool _isEmailVerified;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SizedBox(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 50.0 ),
                    child: Form(
                      key: _formKey,
                      child: Column(children: [
                        TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock_open,
                                  color: Colors.grey[400], size: 40),
                              hintText: ' Tappez votre mot de passe',
                              hintStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.grey[400],
                                fontFamily: 'Poppins-Light',
                              ),
                              labelText: ' Mot de passe',
                              labelStyle: TextStyle(
                                  fontFamily: 'SegoeUI',
                                  color: Color(0xFF00B9FF))),
                          style: TextStyle(fontFamily: 'Poppins-Regular'),
                          validator: (val) => val.length < 6
                              ? 'mot de passe doit etre au min 6 caracteres'
                              : null,
                          obscureText: true,
                          onChanged: (val) {
                            setState(() => _resetPassword = val);
                          },
                        ),
                        SizedBox(),
                        TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock_open,
                                  color: Colors.grey[400], size: 40),
                              hintText: ' Tappez votre mot de passe',
                              hintStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.grey[400],
                                fontFamily: 'Poppins-Light',
                              ),
                              labelText: ' Confirmer mot de passe',
                              labelStyle: TextStyle(
                                  fontFamily: 'SegoeUI',
                                  color: Color(0xFF00B9FF))),
                          style: TextStyle(fontFamily: 'Poppins-Regular'),
                          validator: (val) => val != _resetPassword
                              ? 'les champs ne sont pas identiques'
                              : null,
                          obscureText: true,
                          onChanged: (val) {
                            setState(() => _confirmPassword = val);
                          },
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        SizedBox(
                          child: RaisedButton(
                              onPressed: () async {
                                String email;
                                await _auth.getCurrentUserInfo().then((value) => email = value.email);
                                await _auth.connexion(email, _resetPassword);
                                _showConfirmDialog();
                              } ,
                              shape: RoundedRectangleBorder(
                                  //changed
                                  borderRadius: BorderRadius.circular(50)),
                              color: Color(0xFF00B9FF),
                              focusColor: Colors.blue[400],
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '      Delete Account',
                                      style: TextStyle(
                                          fontSize: 17.5,
                                          color: Colors.white,
                                          fontFamily: 'SegoeUI'),
                                    ),
                                    SizedBox(width: 40),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                      size: 19,
                                    )
                                  ])),
                          width: 250,
                          height: 45,
                        ),
                      ]),
                    )))));
  }
}
