import 'package:click_clinic/models/etablissment.dart';
import 'package:click_clinic/services/searchResult.dart';
import 'package:click_clinic/shared/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Details extends StatefulWidget {
  final String id;
  final DocumentSnapshot collection;
  Details(this.id, {@required this.collection});
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    bool toggle = false;
    var etablisData = widget.collection.data;
    var phone = '', detail;
    if (etablisData["Speciality"] != null) {
      phone = "+213 " + etablisData["Phone number"];
      detail = etablisData["Speciality"] == "Pharmacien"
          ? "Pharmacie"
          : etablisData["Speciality"];
      toggle = etablisData["Speciality"] != "Pharmacien" ? true : false;
    } else {
      detail = etablisData["Owner"];
      if (etablisData["Phone"] != '') {
        phone = "+213 " + "${etablisData["Phone"]}";
      } else {
        phone = " _ ";
      }
    }

    return etablisData != null ? Scaffold(
            body: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF4F8F9), //background
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.7,
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
                          radius: 10,
                          child: Image.asset("assets/icones/retour.png"),
                          backgroundColor: Color(0xFF00B9FF),
                        ),
                        Text(
                          "Détails                                             ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.height / 45,
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
                      etablisData["Name"],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 31 , 
                          color: Colors.white,
                          fontFamily: 'Poppins-Medium'),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, -0.35),
                child: toggle
                    ? CircleAvatar(
                        backgroundImage: AssetImage(
                            'assets/images/man.png'), //change photo with default
                        backgroundColor: Colors.transparent,
                        radius:  MediaQuery.of(context).size.height / 10,
                      )
                    : Padding(
                        padding: EdgeInsets.only(
                          top:  MediaQuery.of(context).size.height / 45,
                          ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                              'assets/images/Mask Group 64.png',
                              height: MediaQuery.of(context).size.height / 5.7,
                              ), //change photo with default & 
                        ),
                      ),
              ),
              Align(
                alignment: Alignment(0, 0),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 2.7,
                    left: MediaQuery.of(context).size.width / 10,
                    right: MediaQuery.of(context).size.width / 10,
                  ), 
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Image.asset(
                              'assets/images/Group 2476.png',
                              height: MediaQuery.of(context).size.height / 20,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 17,
                            ),
                            Flexible(
                              child: Text(
                                detail,
                                style: TextStyle(
                                  fontFamily: "SegoeUI", 
                                  fontSize: MediaQuery.of(context).size.height / 45,
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
                            Image.asset('assets/images/Group 2477.png',
                              height: MediaQuery.of(context).size.height / 20,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 17,
                            ),
                            Flexible(
                              child: Text(
                                etablisData["Adress"],
                                style: TextStyle(
                                  fontFamily: "SegoeUI",
                                  fontSize: MediaQuery.of(context).size.height / 45,
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
                          children: <Widget>[
                            Image.asset('assets/images/tele.png',
                              height: MediaQuery.of(context).size.height / 20,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.height / 140,
                            ),
                            Flexible(
                                child: FlatButton(
                                onPressed: () {
                                  call(phone);
                                },
                                child: Flexible(
                                    child: Text(
                                    phone,
                                    style: TextStyle(
                                      fontFamily: "SegoeUI",
                                      fontSize: MediaQuery.of(context).size.height / 45,
                                    ),
                                  ),
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
                      ]),
                ),
              ),
            ],
          ))
        : Loading();
  }

  void call(String phone) {
    String phoneno = 'tel:' + phone;
    launch(phoneno);
  }
}
