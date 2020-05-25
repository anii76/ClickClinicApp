import 'package:click_clinic/benevole/services/auth.dart';
import 'package:click_clinic/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

  String error = '';
  final String connexion = 'assets/connexion.png';

  //text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body: Container(
              //padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: SingleChildScrollView(
                child: Stack(//mainAxisSize: MainAxisSize.min,
                children: [
                  
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF4F8F9),
                    ),
                  ),
                  
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 310.0,
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
                      padding: const EdgeInsets.only(top: 40, right: 50, left: 50),
                      child: Image.asset(
                        connexion,
                    //alignment: Alignment.topCenter,
                        height: 350,
                      ),
                    ),
                  ),

                  
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 350, left: 60, right: 50),
                      child: Text(
                    '   Heureux de vous revoir !',
                    style: TextStyle(
                      fontSize: 21,
                      color: Colors.black,
                      fontFamily: 'Poppins-Regular',
                      fontWeight: FontWeight.w700,
                      ),
                     ),
                    ),
                  ),
                  
                  SizedBox(
                    child: Padding(
                      padding: EdgeInsets.only(top: 370, left: 50, right: 50),
                      child: Form(
                    key: _formKey,
                    child: Column(children: <Widget>[
                      SizedBox(
                        height: 30.0,
                      ),
                     
                    TextFormField(
                      decoration: InputDecoration(
                         prefixIcon: Icon(
                              Icons.mail_outline,
                              color: Colors.grey[400],
                              size: 40
                            ),
                            hintText: ' Tappez votre e-mail',
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[400],
                              fontFamily: 'Poppins-Light',
                            ),
                            labelText: ' Adresse e-mail',
                            labelStyle: TextStyle(
                              fontFamily: 'SegoeUI', 
                              color: Color(0xFF00B9FF)
                            )
                          ),
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                            fontFamily: 'Poppins-Regular'
                          ),
                          validator: (val) => (val.isEmpty || !val.contains('@'))
                              ? 'Entrer email valide'
                              : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                        ),   

                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                              Icons.lock_open,
                              color: Colors.grey[400],
                              size: 40
                            ),
                          hintText: ' Tappez votre mot de passe',
                          hintStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[400],
                            fontFamily: 'Poppins-Light',
                          ),
                          labelText: ' Mot de passe',
                          labelStyle: TextStyle(
                            fontFamily: 'SegoeUI', 
                            color: Color(0xFF00B9FF)
                          )
                        ),
                         style: TextStyle(
                            fontFamily: 'Poppins-Regular'
                          ),
                        validator: (val) => val.length < 6
                            ? 'mot de passe doit etre au min 6 caracteres'
                            : null,
                        obscureText: true,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),

                      SizedBox(
                        height: 30.0,
                      ),
                      SizedBox(
                        child: RaisedButton(
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() => loading = true);
                            dynamic result =
                                await _auth.connexion(email, password);

                            if (result == null) {
                              setState(() {
                                error =
                                    'Could not sign in with those credentials';
                                loading = false;
                              });
                            }
                          }
                        },
                        shape: RoundedRectangleBorder( //changed
                          borderRadius: BorderRadius.circular(50)),
                        color: Color(0xFF00B9FF),
                        focusColor: Colors.blue[400],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                           '      CONNEXION',
                            style: TextStyle(fontSize: 17.5, color: Colors.white, fontFamily: 'SegoeUI'),
                            ),
                            SizedBox(width: 40),
                            Icon(
                              Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 19,
                            )
                          ])
                      ),
                      width: 250,
                      height: 45,
                      ),

                      SizedBox(
                        height: 45,
                      ),
            
                      SizedBox(
                          child: FlatButton(
                            onPressed: () {
                              widget.toggleview();
                            },
                            child: Text(
                              'Vous n\'avez pas de compte ? Inscrivez-vous',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: 'SegoeUI',
                                  //decoration: TextDecoration.underline,
                                  color: Color(0xFF00B9FF)),
                            )),
                          height: 17,
                      ),
                      SizedBox(
                          child: FlatButton(
                            onPressed: () {},
                            child: Text(
                              'Mot de passe oublié ?',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: 'SegoeUI',
                                  //decoration: TextDecoration.underline,
                                  color: Color(0xFF00B9FF)),
                            )),
                          height: 17,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          error.isNotEmpty ? Icon(Icons.warning, color: Colors.red) : Text(''),
                          SizedBox(width: 5),
                          Text(
                          error,
                          style: TextStyle(color: Colors.red, fontSize: 13.0, fontFamily: 'Poppins-Regular'),
                      ),
                        ],
                      ),
                    ]),
                  ),
                    )),
                  //Text form
                ]))),
          );
  }
}
