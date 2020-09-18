import 'dart:async';

import 'package:click_clinic/models/user.dart';
import 'package:click_clinic/services/auth.dart';
import 'package:click_clinic/services/database.dart';
import 'package:click_clinic/shared/acceuil.dart';
import 'package:click_clinic/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ParaDuCompte extends StatefulWidget {
  @override
  _ParaDuCompteState createState() => _ParaDuCompteState();
}

class _ParaDuCompteState extends State<ParaDuCompte> {
  final List<String> para = <String>[
    "Adresse e-mail",
    "N° de téléphone",
    "Mot de passe",
    "Supprimer le compte"
  ];
  final List<String> img = <String>[
    "email.png",
    "tele.png",
    "cle.png",
    "sup.png"
  ];
  final List<String> sub = <String>[
    "Changez votre adresse de\ncourriel",
    "Changez votre numéro de\ntéléphone",
    "Modifiez votre mot de\npasse",
    "Désactivez définitivement\nvotre compte"
  ];
  final List<String> textu = <String>[
    "Nouveau e-mail",
    "Numéro de télephone",
    "Nouveau mot de passe",
    "Entrez votre mot de passe"
  ];

  final _formKey = GlobalKey<FormState>();

  String _confirmPassword = '';
  String _password;
  String _email;
  String _tel;
  var _state = 0;
  bool finished = false;

  String _error =
      'Etes-vous sur de bien vouloir supprimer votre compte de bénévole ?\nCette opération est irréversible.';

  void _showConfirmDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(
            "Suppression du compte",
            style: TextStyle(
              fontFamily: 'SegoeUI',
              fontWeight: FontWeight.w500,
              fontSize: MediaQuery.of(context).size.height / 37,
            ),
          ),
          content: new Text(
            _error,
            style: TextStyle(
              fontFamily: 'Poppins-Light',
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text(
                "Procéder",
                style: TextStyle(
                  fontFamily: 'SegoeUI',
                  fontWeight: FontWeight.w200,
                  color: Color(0xFF00B9FF),
                ),
              ),
              onPressed: () async {
                try {
                  await AuthService().deleteUser();
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
              child: new Text(
                "Annuler",
                style: TextStyle(
                    fontFamily: 'SegoeUI',
                    fontWeight: FontWeight.w200,
                    color: Colors.black),
              ),
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

  void _deleteAccount() async {
    await AuthService().connexion(_email, _password).then((_) {
      finished = true;
    });
    _showConfirmDialog();
  }

  void _resetPassword() async {
    try {
      if (_formKey.currentState.validate()) {
        //setState(() =>loading = true );
        //await AuthService().connexion(_email, _password);
        await AuthService().changePassword(_confirmPassword).then((_) {
          finished = true;
        });
      }
    } catch (e) {
      print("Error: $e");
      setState(() {
        _error = e.message;
        _showErrorDialog();
      });
    }
  }

  void _resetEmail() async {
    try {
      if (_formKey.currentState.validate()) {
        //setState(() =>loading = true );
        await AuthService().connexion(_email, _confirmPassword);
        await AuthService().changeEmail(_password).then((_) {
          finished = true;
        });
      }
    } catch (e) {
      print("Error: $e");
      setState(() {
        _error = e.message;
        _showErrorDialog();
      });
    }
  }

  void animateButton() {
    setState(() {
      _state = 1;
    });

    Timer(Duration(milliseconds: 3300), () {
      setState(() {
        if (finished) {
          _state = 2;
        } else {
          _state = 3;
        }
      });
    });

    Timer(Duration(milliseconds: 4300), () {
      setState(() {
        _state = 0;
      });
    });
  }

  Widget loading() {
    if (_state == 3) {
      return Icon(Icons.close, color: Colors.white);
    } else if (_state == 1) {
      return Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 55,
          width: MediaQuery.of(context).size.height / 55,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
      );
    } else {
      return Icon(Icons.check, color: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).benevole,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Scaffold(
              body: Column(children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height / 28,
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 3,
                        decoration: BoxDecoration(
                          color: Color(0xFF00B9FF),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(77),
                              bottomRight: Radius.circular(77)),
                        ),
                      ),
                      Positioned(
                        bottom: 25,
                        right: 25,
                        left: 25,
                        top: -50,
                        child: Align(
                          alignment: Alignment(-0.45, -0.45),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height / 15,
                            child: RaisedButton(
                              color: Color(0xFF00B9FF),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 10, //change
                                    child:
                                        Image.asset("assets/images/Retour.png"),
                                    backgroundColor: Color(0xFF00B9FF),
                                  ),
                                  Text(
                                    "      Paramètres du compte",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                40,
                                        fontFamily: 'Poppins-Light'),
                                  ),
                                ],
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Column(children: <Widget>[
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 7),
                          SizedBox(
                            child: Image.asset(
                              "assets/images/OBJECTS.png",
                              height: MediaQuery.of(context).size.height / 8,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) =>
                        ExpansionTile(
                            leading: CircleAvatar(
                              radius: MediaQuery.of(context).size.height / 37,
                              child: Image.asset(
                                "assets/images/${img[index]}",
                                height: MediaQuery.of(context).size.height / 20,
                              ),
                              backgroundColor: Colors.white10,
                            ),
                            subtitle: Text(sub[index],
                                style: TextStyle(
                                  fontFamily: 'Poppins-Regular',
                                  color: Color(0x35000000),
                                  fontSize:
                                      MediaQuery.of(context).size.height / 50,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                )),
                            backgroundColor: Colors.white10,
                            title: Text(para[index],
                                style: TextStyle(
                                  fontFamily: 'Poppins-Medium',
                                  color: Color(0xff000000),
                                  fontSize:
                                      MediaQuery.of(context).size.height / 40,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                )),
                            children: [
                          para[index] == para[1]
                              ? Column(
                                  children: <Widget>[
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          1.2,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              8,
                                      child: Card(
                                        color: Colors.white,
                                        child: Row(
                                          children: <Widget>[
                                            Flexible(
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          10,
                                                ),
                                                child: TextFormField(
                                                  initialValue: userData.tel,
                                                  decoration: InputDecoration(
                                                    hintText: textu[index],
                                                    hintStyle: TextStyle(
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              45,
                                                      color: Colors.grey[400],
                                                      fontFamily:
                                                          'Poppins-Light',
                                                    ),
                                                  ),
                                                  style: TextStyle(
                                                      fontFamily:
                                                          'Poppins-Regular'),
                                                  onChanged: (val) {
                                                    setState(() => _tel = val);
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                      ),
                                    ),
                                    RaisedButton(
                                        onPressed: () async {
                                          setState(() {
                                            if (_state == 0) {
                                              animateButton();
                                            }
                                          });

                                          if (_tel != null) {
                                            await DatabaseService(uid: user.uid)
                                                .updateTel(_tel)
                                                .then((_) {
                                              print(userData.tel);
                                              if (userData.tel == _tel)
                                                finished = true;
                                              print('is finished');
                                            });
                                          }
                                        },
                                        child: _state == 0
                                            ? Text(
                                                'Confirmer',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Poppins-Light',
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          55,
                                                ),
                                              )
                                            : loading(),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        color: Color(0xFF00B9FF)),
                                  ],
                                )
                              : Form(
                                  key: _formKey,
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.2,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                8,
                                        child: Card(
                                          color: Colors.white,
                                          child: Row(
                                            children: <Widget>[
                                              Flexible(
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            10,
                                                  ),
                                                  child: TextFormField(
                                                    initialValue:
                                                        para[index] == para[0]
                                                            ? _email
                                                            : null,
                                                    decoration: InputDecoration(
                                                      hintText: textu[index],
                                                      hintStyle: TextStyle(
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            45,
                                                        color: Colors.grey[400],
                                                        fontFamily:
                                                            'Poppins-Light',
                                                      ),
                                                    ),
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'Poppins-Regular'),
                                                    validator: para[index] ==
                                                            para[0]
                                                        ? (val) => (val
                                                                    .isEmpty ||
                                                                !val.contains(
                                                                    '@'))
                                                            ? 'Entrez email valide'
                                                            : null
                                                        : (val) => val.length <
                                                                6
                                                            ? 'mot de passe doit etre au min 6 caracteres'
                                                            : null,
                                                    obscureText:
                                                        !(para[index] ==
                                                            para[0]),
                                                    onChanged: (val) {
                                                      setState(() =>
                                                          _password = val);
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.2,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                8,
                                        child: Card(
                                          color: Colors.white,
                                          child: Row(
                                            children: <Widget>[
                                              Flexible(
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            10,
                                                  ),
                                                  child: TextFormField(
                                                    decoration: InputDecoration(
                                                      hintText:
                                                          'Re-entrez votre mot de passe',
                                                      hintStyle: TextStyle(
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            45,
                                                        color: Colors.grey[400],
                                                        fontFamily:
                                                            'Poppins-Light',
                                                      ),
                                                    ),
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'Poppins-Regular'),
                                                    validator: !(para[index] ==
                                                            para[0])
                                                        ? (val) => val !=
                                                                _password
                                                            ? 'les champs ne sont pas identiques'
                                                            : null
                                                        : null,
                                                    obscureText: true,
                                                    onChanged: (val) {
                                                      setState(() =>
                                                          _confirmPassword =
                                                              val);
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                        ),
                                      ),
                                      RaisedButton(
                                          onPressed: () {
                                            setState(() {
                                              if (_state == 0) {
                                                animateButton();
                                              }
                                            });
                                            switch (index) {
                                              case 0:
                                                {
                                                  _resetEmail();
                                                }
                                                break;
                                              case 2:
                                                {
                                                  _resetPassword();
                                                }
                                                break;
                                              case 3:
                                                {
                                                  _deleteAccount();
                                                }
                                            }
                                          },
                                          child: _state == 0
                                              ? Text(
                                                  'Confirmer',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'Poppins-Light',
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            55,
                                                  ),
                                                )
                                              : loading(),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          color: Color(0xFF00B9FF)),
                                    ],
                                  ),
                                ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 70,
                          ),
                        ]),
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(color: Colors.grey),
                    itemCount: 4,
                    padding:
                        EdgeInsets.all(MediaQuery.of(context).size.height / 45),
                    scrollDirection: Axis.vertical,
                    addAutomaticKeepAlives: true,
                    cacheExtent: 100, //idk
                  ),
                ),
              ]),
            );
          } else
            Loading();
        });
  }

  void initialize() async {
    await AuthService()
        .getCurrentUserInfo()
        .then((value) => _email = value.email);
  }

  @override
  void initState() {
    initialize();
    super.initState();
  }
}
