import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_anis/Inscription.dart';

class Finaliser extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Finaliser();
  }
}

class _Finaliser extends State<Finaliser> {
  bool check1 = false;
  bool check2= false;
  bool check3= false;
  bool check4= false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
        child: Container(
            child: Center(
                child: Column(
      children: <Widget>[

        Padding(
          padding: EdgeInsets.only(top: 250),
        ),
        Text(
          "Sélectionnez les services", style: TextStyle(
          fontSize: 25,fontWeight: FontWeight.w500)
        ),
        Text("que vous souhaitez offrir", style: TextStyle(
          fontSize: 25,fontWeight: FontWeight.w500)),
        Padding(
          padding: EdgeInsets.only(top: 30),
        ),
        Row(children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 40),
          ),
          Checkbox(
            value: check1,
            onChanged: (bool vaal) {
              setState(() {
                check1 = vaal;
              });
            },
          ),
          Text("Loger des patients",style: TextStyle(
              fontSize: 20),),
        ]),
        Row(children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 40),
          ),
          Checkbox(
            value: check2,
            onChanged: (bool vaal) {
              setState(() {
                check2 = vaal;
              });
            },
          ),
          Text("Apporter des médicament",style: TextStyle(
              fontSize: 20)),
        ]),
        Row(children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 40),
          ),
          Checkbox(
            value: check3,
            onChanged: (bool vaal) {
              setState(() {
                check3 = vaal;
              });
            },
          ),
          Text("Donner du sang",style: TextStyle(
              fontSize: 20)),
        ]),
        Row(children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 40),
          ),
          Checkbox(
            value: check4,
            onChanged: (bool vaal) {
              setState(() {
                check4 = vaal;
              });
            },
          ),
          Text("Autre(précisez en bas)",style: TextStyle(
              fontSize: 20)),
        ]),
        SizedBox(
          child: TextField(
            decoration: InputDecoration(

              hintText: "En cas d'autres sérvices précisez-les ici",
            ),
          ),
          width: 350,
        ),
        Padding(
          padding: EdgeInsets.only(top: 30),
        ),
        SizedBox(
          child: RaisedButton(
            color: Colors.lightBlue,
            onPressed: () {

            },
            child: Text(
              "Inscription",
              style: TextStyle(fontSize: 19, color: Colors.white),
            ),
            shape: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(50)),
          ),
          width: 200,
          height: 50,
        ),
        /**Row(

children: <Widget>[
  Padding(
    padding: EdgeInsets.only(left: 20),
  ),

          SizedBox(

          child: OutlineButton(

          highlightedBorderColor:
              Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
            onPressed:() {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return Inscription();
              },));
            },
          child: Text(
            "Retour",
            style: TextStyle(fontSize: 18, color: Colors.lightBlue,),
          ),
          shape: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(50)),
        ),
          ),
],

              ) **/
      ],
    ))));
  }
}

class MyFinaliser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage image = new AssetImage("Assests/images/background.png");
    Image myimg = new Image(image: image);
    return Container(
      child: myimg,
    );
  }
}
