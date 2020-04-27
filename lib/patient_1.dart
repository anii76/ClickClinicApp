import 'package:clickclinique/acceuil.dart';
import 'package:clickclinique/medecin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'autre.dart';
import 'medecin.dart';
class Patient extends StatefulWidget {
  @override
  _PatientState createState() => _PatientState();
}

class _PatientState extends State<Patient> {
  @override
  Widget build(BuildContext context) {
    return Material(

      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
            ),
          ),
          Container(
            width: 500.3,
            height: 280.0,
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(77),
                  bottomRight: Radius.circular(77)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70,left: 290),
            child: CircleAvatar(
              radius:20,
              child: Image.asset("assets/images/patient.png"),
              backgroundColor: Colors.white,
            ),
          ),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(top: 105 ,left: 260, right: 5),
                  child:FlatButton(
                    color: Colors.lightBlueAccent[200],
                    onPressed: () {},
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Patient ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        CircleAvatar(
                          radius:10,
                          child: Image.asset("assets/icones/selectionner.png", color: Colors.white,),
                          backgroundColor: Colors.lightBlueAccent[200],
                        ),
                      ],
                    ),
                  ),
                ),
          ),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(top: 70 ,left: 30, right: 220),
              child: RaisedButton(
                color: Colors.lightBlueAccent[200],
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return MyScreen();
                  },));
                },
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius:10,
                      child: Image.asset("assets/icones/menu.png"),
                      backgroundColor: Colors.lightBlueAccent[200],
                    ),
                    Text(
                      " Menu",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                shape: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),

          ),
          Center(
            child: Column(
              children: <Widget>[

                Padding(padding: EdgeInsets.only(top: 150)),
                Text(
                  'Que cherchez-vous ?',
                  style: TextStyle(fontSize: 28, color: Colors.white),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                ),
                SizedBox(
                  child: RaisedButton(
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Medecin();
                      },));
                    },
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 35,
                          child: Image.asset("assets/icones/medecin.png"),
                          backgroundColor: Colors.blueGrey[100],
                        ),
                        Text(
                          "     Un médecin",
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                    shape: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  width: 300,
                  height: 80,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                SizedBox(
                  child: RaisedButton(
                    color: Colors.white,
                    onPressed: () {},
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 35,
                          child: Image.asset("assets/icones/hopital.png"),
                          backgroundColor: Colors.lightGreen[100],
                        ),
                        Text(
                          "     Un hôpital",
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                    shape: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  width: 300,
                  height: 80,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                SizedBox(
                  child: RaisedButton(
                    color: Colors.white,
                    onPressed: () {},
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 35,
                          child: Image.asset("assets/icones/phramacie.png"),
                          backgroundColor: Colors.lightGreen[100],
                        ),
                        Text(
                          "     Une pharmacie",
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                    shape: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  width: 300,
                  height: 80,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                SizedBox(
                  child: RaisedButton(
                    color: Colors.white,
                    onPressed: () {},
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 35,
                          child: Image.asset("assets/icones/sang.png"),
                          backgroundColor: Colors.red[100],
                        ),
                        Text(
                          "     Du sang",
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                    shape: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  width: 300,
                  height: 80,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                SizedBox(
                  child: RaisedButton(
                    color: Colors.white,
                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context){
                      return Autre();
                    },));},
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 35,
                          child: Image.asset("assets/icones/autre.png"),
                          backgroundColor: Colors.grey[200],
                        ),
                        Text(
                          "     Autre",
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                    shape: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  width: 300,
                  height: 80,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
Widget getDrawerContent(BuildContext context){
  return ListView(
    children: <Widget>[
     DrawerHeader(
       padding: EdgeInsets.fromLTRB(0,0,0,0),
         child: Container(
           color: Colors.black,
         )
     )
    ],
  );
}