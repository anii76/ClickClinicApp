import 'package:click_clinic/services/auth.dart';
import 'package:flutter/material.dart';

//repeat it kima delete account + email verification
class EmailSet extends StatefulWidget {
  @override
  _EmailSetState createState() => _EmailSetState();
}

class _EmailSetState extends State<EmailSet> {
  final AuthService _auth = AuthService();
  String _currentEmail = '';
  String _email = ''; 
  String _error = '';
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

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
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
              child: Padding(
        padding: const EdgeInsets.all(80.0),
        child: Form(
          key: _formKey,
          child: Column(children: [
            TextFormField(
              initialValue: _currentEmail,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mail_outline,
                      color: Colors.grey[400], size: 40),
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
              height: 30.0,
            ),
            SizedBox(
              child: RaisedButton(
                  onPressed: () async {
                    try{
                      if (_formKey.currentState.validate()){
                      setState(() =>loading = true );
                      await _auth.changeEmail(_email);
                    }
                    }catch(e){
                      print("Error: $e");
                      setState(() {
                        _error = e.message;
                        _showErrorDialog();
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
                          '      Update Email',
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
            Center(
              child: loading ? CircularProgressIndicator() : Text(''),
            )
          ]),
        ),
      ))),
    );
  }

  void _getMail() async { 
    await _auth
        .getCurrentUserInfo()
        .then((value) => _currentEmail = value.email);
  }

  @override
  void initState() {
    _getMail();
    super.initState();
  }

}
