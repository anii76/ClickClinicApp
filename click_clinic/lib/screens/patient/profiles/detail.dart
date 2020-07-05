import 'package:click_clinic/models/etablissment.dart';
import 'package:click_clinic/services/searchResult.dart';
import 'package:click_clinic/shared/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final String id;
  final DocumentSnapshot collection;
  Details(this.id,{@required this.collection});
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  @override
  Widget build(BuildContext context) {
    
  
   var etablisData = widget.collection.data;
    
    return  etablisData != null ? Material(
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
                      etablisData["Name"],
                      style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontFamily: 'Poppins-Medium'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 40),
                    ),
                    Text('Adresse : '+etablisData["Adress"]),
                    etablisData["Speciality"] != null ? Text("Telephone :"+etablisData["Phone number"])
                    : Row(
                      children: <Widget>[
                        Text("Telephone : 0"),
                        Text('${etablisData["Phone"]}'),
                      ],
                    ),
                    etablisData["Speciality"] != null ? Text("Specialite :"+etablisData["Speciality"])
                    : Text("Proprietaire :"+etablisData["Owner"]),
                  ])),
                ],
              )),
            ): Loading();
  }
}
