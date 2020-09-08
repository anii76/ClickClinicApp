import 'reset_password.dart';
import 'package:click_clinic/services/auth.dart';
import 'package:click_clinic/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleview;
  SignIn({this.toggleview});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  bool loading = false;
  String _error = '';
  final String connexion = 'assets/connexion.png';
  String _email = '';
  String _password = '';

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

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body: SingleChildScrollView(
              child: Stack(children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF4F8F9),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.6,
                  decoration: BoxDecoration(
                    color: Color(0xFF00B9FF),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(77),
                        bottomRight: Radius.circular(77)),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding:
                        EdgeInsets.all(MediaQuery.of(context).size.height / 18),
                    child: Image.asset(
                      connexion, //change asset
                      height: MediaQuery.of(context).size.height / 2.3,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 2.3,
                    ),
                    child: Text(
                      'Heureux de vous revoir !',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 38,
                        color: Colors.black,
                        fontFamily: 'Poppins-Regular',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    child: Padding(
                  padding: EdgeInsets.only(
                    left: 50.0, //change
                    right: 50.0, //change
                    top: MediaQuery.of(context).size.height / 2.2,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 28,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.mail_outline,
                            color: Colors.grey[400],
                            size: MediaQuery.of(context).size.height / 25,
                          ),
                          hintText: ' Tappez votre e-mail',
                          hintStyle: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 45,
                            color: Colors.grey[400],
                            fontFamily: 'Poppins-Light',
                          ),
                          labelText: ' Adresse e-mail',
                          labelStyle: TextStyle(
                              fontFamily: 'SegoeUI',
                              color: Color(0xFF00B9FF),
                              fontSize:
                                  MediaQuery.of(context).size.height / 55),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(fontFamily: 'Poppins-Regular'),
                        validator: (val) => (val.isEmpty || !val.contains('@'))
                            ? 'Entrer email valide'
                            : null,
                        onChanged: (val) {
                          setState(() => _email = val);
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 50,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock_open,
                            color: Colors.grey[400],
                            size: MediaQuery.of(context).size.height / 25,
                          ),
                          hintText: ' Tappez votre mot de passe',
                          hintStyle: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 45,
                            color: Colors.grey[400],
                            fontFamily: 'Poppins-Light',
                          ),
                          labelText: ' Mot de passe',
                          labelStyle: TextStyle(
                              fontFamily: 'SegoeUI',
                              color: Color(0xFF00B9FF),
                              fontSize:
                                  MediaQuery.of(context).size.height / 55),
                        ),
                        style: TextStyle(fontFamily: 'Poppins-Regular'),
                        validator: (val) => val.length < 6
                            ? 'mot de passe doit etre au min 6 caracteres'
                            : null,
                        obscureText: true,
                        onChanged: (val) {
                          setState(() => _password = val);
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 10,
                      ),
                      SizedBox(
                        child: RaisedButton(
                          onPressed: () async {
                            try {
                              if (_formKey.currentState.validate()) {
                                setState(() => loading = true);
                                dynamic result =
                                    await _auth.connexion(_email, _password);
                                //change if try-catch bloc worked
                                //check for network connectivity here
                                if (result != null) {
                                  setState(() {
                                    loading = false;
                                  });
                                }
                              }
                            } catch (e) {
                              print('Errror: $e');
                              setState(() {
                                _error = e.message;
                                _showErrorDialog();
                                loading = false;
                              });
                            }
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          color: Color(0xFF00B9FF),
                          focusColor: Colors.blue[400],
                          child: Text(
                            'CONNEXION',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height / 40,
                              color: Colors.white,
                              fontFamily: 'SegoeUI',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width / 1.5,
                        height: MediaQuery.of(context).size.height / 17,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 28,
                      ),
                      SizedBox(
                        child: FlatButton(
                            onPressed: () {
                              widget.toggleview();
                            },
                            child: Text(
                              'Vous n\'avez pas de compte ? Inscrivez-vous',
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height / 60,
                                  fontFamily: 'SegoeUI',
                                  //decoration: TextDecoration.underline,
                                  color: Color(0xFF00B9FF)),
                            )),
                        height: MediaQuery.of(context).size.height / 40,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 65,
                      ),
                      SizedBox(
                        child: FlatButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return ResetPassword();
                                },
                              ));
                            },
                            child: Text(
                              'Mot de passe oublié ?',
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height / 60,
                                  fontFamily: 'SegoeUI',
                                  //decoration: TextDecoration.underline,
                                  color: Color(0xFF00B9FF)),
                            )),
                        height: MediaQuery.of(context).size.height / 40,
                      ),
                      SizedBox(
                  height: MediaQuery.of(context).size.height / 80,
                ),
                    ]),
                  ),
                )),
              ]),
            ),
          );
  }
}
