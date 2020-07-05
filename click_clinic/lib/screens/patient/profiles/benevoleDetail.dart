import 'package:click_clinic/shared/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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

    return etablisData != null ? Material(
              child: Scaffold(
                  body: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF4F8F9), //background
                    ),
                  ),
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
                  Center(
                      child: Column(children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 150)),
                    Text(
                      etablisData["Nom"],
                      style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontFamily: 'Poppins-Medium'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 40),
                    ),
                    //Text('Adresse : '+etablisData["Adress"]),
                    Text("Telephone :"+etablisData["Tel"]),
                  ])),
                ],
              )),
            ): Loading();
  }
}