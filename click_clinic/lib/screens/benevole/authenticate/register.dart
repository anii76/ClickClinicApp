import 'package:click_clinic/screens/benevole/authenticate/inscription.dart';
import 'package:click_clinic/screens/benevole/authenticate/services.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleview;
  Register({this.toggleview});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Inscription user = Inscription();
  final _formKey = GlobalKey<FormState>();

  //text field state
  String _email = '';
  String _password = '';
  String _tel = '';
  String _nom = 'Benevole';

//********************* */

//********************** */
  void _assign() {
    user.setNom(_nom);
    user.setTel(_tel);
    user.setEmail(_email);
    user.setPassword(_password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Container(
          child: Image.asset(
            'assets/images/inscription.png',
            height: MediaQuery.of(context).size.height / 2.5,
          ),
        ),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 2.5,
          ),
          child: Text(
            ' Inscrivez-vous, c\'est gratuit !',
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
            top: MediaQuery.of(context).size.height / 2.4,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height / 28,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person_outline,
                      color: Colors.grey[400],
                      size: MediaQuery.of(context).size.height / 25,
                    ),
                    hintText: ' Entrez votre nom complet',
                    hintStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 45,
                      color: Colors.grey[400],
                      fontFamily: 'Poppins-Light',
                    ),
                    labelText: ' Nom Complet',
                    labelStyle: TextStyle(
                        fontFamily: 'SegoeUI',
                        color: Color(0xFF00B9FF),
                        fontSize: MediaQuery.of(context).size.height / 55),
                  ),
                  style: TextStyle(fontFamily: 'Poppins-Regular'),
                  validator: (val) =>
                      (val.isEmpty) ? 'Entrer un nom valide' : null,
                  onChanged: (val) {
                    setState(() => _nom = val);
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 90,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.mail_outline,
                      color: Colors.grey[400],
                      size: MediaQuery.of(context).size.height / 25,
                    ),
                    hintText: ' Entrez votre e-mail',
                    hintStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 45,
                      color: Colors.grey[400],
                      fontFamily: 'Poppins-Light',
                    ),
                    labelText: ' Adresse e-mail',
                    labelStyle: TextStyle(
                        fontFamily: 'SegoeUI',
                        color: Color(0xFF00B9FF),
                        fontSize: MediaQuery.of(context).size.height / 55),
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
                  height: MediaQuery.of(context).size.height / 90,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock_open,
                      color: Colors.grey[400],
                      size: MediaQuery.of(context).size.height / 25,
                    ),
                    hintText: ' Entrez un mot de passe',
                    hintStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 45,
                      color: Colors.grey[400],
                      fontFamily: 'Poppins-Light',
                    ),
                    labelText: ' Mot de passe',
                    labelStyle: TextStyle(
                        fontFamily: 'SegoeUI',
                        color: Color(0xFF00B9FF),
                        fontSize: MediaQuery.of(context).size.height / 55),
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
                  height: MediaQuery.of(context).size.height / 90,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Colors.grey[400],
                      size: MediaQuery.of(context).size.height / 25,
                    ),
                    hintText: ' Entrez votre numéro',
                    hintStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 45,
                      color: Colors.grey[400],
                      fontFamily: 'Poppins-Light',
                    ),
                    labelText: ' Telephone',
                    labelStyle: TextStyle(
                        fontFamily: 'SegoeUI',
                        color: Color(0xFF00B9FF),
                        fontSize: MediaQuery.of(context).size.height / 55),
                  ),
                  keyboardType: TextInputType.phone,
                  style: TextStyle(fontFamily: 'Poppins-Regular'),
                  validator: (val) =>
                      (val.isEmpty) ? 'Entrer un tel valide' : null,
                  onChanged: (val) {
                    setState(() => _tel = val);
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 26,
                ),
                SizedBox(
                  child: RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _assign();
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return SetServices(user: user);
                          },
                        ));
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    color: Color(0xFF00B9FF),
                    focusColor: Colors.blue[400],
                    child: Text(
                      'INSCRIPTION',
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
                        'Vous avez déja un compte ? Connectez-vous',
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 63,
                            fontFamily: 'SegoeUI',
                            //decoration: TextDecoration.underline,
                            color: Color(0xFF00B9FF)),
                      )),
                  height: MediaQuery.of(context).size.height / 40,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 80,
                ),
              ],
            ),
          ),
        ),
      )
    ])));
  }
}
