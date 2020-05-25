import 'package:click_clinic/benevole/services/auth.dart';
import 'package:click_clinic/shared/loading.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleview;
  Register({this.toggleview});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  //text field state
  String email = '';
  String password = '';
  String tel = '';
  String nom = 'Benevole';

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

                  Container( //to remove later
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
                      child: Container(
                              child: Image.asset(
                          'assets/images/inscription.png',
                          //height: 310.0,
                        ),
                      ),
                    ),

                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 330, left: 40, right: 40),
                      child: Text(
                    ' Inscrivez-vous, c\'est gratuit !',
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
                      padding: EdgeInsets.only(top: 330, left: 50, right: 50),
                      child:Form(
                    key: _formKey,
                    child: Column(children: <Widget>[
                      SizedBox(
                        height: 30.0,
                      ),
                      
                      TextFormField(
                        decoration: InputDecoration(
                           prefixIcon: Icon(
                              Icons.person_outline,
                              color: Colors.grey[400],
                              size: 40
                            ),
                          hintText: ' Entrez votre nom complet',
                          hintStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[400],
                            fontFamily: 'Poppins-Light',
                          ),
                          labelText: ' Nom Complet',
                            labelStyle: TextStyle(
                              fontFamily: 'SegoeUI', 
                              color: Color(0xFF00B9FF)
                            )
                        ),
                        style: TextStyle(
                            fontFamily: 'Poppins-Regular'
                          ),
                        validator: (val) =>
                            (val.isEmpty) ? 'Entrer un nom valide' : null,
                        onChanged: (val) {
                          setState(() => nom = val);
                        },
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      
                      TextFormField(
                        decoration: InputDecoration(
                         prefixIcon: Icon(
                              Icons.mail_outline,
                              color: Colors.grey[400],
                              size: 40
                            ),
                            hintText: ' Entrez votre e-mail',
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
                        height: 6.0,
                      ),
                      
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                              Icons.lock_open,
                              color: Colors.grey[400],
                              size: 40
                            ),
                          hintText: ' Entrez un mot de passe',
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
                        height: 6.0,
                      ),
                      
                      TextFormField(
                        decoration: InputDecoration(
                           prefixIcon: Icon(
                              Icons.phone,
                              color: Colors.grey[400],
                              size: 40
                            ),
                          hintText: ' Entrez votre numéro',
                          hintStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[400],
                            fontFamily: 'Poppins-Light',
                          ),
                          labelText: ' Telephone',
                          labelStyle: TextStyle(
                            fontFamily: 'SegoeUI', 
                            color: Color(0xFF00B9FF)
                          )
                        ),
                        keyboardType: TextInputType.phone,
                        style: TextStyle(
                            fontFamily: 'Poppins-Regular'
                          ),
                        validator: (val) => (val.isEmpty || val.length != 10)
                            ? 'Entrer un tel valide'
                            : null,
                        onChanged: (val) {
                          setState(() => tel = val);
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
                              dynamic result = await _auth.inscription(
                                  email, password, nom, tel);

                              if (result == null) {
                                setState(() {
                                  error = 'Please supply a valid email ';
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
                             '      INSCRIPTION',
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
                        height: 35,
                      ),

                      SizedBox(
                          child: FlatButton(
                            onPressed: () {
                              widget.toggleview();
                            },
                            child: Text(
                              'Vous avez déja un compte ? Connectez-vous',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: 'SegoeUI',
                                  //decoration: TextDecoration.underline,
                                  color: Color(0xFF00B9FF)),
                            )),
                          height: 20,
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
                    ],
                    ),
                  ),
                  
                  ),
                  )
                ]))),
          );
  }
}
