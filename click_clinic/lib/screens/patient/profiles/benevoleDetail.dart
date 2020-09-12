import 'package:click_clinic/shared/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BenevoleDetails extends StatefulWidget {
  final DocumentSnapshot collection;
  BenevoleDetails({@required this.collection});
  @override
  _BenevoleDetailsState createState() => _BenevoleDetailsState();
}

class _BenevoleDetailsState extends State<BenevoleDetails> {
  @override
  Widget build(BuildContext context) {
    var etablisData = widget.collection.data;
    var photo, nom, adresse, tel, description, bloodType, services;
    photo = etablisData["ProfilePicPath"];
    nom = etablisData["Nom"];
    adresse = etablisData["Adress"] != null ? etablisData["Adress"] : '';
    tel = etablisData["Tel"] != null ? etablisData["Tel"] : '';
    description =
        etablisData["Description"] != null ? etablisData["Description"] : '';
    bloodType = etablisData["Service2"] && etablisData["BloodType"] != null
        ? etablisData["BloodType"]
        : '';
    services = '';
    if (etablisData["Service1"]) services += ' Medicaments .';
    if (etablisData["Service2"]) services += ' Don de sang .';
    if (etablisData["Service3"]) services += ' Logement des malades .';
    services += ' $description';

    return etablisData != null
        ? Scaffold(
            body: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF4F8F9), //background
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.8,
                  decoration: BoxDecoration(
                    color: Color(0xFF00B9FF),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(77),
                        bottomRight: Radius.circular(77)),
                  ),
                ),
                Align(
                  alignment: Alignment(0, -0.87),
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
                            child: Image.asset("assets/icones/retour.png"),
                            backgroundColor: Color(0xFF00B9FF),
                          ),
                          Text(
                            "Détails                                             ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.height / 45,
                                fontFamily: 'Poppins-Light',
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, -0.68),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 13,
                    ),
                    child: Flexible(
                      child: Text(
                        nom,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 29,
                            color: Colors.white,
                            fontFamily: 'Poppins-Medium'),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, -0.4),
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: photo == null || photo == ''
                        ? AssetImage('assets/images/man.png')
                        : NetworkImage(photo),
                    radius: MediaQuery.of(context).size.height / 10,
                  ),
                ),
                Align(
                  alignment: Alignment(0, -0.05),
                  child: etablisData["Disponibilite"]
                      ? Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: <Widget>[
                          Text(
                            'Diponible  ',
                            style: TextStyle(
                              fontFamily: 'Poppins-Regular',
                              fontSize: MediaQuery.of(context).size.height / 60
                            ),
                            ),
                          CircleAvatar(
                            backgroundColor: Colors.green,
                            radius: MediaQuery.of(context).size.height / 170,
                          ),
                        ],
                      ) 
                      : Text('Non disponible'),
                ),
                Align(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 1.9,
                      left: MediaQuery.of(context).size.width / 10,
                      right: MediaQuery.of(context).size.width / 10,
                    ),
                    child: Column(children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/Group 2477.png',
                            height: MediaQuery.of(context).size.height / 20,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 17,
                          ),
                          Flexible(
                            child: Text(
                              adresse,
                              style: TextStyle(
                                fontFamily: "SegoeUI",
                                fontSize:
                                    MediaQuery.of(context).size.height / 45,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 105,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0.0),
                        child: Divider(
                          color: Colors.grey[300],
                          thickness: MediaQuery.of(context).size.height / 300,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 105,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/a.png',
                            height: MediaQuery.of(context).size.height / 20,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 17,
                          ),
                          Flexible(
                            child: Text(
                              services,
                              style: TextStyle(
                                fontFamily: "SegoeUI",
                                fontSize:
                                    MediaQuery.of(context).size.height / 45,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 135,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0.0),
                        child: Divider(
                          color: Colors.grey[300],
                          thickness: MediaQuery.of(context).size.height / 300,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 135,
                      ),
                      bloodType != ''
                          ? Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/sang_.png',
                                  height:
                                      MediaQuery.of(context).size.height / 20,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 17,
                                ),
                                Flexible(
                                  child: Text(
                                    bloodType,
                                    style: TextStyle(
                                      fontFamily: "SegoeUI",
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              45,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Text(''),
                      bloodType != ''
                          ? SizedBox(
                              height: MediaQuery.of(context).size.height / 135,
                            )
                          : Text(''),
                      bloodType != ''
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0.0),
                              child: Divider(
                                color: Colors.grey[300],
                                thickness:
                                    MediaQuery.of(context).size.height / 300,
                              ),
                            )
                          : Text(''),
                      bloodType != ''
                          ? SizedBox(
                              height: MediaQuery.of(context).size.height / 135,
                            )
                          : Text(''),
                    ]),
                  ),
                ),
                //call & email icons
                Align(
                    alignment: Alignment(0.7, 0.9),
                    child: CircleAvatar(
                      backgroundColor: Color(0xFF00B9FF),
                      radius: MediaQuery.of(context).size.height / 25,
                      child: FlatButton(
                        onPressed: () {
                                call(tel);
                              },
                        child: Icon(
                        Icons.phone,
                        color: Colors.white,
                        size: MediaQuery.of(context).size.height / 25,
                      )),
                    )),
                Align(
                    alignment: Alignment(-0.7, 0.9),
                    child: CircleAvatar(
                      backgroundColor: Color(0xFF00B9FF),
                      radius: MediaQuery.of(context).size.height / 25,
                      child: FlatButton(
                        onPressed: () {},
                        child: Icon(
                        Icons.mail,
                        color: Colors.white,
                        size: MediaQuery.of(context).size.height / 25,
                      )),
                    )),
              ],
            ),
          )
        : Loading();
  }

  void call(String phone) {
    String phoneno = 'tel:' + phone;
    launch(phoneno);
  }
}
