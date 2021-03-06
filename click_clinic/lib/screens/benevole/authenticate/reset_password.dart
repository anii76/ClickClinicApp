import 'package:flutter/material.dart';
import 'package:click_clinic/services/auth.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String _resetPasswordEmail = '';
  bool _isEmailVerified = false;
  String _error = '';

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
  void initState() {
    super.initState();
    _checkEmailVerification();
  }

  void _checkEmailVerification() async {
    _isEmailVerified = await _auth.isEmailVerified();
  }

  void _resentVerifyEmail() {
    _auth.sendEmailVerification();
    _showVerifyEmailSentDialog();
  }

  void _showVerifyEmailDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Verify your account"),
          content: new Text("Please verify account in the link sent to email"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Resent link"),
              onPressed: () {
                Navigator.of(context).pop();
                _resentVerifyEmail();
              },
            ),
            new FlatButton(
              child: new Text("Dismiss"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showVerifyEmailSentDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Verify your account"),
          content:
              new Text("Link to verify account has been sent to your email"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Dismiss"),
              onPressed: () {
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
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Container(
            color: Color(0xFFF4F8F9),
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
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 20,
              left: MediaQuery.of(context).size.width / 20,
            ),
            child: FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.height / 30,
                child: Image.asset("assets/icones/retour.png"),
                backgroundColor: Colors.white12,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 7.5,
              ),
              child: Image.asset(
                "assets/images/pass_reset.PNG", 
                height: MediaQuery.of(context).size.height / 4,
              ),
            ),
          ),
          SizedBox(
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 2.45),
              child: Center(
                child: Text(
                  "Mot de passe oublié",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins-Medium',
                    fontSize: MediaQuery.of(context).size.height / 36,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 2.1),
              child: Center(
                child: Text(
                    "Saisissez votre adresse e-mail\npour recevoir un code de récupération",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins-Light',
                      fontSize: MediaQuery.of(context).size.height / 55,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
            ),
          ),
          SizedBox(
            child: Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 1.8,
                left: MediaQuery.of(context).size.width / 10,
                right: MediaQuery.of(context).size.width / 10,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                          setState(() => _resetPasswordEmail = val);
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 6,
                      ),
                      SizedBox(
                        child: RaisedButton(
                            onPressed: () async {
                              try {
                                if (_formKey.currentState.validate()) {
                                  setState(() => loading = true);
                                  await _auth.sendPasswordResetMail(
                                      _resetPasswordEmail);
                                  _showVerifyEmailSentDialog();
                                  _checkEmailVerification();
                                  if (_isEmailVerified) {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return Confirmation();
                                      },
                                    ));
                                  } else {
                                    setState(() {
                                      _showVerifyEmailDialog();
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
                              'Envoyer le code',
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height / 45,
                                  color: Colors.white,
                                  fontFamily: 'SegoeUI'),
                            )),
                        width: MediaQuery.of(context).size.width / 1.6,
                        height: MediaQuery.of(context).size.height / 15,
                      ),
                      Center(
                        child: loading ? CircularProgressIndicator() : Text(''),
                      )
                    ]),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

//rebuild page with singlechildscrollview
//add return button

//not working yet
class Confirmation extends StatefulWidget {
  @override
  _ConfirmationState createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String _resetPassword = '';
  String _confirmPassword;
  bool _isEmailVerified;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SizedBox(
                child: Padding(
                    padding: const EdgeInsets.all(80.0),
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
                              onPressed: null,
                              shape: RoundedRectangleBorder(
                                  //changed
                                  borderRadius: BorderRadius.circular(50)),
                              color: Color(0xFF00B9FF),
                              focusColor: Colors.blue[400],
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '      Verify Email',
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
