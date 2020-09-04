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

  //text field state
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
            body: Stack(//mainAxisSize: MainAxisSize.min,
                children: [
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
              padding: const EdgeInsets.only(top: 40, right: 50, left: 50),
              child: Image.asset(
            connexion,
            //alignment: Alignment.topCenter,
            height: MediaQuery.of(context).size.height / 2.3,
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
                //height: ,
              child: Padding(
            padding: EdgeInsets.only(top: 370, left: 50, right: 50),
            child: Form(
              key: _formKey,
              child: Column(children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            //resizing icons
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mail_outline,
                      color: Colors.grey[400], size: 40,),
                  hintText: ' Tappez votre e-mail',
                  hintStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[400],
                    fontFamily: 'Poppins-Light',
                  ),
                  labelText: ' Adresse e-mail',
                  labelStyle: TextStyle(
                      fontFamily: 'SegoeUI', color: Color(0xFF00B9FF))),
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
              height: 10.0,
            ),
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
                      fontFamily: 'SegoeUI', color: Color(0xFF00B9FF))),
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
              height: 30.0,
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
                      //changed
                      borderRadius: BorderRadius.circular(50)),
                  color: Color(0xFF00B9FF),
                  focusColor: Colors.blue[400],
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '      CONNEXION',
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
              ]),
            ),
              )),
              //Text form
            ]),
          );
  }
}
